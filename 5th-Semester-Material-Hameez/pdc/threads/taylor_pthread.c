#include<math.h>
#include<pthread.h>
#include<stdlib.h>

long double x, fact[150], power[150], s[1];
int i, term;

void *Power(void *temp){
	int k;
	printf("%Lf\n",x);
	for(k=0; k<150; k++){
		power[k] = pow(x,k);
	}
	
	for(k=0; k<10; k++)
		printf("%d  ",power[k]);
	return power;
}

void *Fact(void *temp){
	long double f;
	int j;
	fact[0]=1.0;
	
	for(j=1; j<150; j++){
		f=1.0;
		int term;
		for(term = j; term>=1; term--){
			f *= term;
		}
		fact[j]=f;
	}
	return fact;
}

void *Exp(void *temp) {
	int t;
	s[0] = 0;
	for(t=0;t<150;t++)
		s[0] = s[0] + (power[t] / fact[t]);
	return s;
}

int main(void) {
	pthread_t thread1,thread2,thread3;
	long double **sum;
	printf("Exponential [PROMPT] Enter the value of x (between 0 to 100) (for calculating exp(x)):");
	scanf("%Lf",&x);
	printf("\nhello %Lf\n",x);
	
	printf("\nExponential [INFO] Threads creating.....\n");
	pthread_create(&thread1,NULL,Power,NULL); //calling power function
	pthread_create(&thread2,NULL,Fact, NULL); //calling factorial function
	printf("Exponential [INFO] Threads created\n");
	pthread_join(thread1,NULL);
	pthread_join(thread2,NULL);
	printf("Exponential [INFO] Master thread and terminated threads are joining\n");
	printf("Exponential [INFO] Result collected in Master thread\n");
	pthread_create(&thread3,NULL,Exp,NULL);
	pthread_join(thread3,sum);
	printf("\neXPONENTIAL [INFO] Value of exp(%.2Lf) is : %Lf\n\n",x,s[0]);
	exit(1);
}
