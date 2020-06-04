# Open file
data = open("raw_data.txt", "r")
# Saves the lines into a list
lines = data.readlines()
# Lines we want to extract
want = [1, 2, 4, 7, 13, 19, 22, 25, 31, 37]
# For storing the extracted lines
formatted_list = []

for i in range(len(lines)):
    # The first mod specifies the section (different input sizes)
    # The second mod specifies the lines wanted for each section
    if (i%232)%38 in want:
        formatted_list.append(lines[i])

data.close()

# Write the extracted lines to a new file
new_file = open("extracted.txt", "w")
for line in formatted_list:
    new_file.write(line)
new_file.close()
