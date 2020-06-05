# Open file
data = open("extracted.txt", "r")
# Saves the lines into a list
lines = data.readlines()
# Lines we want to edit
edit = [3, 4, 5, 7, 8, 9]
# List with edited lines
formatted_output = []

for i in range(len(lines)):
    # The first mod specifies the section (different input sizes)
    # The second mod determines the lines to be edited
    if (i%62)%10 in edit:
        # Extracts the time value
        org_time = lines[i][5:-2]
        # Finds the index for minutes (character 'm')
        m_index = org_time.find('m')
        # Calculates the time in seconds based on seconds and minutes
        seconds = float(org_time[m_index+1:])
        minutes = float(org_time[:m_index])
        time = seconds + 60*minutes
        # Includes the edited line
        formatted_output.append("%.3f" % time + "\n")
    elif "Trial" in lines[i]:
        # Finds starting index for word "Trial"
        t_index = lines[i].find("Trial")
        # Removes the trial number information from lines
        formatted_output.append(lines[i][:t_index-1] + ":\n")
    else:
        # Include lines that don't require editing
        formatted_output.append(lines[i])

data.close()

# Write the cleaned lines to a new file
new_file = open("results.txt", "w")
for line in formatted_output:
   new_file.write(line)
new_file.close()
