#include<math.h>
#include<pthread.h>
#include<stdlib.h>

double x, fact[100], power[100], s[1];
int i, term;

void *Power(void *temp){
	int k;
	for(k=0; k<100; k++)
		power[k] = pow(x,k);
}

void *Fact(void *temp){
	double f;
	int j;
	fact[0]=1.0;
	
	for(j=1; j<100; j++){
		f=1.0;
		int term;
		for(term = j; term>=1; term--)
			f *= term;
		fact[j]=f;
	}
}

void *Exp(void *temp) {
	int i;
	s[0] = 0;
	
	for(i=0;i<100;i++)
		s[0] = s[0] + (power[i] / fact[i]);
}

int main(void) {
	pthread_t thread1,thread2,thread3;
	
	printf("Exponential [PROMPT] Enter the value of x (between 0 to 100) (for calculating exp(x)):");
	scanf("%lf",&x);
	
	printf("\nExponential [INFO] Threads creating.....\n");
	pthread_create(&thread1,NULL,Power,NULL); //calling power function
	pthread_join(thread1,NULL);
	
	pthread_create(&thread2,NULL,Fact, NULL); //calling factorial function
	pthread_join(thread2,NULL);

	printf("Exponential [INFO] Master thread and terminated threads are joining\n");
	printf("Exponential [INFO] Result collected in Master thread\n");
	pthread_create(&thread3,NULL,Exp,NULL);
	pthread_join(thread3,NULL);
	printf("\neXPONENTIAL [INFO] Value of exp(%.2lf) is : %lf\n\n",x,s[0]);
	exit(1);
	
	return 0;
}
