#include <iostream>
#include <conio.h>
using namespace std;

int find_max(int i,int j){
	return i>j? i:j;
}

void print(int arr[][4]){
	for(int i=0;i<=4; i++){
		for(int j=0; j<=8; j++){
			arr[i][j]=0;
			printf("%d ",arr[i][j]);
		}
		printf("\n");
	}
	printf("\n");
}

int main(){
	int W[]={0,3,4,5,6};
	int v[]={0,2,3,4,1};
	int w=8, n=4;
	
	int arr[w][4]={0};
	
	print(arr);
	
	for(int i=1;i<=n; i++){
		for(int j=1; j<=w; j++){
			int x = j-W[i];
			if(x<0)
				arr[i][j]=0;
			else{
				x = arr[i-1][x];
				arr[i][j]= find_max(arr[i-1][j], v[i]+ x);
//				printf("%d ",find_max(arr[i-1][j], v[i]+ x));
//				arr[i][j]= ;
			}
			printf("%d %d %d %d\n",arr[i-1][j],v[i],x,arr[i][j]);
		}
		printf("\n");
//		print(arr);
	}
	
	print(arr);
	return 0;
}
