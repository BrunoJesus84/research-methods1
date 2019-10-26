// Adapted from Rosetta Code

#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <string.h>

#define MAX 10000

int A[MAX], B[MAX];
double eps;

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
            len = 1;
    }
    return max;
}

double r()
{
    return (double)rand() / (double)RAND_MAX;
}

void merge(int *a, int n, int m)
{
    int i, j, k;
    int *x = malloc(n * sizeof(int));
    for (i = 0, j = m, k = 0; k < n; k++)
    {
        if (r() > eps)
        { //no failure
            x[k] = j == n ? a[i++]
                          : i == m ? a[j++]
                                   : a[j] < a[i] ? a[j++]
                                                 : a[i++];
        }
        else
        { // failure
            x[k] = j == n ? a[i++]
                          : i == m ? a[j++]
                                   : a[j] >= a[i] ? a[j++]
                                                  : a[i++];
        }
    }
    for (i = 0; i < n; i++)
    {
        a[i] = x[i];
    }
    free(x);
}

void merge_sort(int *a, int n)
{
    if (n < 2)
        return;
    int m = n / 2;
    merge_sort(a, m);
    merge_sort(a + m, n - m);
    merge(a, n, m);
}

int main()
{
    FILE *arq, *out;
    char name[30], line[100];
    char *result, *text;
    int n, i;

    /* Reads a name of the file to open: */
    printf("\n\n Enter a file name:\n");
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

    merge_sort(A, n);

    /* Reads a name of the file to open: */
	printf("\n\n Enter a file name:\n");
	fgets(name,29,stdin);
	for(i=0; name[i]; i++) if(name[i]=='\n') name[i]=0;	/* Remove the "\n" from string */

	// Open a text file TEXTO in Write Mode
	out = fopen (name, "w+");

	int count = LNDS(n);

	// Write Output File
	printf("%d", A[0]);
	fprintf(out, "%lf %d %d", eps, n, A[0]);
	for (i = 1; i < n; i++) {
		printf(" %d", A[i]);
		fprintf(out, " %d", A[i]);
	}
	printf("\n");
	fprintf(out, "\n%d", count);
	
	// Close Output File
	fclose(out);

	eps = -1.0;

	printf("Eps - Size: %lf - %d \n", eps, n);

    merge_sort(B, n);

    printf("%d", B[0]);
    for (i = 1; i < n; i++)
        printf(" %d", B[i]);
    printf("\n%d\n", count);
}
