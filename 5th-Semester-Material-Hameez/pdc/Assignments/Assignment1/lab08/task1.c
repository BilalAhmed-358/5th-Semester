#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

int main(){
	int r,c, i,j, sum=0,k;
	
	printf("Enter row size : ");
	scanf("%d",&r);
	
	printf("Enter column size : ");
	scanf("%d", &c);
	
	int MatA[r][c], MatB[r][c], Sum[r][c], Mul[r][c];
	
	printf("Matrix A\n");
	for(i =0 ; i<r; i++){
		for (j=0; j<c; j++){
			printf("Enter entry for Row # %d Col # %d : ",i,j);
			scanf("%d",&MatA[i][j]);
		}
	}
	
	printf("Matrix B\n");
	for(i =0; i<r; i++){
		for (j=0; j<c; j++){
			printf("Enter entry for Row # %d Col # %d : ",i,j);
			scanf("%d",&MatB[i][j]);
		}
	}
	
	printf("\nThe Sum Matrix\n");
	#pragma omp parallel shared(MatA, MatB, Sum) private(i,j)
	{
		#pragma omp for
		for(i=0; i<r; i++){
			for(j=0; j<c; j++){
				Sum[i][j] = MatA[i][j] + MatB[i][j];
				printf("%d ",Sum[i][j]);
			}
			printf("\n");
		}
	}
	
	return 0;
}

