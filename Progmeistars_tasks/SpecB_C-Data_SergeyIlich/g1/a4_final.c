// Написать программу, которая разбивает число на простые множества
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void razlonamno(int n){
	if (n<2) return;
	int k=2;
	while (k<=n){	
		if (n % k == 0) {
			n/=k;
			printf("\n%d",k);
		} else k++;
	}
}

int main(){
	int n;
	printf("Введите, пожалуйста, число: ");
	scanf("%i", &n);
	razlonamno(n);
	return 0;
}
