# Computation Time Comparison Between useIntSort and UNIX sort Algorithms

## The Task
The task involves completing the program [useIntList.c](useIntList.c), which reads and sorts a list of integers using linked lists and insertion sort. We are then required to compare the average computation time of useIntList to the UNIX sort command.
More information about the task can be found [here](https://cgi.cse.unsw.edu.au/~cs2521/20T2/labs/week01/index.php). 

## Hypothesis
useIntSort uses an insertion sort algorithm, which is not very efficient compared to several other sorting algorithms. It can be assumed that UNIX sort would be way more efficient as a built-in UNIX command. For useIntSort, initially sorted and reversed inputs should be significantly faster than initially random inputs since the computer does not have to traverse the linked list as far each time, just updating the front and end of the linked list. 

## Data Processing
1. Run the shell [experiment](experiment) and save its output to [raw_data.txt](raw_data.txt) by running `sh experiment |& tee raw_data.txt`. The shell script generates a list of numbers according to the task's specification, where for a varying number of input size, a sequence of initially random, sorted and reversed numbers (with and without duplicates) are generated, using [randList](randList) for possible duplicate numbers and `seq` for non-duplicate numbers. Although these files are generated into `/data/`, the shell script can be modified so that these files are generated into `/tmp/` instead. After generating these files, the shell displays the timing data (excluding the sorted output of the input numbers), which can be saved into [raw_data.txt](raw_data.txt) using the specified command.
1. Now we need to extract useful data out of [raw_data.txt](raw_data.txt), i.e. the input size, test type and "user" time for each trial (which refers to the time spent executing the code of the command). The Python program [extract.py](extract.py) filters the [raw_data.txt](raw_data.txt) file for these specified lines into a file called [extracted.txt](extract.txt).
1. Now we need to clean up the data in [extracted.txt](extract.txt), as the trial times are in the format "user	XmX.XXXs". The Python program [clean.py](clean.py) processes the time (excluding the "user" subtring) for relevant lines into a single time in seconds, before saving this to [results.txt](results.txt).
1. Now we can process this file in Microsoft Excel, copying the contents of [results.txt](results.txt) into the specified table format, taking use of the Special Paste: Transform function. Here, we can calculate the average time and create graphs demonstrating the results. We can also create a Tab-delimited Text file as per task specifications. 

## The Results
![Average Results](/images/average_results.png)

As expected, the UNIX sort algorithm sorted the number inputs significantly faster than the useIntList program. useIntList creates a new linked list and inserts each number into the right position in ascending order, using the insertion sort algorithm. This has a computational complexity of 𝒪(𝑛<sup>2</sup>) with 𝑛 representing the input size, as each number to be inserted is compared to the other n values in order to determine where it should be inserted, which is very inefficient. This can be seen by the curve below which fits a quadratic model (modelled using Vernier Logger Pro 3).

![Average Results](/images/useIntList_avg.png)

On the other hand, the UNIX sort algorithm uses an [External R-Way Merge Sort](http://vkundeti.blogspot.com/2008/03/tech-algorithmic-details-of-unix-sort.html) with a computational complexity of 𝒪((N/M)log(N/M)/log(R)). Analysing the graph below, I initially tried a ![#be69bd](https://via.placeholder.com/15/be69bd/000000?text=+) linear proportional model, which seemed to fit the curve pretty well. However, investigating the computational complexity of a regular merge sort algorithm, which is 𝒪(𝑛log𝑛) using divide-and-conquer techniques, I obtained a better model with ![#32a7a5](https://via.placeholder.com/15/32a7a5/000000?text=+) nlog(n) (having a lower RMSE value). It is difficult to determine the algorithm model based on the current dataset due to the small values of time obtained for the input sizes of 5000 to 250000. Further trials are necessary for a better model, especially with larger input sizes with larger values for time. 

![Average Results](/images/sort_average_model.png)

### Further Observations:
In general, initially random inputs took significantly longer to compute compared to initially sorted and reversed inputs. For useIntSort, initially reversed inputs were slightly faster than initially sorted ones, and vice versa for UNIX sort. Furthermore, duplicate inputs seemed to take slightly longer to compute.

| Test | useIntSort Average Time (s) | UNIX sort Average Time (s) |
| :--: | :-------------------------: | :------------------------: |
| Initially Random with No Duplicates | 236.176 | 0.036 |
| Initially Sorted with No Duplicates |	28.705 |	0.012 |
| Initially Reversed with No Duplicates	| 28.735 | 0.014 |
| Initially Random with Duplicates | 235.998 | 0.036 |
| Initially Sorted with Duplicates | 28.720 |	0.013 |
| Initially Reversed with Duplicates | 28.704 | 0.016 |
| | | |
| General: No Duplicates | 97.872 |	0.021 |
| General: With Duplicates | 97.807 | 0.022 |
| General: Initially Random |	236.087 |	0.036 |
| General: Initially Sorted	| 28.712 | 0.012 |
| General: Initially Reversed | 28.719 | 0.015 |

*Please note: Graphs for the six different initial conditions can be found in [sort_results.xlsx](sort_results.xlsx).*

## Discussion
As explained above, insertion sort is a rather inefficient method of sorting. UNIX sort, using a merge sort algorithm, triumphs useIntSort in computation time due to the algorithmic efficiency of divide-and-conquer (a thorough explanation can be found in my [Fourier Transforms Project Report](https://github.com/axieax/fourier/)).

### useIntSort
As expected, useIntSort dealt with sorted and reversed inputs faster than random inputs. This is because the program needs to only update the start or end of the linked list instead of traversing through the entire list and finding the appropriate position to insert each number. It was surprising to see that reversed inputs were faster than sorted inputs. However, reviewing my logic, it seems that each number is compared to the front of the linked list first as the first `if` condition, before checking the end of the list, justifying why initally sorted inputs (which add to the end) required extra computation and thus, extra time.

### UNIX sort
With the merge sort algorithm, sorted and reversed inputs would be faster than initially random inputs as each subdivision would be sorted faster, requiring less sorting each time. Initially sorted inputs would be faster than the reversed inputs since the lowest-level subdivisions are already sorted, unlike the reversed ones which would have to be sorted at each level, although less sorting is required than for initially random inputs.

### With or Without Duplicates?
Whether the input has duplicates or not should not affect the computation time of either programs. Upon review, I realised that my [useIntList.c](useIntList.c) could have been more efficient by inserting before a duplicate value instead of always after, which would have resolved the slight difference in computation time between the inputs with and without duplicate values. Furthermore, the difference in computation time for UNIX sort is negligible.
