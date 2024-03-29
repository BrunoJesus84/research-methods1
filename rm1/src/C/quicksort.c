// Adapted from Rosetta Code.

#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <string.h>

#define MAX 10000

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

void swap(int *a, int *b)
{
	int c = *a;
	*a = *b;
	*b = c;
}

int partition(int A[], int p, int q)
{
	swap(&A[p + (rand() % (q - p + 1))], &A[q]); // PIVOT = A[q] 

	int i = p - 1;
	int j = p;
	for (j = p; j <= q; j++)
	{
		if (r() > eps)
		{ // no failure
			if (A[j] <= A[q])
				swap(&A[++i], &A[j]);
		}
		else
		{ // failure
			if (A[j] > A[q])
				swap(&A[++i], &A[j]);
		}
	}

	return i;
}

void quicksort(int A[], int p, int q)
{

	if (p < q)
	{
		int pivotIndx = partition(A, p, q);
		quicksort(A, p, pivotIndx - 1);
		quicksort(A, pivotIndx + 1, q);
	}
}

int main()
{

	FILE *arq, *out, *out2;
	char name[30], line[100];
	char *result, *text;
	int n, i;

	/* Reads a name of the file to open: */
	printf("\n\n Enter a INPUT file name (eg. data100.in):\n");
	fgets(name, 29, stdin);
	for (i = 0; name[i]; i++)
		if (name[i] == '\n')
			name[i] = 0; /* Remove the "\n" from string */

	// Open a text file TEXTO in Read Mode
	arq = fopen(name, "rt");

	if (arq == NULL) // Open error
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

	quicksort(A, 0, n - 1);

	/* Reads a name of the file to open: */
	printf("\n\n Enter a OUTPUT file name (eg. 100quick001):\n");
	fgets(name, 29, stdin);
	for (i = 0; name[i]; i++)
		if (name[i] == '\n')
			name[i] = 0; /* Remove the "\n" from string */

	strcat(name, ".out");
	// Open a text file TEXTO in Write Mode
	out = fopen(name, "w+");
	strcat(name, "2");
	out2 = fopen(name, "w+");

    int j = 0;
     
    for (j = 0; j < 40; j++) {

		quicksort(A, 0, n - 1);

	    int count = LNDS(n);

        // Write Output File
        printf("%d", A[0]);
        fprintf(out, "%d", A[0]);
        for (i = 1; i < n; i++) {
            printf(" %d", A[i]);
            fprintf(out, " %d", A[i]);
        }
        printf("\n");
        fprintf(out2, "%s;%lf;%d;%d;%d\n", "quick", eps, n, count, countErr);

        // Reset errors count
        countErr = 0;
        // Reset array for original sorting
        memcpy(A, B, sizeof(B));  
    }       

	// Close Output File
	fclose(out);
	fclose(out2);

	eps = -1.0;

	printf("Eps - Size: %lf - %d \n", eps, n);

	quicksort(B, 0, n - 1);

	printf("%d", B[0]);
	for (i = 1; i < n; i++)
		printf(" %d", B[i]);

//	printf("\n%d %d\n", count, countErr);
}
