#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

int main(){
	int r1,c1, r2, c2, i,j, sum=0,k;
	
	printf("Enter row size for Matrix A : ");
	scanf("%d",&r1);
	printf("Enter column size for Matrix A : ");
	scanf("%d", &c1);
	printf("Enter row size for Matrix B : ");
	scanf("%d",&r2);
	printf("Enter column size for Matrix B : ");
	scanf("%d", &c2);
	
	if(c1 != r2){
		printf("Matrix can't be multiplied\n");
		exit(0);
	}
	
	
	int MatA[r1][c1], MatB[r2][c2], Mul[r1][c2];
	
	for(i=0; i<r1; i++){
		for(j=0; j<c2; j++){
			Mul[i][j]=0;
		}
	}
	
	printf("Matrix A\n");
	for(i =0 ; i<r1; i++){
		for (j=0; j<c1; j++){
			printf("Enter entry for Row # %d Col # %d : ",i,j);
			scanf("%d",&MatA[i][j]);
		}
	}
	
	printf("Matrix B\n");
	for(i =0; i<r2; i++){
		for (j=0; j<c2; j++){
			printf("Enter entry for Row # %d Col # %d : ",i,j);
			scanf("%d",&MatB[i][j]);
		}
	}
	
	printf("\nThe Multplied Matrix\n");
	#pragma omp parallel shared(MatA, MatB, Mul) private(i,j,k,sum)
	{
		#pragma omp for
		for(i=0; i<r1; i++){
			for(j=0; j<c2; j++){
				for(k=0; k<c1; k++){
					Mul[i][j] += MatA[i][k]*MatB[k][j];
				}
			}
		}
	}
	
	for(i=0; i<r1; i++){
		for(j=0; j<c2; j++){
			printf("%d ", Mul[i][j]);
		}
		printf("\n");
	}
	
	return 0;
}


