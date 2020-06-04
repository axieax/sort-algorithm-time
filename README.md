# Computation Time Comparison Between useIntSort and UNIX sort Algorithms

## The Task
The task involves completing the program useIntList.c, which reads and sorts a list of integers using linked lists and insertion sort. We are then required to compare the average computation time of useIntList to the UNIX sort command.
More information about the task can be found [here](https://cgi.cse.unsw.edu.au/~cs2521/20T2/labs/week01/index.php). 

## Data Processing
1. Run the shell "experiment" and save its output to raw_data.txt by running "sh experiment |& tee raw_data.txt". The shell "experiment" generates a list of numbers according to the task's specification, where for a varying number of input size, a sequence of initially random, sorted and reversed numbers (with and without duplicates) are generated, using "randList" for possible duplicate numbers and seq for non-duplicate numbers. Although these files are generated into /data/, the shell script can be modified so that these files are generated into /tmp/ instead. After generating these files, the shell displays the timing data (excluding the sorted output of the input numbers), which can be saved into raw_data.txt using the specified command.
1. Now we need to extract useful data out of raw_data.txt, i.e. the input size, test type and "user" time for each trial (which refers to the time spent executing the code of the command). The Python program "extract.py" filters the raw_data.txt file for these specified lines into a file called "extracted.txt".
1. Now we need to clean up the data in "extracted.txt", as the trial times are in the format "user	XmX.XXXs". The Python program "clean.py" processes the time (excluding the "user" subtring) for relevant lines into a single time in seconds, before saving this to "results.txt".
1. Now we can process this file in Microsoft Excel, copying the contents of "results.txt" into the specified table format, taking use of the Special Paste: Transform function. Here, we can calculate the average time and create graphs demonstrating the results. We can also create a Tab-delimited Text file as per task specifications. 

## The Results



## Discussion
