import sys

def process_instruction(line):
    parts = line.split(maxsplit=1)
    if len(parts) > 1:
        instruction_name = parts[0]
        operands = parts[1]
        operands_list = parse_operands(operands)
        print(f"{line} Instruction: {instruction_name}, Operands: {operands_list}")
    else:
        # Handle cases where the line does not have an instruction and operands
        print(f"{line} Instruction: {line.strip()}, Operands: None")

def parse_operands(operands):
    if '(' in operands and ')' in operands:
        # Handle case like lw a2, 0(a0)
        main_part, nested_part = operands.split('(')
        nested_part = nested_part.rstrip(')')
        return [main_part.strip(), nested_part.strip()]
    else:
        # Handle other cases
        return [operand.strip() for operand in operands.split(',')]

def process_code_block(block):
    print("Processing code block:")
    for line in block:
        if line.startswith('\t'):
            process_instruction(line.strip())
        else:
            print(line.strip())
    print("\nEnd of code block.\n")


def read_file(filename):
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
                        process_code_block(code_block)
                        code_block = []
                        inside_code_block = False
                
                # Detect start of a code block
                if stripped_line.endswith(':') or (line.startswith('#') and ':' in line):
                    if inside_code_block:
                        process_code_block(code_block)
                        code_block = []
                    code_block.append(line)
                    inside_code_block = True
            
            if inside_code_block:
                process_code_block(code_block)
    except FileNotFoundError:
        print(f"The file {filename} does not exist.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <filename>")
    else:
        filename = sys.argv[1]
        read_file(filename)
