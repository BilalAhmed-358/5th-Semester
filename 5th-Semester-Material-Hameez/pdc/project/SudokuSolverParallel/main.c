#include <stdio.h>
#include <stdlib.h>
#include "sudoku.h"
#include <string.h>
#include <omp.h>

int ** TextInput(char *filename);
int isValid(int **original, int **answerGrid);
void PrintGrid(int ** Grid);

int main(int argc, char *argv[]){
	if (argc<3){
		printf("Usage: ./sudoku <n_threads> <inputFile>\n");
		exit(0);
	}
	int **DefaultGrid = TextInput(argv[2]);
	int **Solver = TextInput(argv[2]);
	int n_threads = atoi(argv[1]);
	if (n_threads<=0){
		printf("Usage: Thread Count should be positive\n");
	}
	omp_set_num_threads(n_threads);
	int i,j;
	printf("************************INPUT GRID***********************\n");
	PrintGrid(DefaultGrid);
	double start = omp_get_wtime();
	int **outputGrid = solveSudoku(DefaultGrid);
	double finish = omp_get_wtime();
	printf("\n************************OUTPUT GRID***********************\n");
	PrintGrid(outputGrid);
	if (isValid(DefaultGrid,outputGrid)){
		printf("\nSOLUTION FOUND\nTIME = %lf\n",(finish-start));
	}
	else{
		printf("NO SOLUTION FOUND\nTIME =%lf\n",(finish-start));
	}
}

void PrintGrid(int ** Grid){
	int i,j;
	for (i=0;i<SIZE;i++){
		for (j=0;j<SIZE;j++){
			printf("%d ",Grid[i][j]);
		}
		printf("\n");
	}
}

//returns a 2D array from a file containing the Sudoku in space separated format (empty cells are 0)
int ** TextInput(char *filename){
	FILE *ptr;
	ptr = fopen(filename, "r");
	int i, j;
	char dummyline[SIZE+1];
	char dummy;
	int value;
	int **Sudoku = (int**)malloc(sizeof(int*)*SIZE);
	for (i=0;i<SIZE;i++){
		Sudoku[i] = (int*)malloc(sizeof(int)*SIZE);
		for (j=0;j<SIZE;j++)
			Sudoku[i][j] = 0;
	}

	for (i = 0; i < SIZE; i++){
		for (j = 0; j < SIZE; j++){
			/* Checking if number of rows is less than SIZE */
			if (feof(ptr)){
				if (i != SIZE){
					printf("The input puzzle has less number of rows than %d. Exiting.\n", SIZE);
					exit(-1);
				}
        		}

        		fscanf(ptr, "%d", &value);
        		if(value >= 0 && value <= SIZE)
				Sudoku[i][j] = value;
			else{
				printf("The input puzzle is not a grid of numbers (0 <= n <= %d) of size %dx%d. Exiting.\n", SIZE, SIZE, SIZE);
				exit(-1);
			}
		}
		fscanf(ptr, "%c", &dummy); /* To remove stray \0 at the end of each line */

		/* Checking if row has more elements than SIZE */
		if (j > SIZE){
			printf("Row %d has more number of elements than %d. Exiting.\n", i+1, SIZE);
			exit(-1);
		}
	}
	return Sudoku;
}


/*checks if solution is a valid solution to original 
i.e. all originally filled cells match, and that solution is a valid grid*/
int isValid(int **original, int **answerGrid){
	int visited[SIZE],i,j,k;

	//check all rows
	for (i=0;i<SIZE;i++){
		for (k=0;k<SIZE;k++) 
			visited[k] = 0;
		for (j=0;j<SIZE;j++){
			if (answerGrid[i][j]==0) return 0;
			if ((original[i][j])&&(answerGrid[i][j] != original[i][j])) return 0;
			int v = answerGrid[i][j];
			if (visited[v-1]==1){
				return 0;
			}
			visited[v-1] = 1;
		}
	}

	//check all columns
	for (i=0;i<SIZE;i++){
		for (k=0;k<SIZE;k++) visited[k] = 0;
		for (j=0;j<SIZE;j++){
			int v = answerGrid[j][i];
			if (visited[v-1]==1){
				return 0;
			}
			visited[v-1] = 1;
		}
	}

	//check all minigrids
	//check all rows
	for (i=0;i<SIZE;i=i+MINIGRIDSIZE){
		for (j=0;j<SIZE;j=j+MINIGRIDSIZE){
			for (k=0;k<SIZE;k++) visited[k] = 0;
			int r,c;
			for (r=i;r<i+MINIGRIDSIZE;r++)
				for (c=j;c<j+MINIGRIDSIZE;c++){
					int v = answerGrid[r][c];
					if (visited[v-1]==1) {
						return 0;
					}
					visited[v-1] = 1;
				}
		}
	}
	return 1;
}

