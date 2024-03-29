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

void insertion_sort(int *a, int n)
{
        size_t i = 1;
		for (i = 1; i < n; ++i)
        {
                int tmp = a[i];
                size_t j = i;
                while (j > 0)
                {
                        if (r() > eps)
                        { //no failure
                                if (tmp >= a[j - 1])
                                        break;
                        }
                        else
                        { //failure
                                if (tmp < a[j - 1])
                                        break;
                        }
                        a[j] = a[j - 1];
                        --j;
                }
                a[j] = tmp;
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

    
        /* Reads a name of the file to open: */
	printf("\n\n Enter a OUTPUT file name (eg. 100quick001):\n");
	fgets(name,29,stdin);
	for(i=0; name[i]; i++) if(name[i]=='\n') name[i]=0;	/* Remove the "\n" from string */

        strcat(name, ".out");
	// Open a text file TEXTO in Write Mode
	out = fopen (name, "w+");
        strcat(name, "2");
	out2 = fopen (name, "w+");
        
	int j = 0;
    	 
        for (j = 0; j < 40; j++) {
	        insertion_sort(A, n);
                int count = LNDS(n);

                // Write Output File
                printf("%d", A[0]);
                fprintf(out, "%d", A[0]);
                for (i = 1; i < n; i++) {
                        printf(" %d", A[i]);
                        fprintf(out, " %d", A[i]);
                }
                printf("\n");
	        fprintf(out2, "%s;%lf;%d;%d;%d\n", "insertion", eps, n, count, countErr);
                
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

	insertion_sort(B, n);

        printf("%d", B[0]);
        for (i = 1; i < n; i++)
                printf(" %d", B[i]);
//   	printf("\n%d %d\n", count, countErr);
}
