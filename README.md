# research-methods1
Research Methods 1 Project 

1. Generate the input sequence to be sorted with the script gen.py in python by
   changing the values of the following variables (PATH:.\rm1\src\PY): 
  - n : sequence size
  - eps : probability of failure
  - maxr : maximum range used by the function "randint"
  The values in the sequence are integers generated according to a (discrete)
  uniform distribution within the interval [1, maxr]. 

2. Run the python code to generate the input for the sorting code as follows:
 
   > python gen.py > data100.in
   
3. Compile the four sorting codes, for instance, in gcc (PATH:.\rm1\src\C):
  
   > gcc quicksort.c -o quick

4. Run the sorting executable as follows:

   > ./quick
      
     Enter a INPUT file name (eg. data100.in):
   > data100.in
   
     Enter a OUTPUT file name (eg. 100quick1.out):
   > 100quick1.out
