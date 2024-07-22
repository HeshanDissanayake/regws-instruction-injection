import sys
import json
import re

def load_instruction_patterns(filename):
    with open(filename, 'r') as file:
        return json.load(file)

def process_instruction(line, instruction_patterns):
    parts = line.split(maxsplit=1)
    if len(parts) > 1:
        instruction_name = parts[0]
        operands = parts[1]
        operands_list = parse_operands(operands)
        matched_operands = match_operands(instruction_name, operands_list, instruction_patterns)
        print(f"{line} Instruction: {instruction_name}, Operands: {matched_operands}")
    else:
        # Handle cases where the line does not have an instruction and operands
        print(f"{line} Instruction: {line.strip()}, Operands: None")

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
    return "No encoding found"

def process_code_block(block, instruction_patterns):
    print("Processing code block:")
    for line in block:
        if line.startswith('\t'):
            process_instruction(line.strip(), instruction_patterns)
        else:
            print(line.strip())
    print("\nEnd of code block.\n")

def read_file(filename, instruction_patterns):
    try:
        with open(filename, 'r') as file:
            code_block = []
            inside_code_block = False
            
            for line in file:
                stripped_line = line.split('#')[0].strip()  # Ignore comments for block detection
                
                if inside_code_block:
                    if line.startswith('\t') or line.strip() == '':
                        code_block.append(line)
                    else:
                        process_code_block(code_block, instruction_patterns)
                        code_block = []
                        inside_code_block = False
                
                # Detect start of a code block
                if stripped_line.endswith(':') or (line.startswith('#') and ':' in line):
                    if inside_code_block:
                        process_code_block(code_block, instruction_patterns)
                        code_block = []
                    code_block.append(line)
                    inside_code_block = True
            
            if inside_code_block:
                process_code_block(code_block, instruction_patterns)
    except FileNotFoundError:
        print(f"The file {filename} does not exist.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python script.py <filename> <encoding_file>")
    else:
        filename = sys.argv[1]
        encoding_file = sys.argv[2]
        instruction_patterns = load_instruction_patterns(encoding_file)
        read_file(filename, instruction_patterns)
