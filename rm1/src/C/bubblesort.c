
//Adapted Rosetta Code

#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <string.h>

#define MAX 1000000

int A[MAX], B[MAX];
double eps;
int countErr = 0; 

double r()
{
    return (double)rand() / (double)RAND_MAX;
}

// computes the length of the longest non-decreasing string
//
int LNDS(int n)
{

    int max = 1;
    int len = 1;
    int i = 1;
	for (i = 1; i < n; i++)
    {
        if (A[i - 1] <= A[i])
        {
            len++;
            if (len > max)
                max = len;
        }
        else 
        { 
            len = 1;
            countErr++;
        }
    }
    return max;
}

void bubble_sort(int *a, int n)
{
    int i, t, j = n, s = 1;
    while (s)
    {
        s = 0;
        for (i = 1; i < j; i++)
        {
            if (r() > eps)
            { // no failure
                if (a[i] < a[i - 1])
                {
                    t = a[i];
                    a[i] = a[i - 1];
                    a[i - 1] = t;
                    s = 1;
                }
            }
            else
            { // failure
                if (a[i] >= a[i - 1])
                {
                    t = a[i];
                    a[i] = a[i - 1];
                    a[i - 1] = t;
                    s = 1;
                }
            }
        }
        j--;
    }
}

int main()
{
FILE *arq, *out;
	char name[30] = "data100.in", line[100];
  	char *result, *text;
	int n, i;

	/* Reads a name of the file to open: */
	printf("\n\n Enter a INPUT file name (eg. data100.in):\n");
	fgets(name,29,stdin);					
	for(i=0; name[i]; i++) if(name[i]=='\n') name[i]=0;	/* Remove the "\n" from string */

	// Open a text file TEXTO in Read Mode 
  	arq = fopen(name, "rt");

	if (arq == NULL)  // Open error
  	{
    	printf("File opening error\n");
    	return 0;
  	}

	fscanf(arq, "%lf %d", &eps, &n);
	printf("Eps - Size: %lf - %d \n", eps, n);

	i = 0;
	while (eps && i < n)
	{
		fscanf(arq, "%d", &A[i]);
		i++;
	}
	// Close Input File
	fclose(arq);

    srand((unsigned)time(NULL));
    memcpy(B, A, sizeof(A));

    printf("%d", A[0]);
    for (i = 1; i < n; i++)
        printf(" %d", A[i]);
    printf("\n");

    /* Reads a name of the file to open: */
	printf("\n\n Enter a OUTPUT file name (eg. 100quick1.out):\n");
	fgets(name,29,stdin);
	for(i=0; name[i]; i++) if(name[i]=='\n') name[i]=0;	/* Remove the "\n" from string */
   
    out = fopen(name, "w+");

    int j = 0;
     
    for (j = 0; j < 10; j++) {

        bubble_sort(A, n);

        // Open a text file TEXTO in Write Mode
        int count = LNDS(n);

        // Write Output File
        printf("%d", A[0]);
        fprintf(out, "%d", A[0]);
        for (i = 1; i < n; i++) {
            printf(" %d", A[i]);
            fprintf(out, " %d", A[i]);
        }
        printf("\n");
        fprintf(out, "\n%s;%lf;%d;%d;%d\n", "bubble", eps, n, count, countErr);

        countErr = 0;
        
    }
    // Close Output File
    fclose(out);

	eps = -1.0;

	printf("Eps - Size: %lf - %d \n", eps, n);

    bubble_sort(B, n);

    printf("%d", B[0]);
    for (i = 1; i < n; i++)
        printf(" %d", B[i]);
    //printf("\n%d %d\n", count, countErr);

    return 0;
}
