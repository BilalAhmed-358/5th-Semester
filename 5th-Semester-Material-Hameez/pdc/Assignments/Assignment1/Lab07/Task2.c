#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

void *Volunteer(void *ThreadId){
	int id = (int)ThreadId, i2=0, i;
	
	if(id == 0)
		printf("Volunteer 1 Manages on Day Registeration.\n");
	else if (id==1)
		printf("Volunteer 2 handles announcements.\n");
	else if (id==2)
		printf("Volunteer 3 handles sponsors.\n");
	else if (id==3)
		printf("Volunteer 4 resolve queries of particpants.\n");
		
	pthread_t pid[100];
	for(i=0; i<100; i++, i2++){
		pthread_create(&pid[i], NULL, Volunteer, (void*)i2);
	}
	
}

int main(){
	int status, i=0;
	pthread_t tid1, tid2, tid3, tid4;
	pthread_create(&tid1, NULL, Volunteer, (void*)i++);
	pthread_join(tid1, NULL);
	pthread_create(&tid2, NULL, Volunteer, (void*)i++);
	pthread_join(tid2, NULL);
	pthread_create(&tid3, NULL, Volunteer, (void*)i++);
	pthread_join(tid3, NULL);
	pthread_create(&tid4, NULL, Volunteer, (void*)i++);
	pthread_join(tid4, NULL);
	
	pthread_exit(NULL);
	return 0;
}
