import re

# Function to read assembly code from a file and find unique matching instruction names
def find_unique_instruction_names(file_path):
    # Compile the regex pattern to match any instruction using registers like n1, n2, ..., n100
    pattern = re.compile(r'.*\b(n[1-9]|n[1-9][0-9]|n100)\b.*')
    instruction_pattern = re.compile(r'\b([a-z]+)\b')
    
    # Read the assembly code from the file
    with open(file_path, 'r') as file:
        assembly_code = file.readlines()
    
    # Set to store unique instruction names
    unique_instructions = set()
    
    # Find all matching instruction names
    for line in assembly_code:
        if pattern.match(line):
            # Extract the instruction name
            instruction_match = instruction_pattern.match(line.strip())
            if instruction_match:
                unique_instructions.add(instruction_match.group(1))
    
    return unique_instructions

# File path to the assembly code text file
file_path = 'assembly_files/q_sort_exR.S'

# Get the unique matching instruction names
unique_instruction_names = find_unique_instruction_names(file_path)

# Print the results
print("Unique instruction names using registers like n1, n2, ..., n100:")
for instruction in unique_instruction_names:
    print(instruction)
