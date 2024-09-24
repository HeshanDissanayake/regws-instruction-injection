import sys
import json
import re

def load_instruction_patterns(filename):
    with open(filename, 'r') as file:
        return json.load(file)

def gen_regsw(matched_operands):
    regsw = {'rs1':0, 'rs2':0, 'rd':0}
    for operand in regsw.keys():
        if operand in matched_operands.keys():
            matched_operand = matched_operands[operand]
            if 'n' in matched_operand:
                reg_bank = int(matched_operand.replace('n', ''))//32 + 1 
                regsw[operand] = reg_bank
    
    return f"\tregsw  x{regsw['rd']}, x{regsw['rs1']}, x{regsw['rs2']}"

def translate_registers(line, operands_list):
    pattern = re.compile(r'\bn([1-9]|[1-9][0-9]|100)\b')
    new_line = line
    for op in operands_list:
        if bool(pattern.search(op)): 
            translated_reg = 'x%d'%(int(op.replace('n', ''))%32)
            new_line = new_line.replace(op,translated_reg) 

    return new_line

def process_instruction(line, instruction_patterns):
    parts = line.split(maxsplit=1)
    if len(parts) > 1:
        # print(line)
        instruction_name = parts[0]
        operands = parts[1]
        operands_list = parse_operands(operands)
        translated_line = translate_registers(line, operands_list)
        matched_operands = match_operands(instruction_name, operands_list, instruction_patterns)
        new_inst = gen_regsw(matched_operands)

        return new_inst + "\n" + translated_line
        
        # print(f"{line} Instruction: {instruction_name}, Operands: {matched_operands}")
    else:
        # Handle cases where the line does not have an instruction and operands
        print(f"{line} Instruction: {line.strip()}, Operands: None")
        return ""

def parse_operands(operands):
    operand_list = []
    for operand in operands.split(','):
        operand = operand.strip()
        if '(' in operand and ')' in operand:
            imm, reg = re.match(r'([^()]+)\(([^()]+)\)', operand).groups()
            operand_list.extend([imm.strip(), reg.strip()])
        else:
            operand_list.append(operand)
    return operand_list

def match_operands(instruction_name, operands_list, instruction_patterns):
    if instruction_name in instruction_patterns:
        patterns = instruction_patterns[instruction_name]
        for pattern in patterns:
            if len(pattern) == len(operands_list):
                return {pattern[i]: operands_list[i] for i in range(len(pattern))}
    err ="ERROR: No encoding found : " + instruction_name 
    # print(instruction_name in instruction_patterns)
    # print(err, operands_list)
    return err 

def process_code_block(block, instruction_patterns, output_file):
    
    processed_block = ""
    # gen_inst = ""
    pattern = re.compile(r'\bn([1-9]|[1-9][0-9]|100)\b')
    
    consequent = 0
    print("\n block")
    for line in block:
        
        if bool(pattern.search(line)):
            consequent = consequent + 1
            new_inst = process_instruction(line, instruction_patterns)
            if new_inst != gen_inst:
                processed_block = processed_block + new_inst + '\n'
            # gen_inst = new_inst
            
            processed_block = processed_block + '\n'
        else:
            if consequent != 0:
                print(consequent)
            consequent = 0
            gen_inst = ""
            processed_block = processed_block + line + '\n'
    
    print("-----")
    
    output_file.write(processed_block)
    

def read_file(filename, instruction_patterns, output_file):
    with open(filename, 'r') as file:
        lines = file.readlines()

    inside_block = False
    current_block = []

    for line in lines:
        stripped_line = line.strip()

        # Check for the start of a block
        if stripped_line.startswith(".LBB"):
            if current_block:
                process_code_block(current_block, instruction_patterns, output_file)
                current_block = []
            current_block.append(line.rstrip())
        
        else:
            current_block.append(line.rstrip())
    

    process_code_block(current_block, instruction_patterns, output_file)

    # if current_block:
    #     code_blocks.append('\n'.join(current_block))

    # Print the extracted blocks to check the output
    # for block in code_blocks:
    #     print(block)
    #     print("===")  # Separator for readability

    # return code_blocks

if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Usage: python script.py <filename> <encoding_file> <output_file>")
    else:
        filename = sys.argv[1]
        encoding_file = sys.argv[2]
        output_file_name = sys.argv[3]

        output_file = open(output_file_name, 'w')
        instruction_patterns = load_instruction_patterns(encoding_file)
        read_file(filename, instruction_patterns, output_file)

        output_file.close()
