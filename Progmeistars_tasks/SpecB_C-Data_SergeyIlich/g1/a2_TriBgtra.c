// Задача: из списка чисел найти три наибольших
#include <stdio.h>
#include <stdlib.h>

void sravnitj(int cislo, int iteracija, int *ptr){
	if (cislo>*(ptr+iteracija)) {
		// Опускаем тек. значение на нижн. порядки
		for (int i=2; i>=iteracija+1; i--){
			if (iteracija==2) break;
			*(ptr+i)=*(ptr+i-1);
		}
		*(ptr+iteracija)=cislo;
	} else if (iteracija!=2) sravnitj(cislo, iteracija+1, ptr);
	return;
}

int main(){
	
	int maxi[3];
	maxi[0]=maxi[1]=maxi[2]=0;
	
	int massiv[10];
	for (int i=0; i<10; i++){
		massiv[i]=rand() % 100;
		printf("%d ",massiv[i]);
	}
	printf("\n");
	for (int i=0; i<10; i++){
		sravnitj(massiv[i], 0, maxi);
	}
	printf("%d %d %d\n",maxi[0],maxi[1],maxi[2]);
	return 0;
}
