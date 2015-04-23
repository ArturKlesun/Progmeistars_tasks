#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "c_unit.c"

int main(){
	srand (time(NULL));
	int skoka = 7;
	int *ar1 = malloc(sizeof(int)*skoka);
	ar1[0]=3;
	for (int i=1; i<skoka; i++) {
		ar1[i]=ar1[i-1] + (rand() & 63);
	}
	for (int i=0; i<skoka; i++){printf("%i ", ar1[i]);}
	printf("\n");
	printf("Сумма! %i\n", sum(ar1, skoka));
	printf("Сколько экземпляров наибольшего? %i\n", countmax(ar1, skoka));
	int *ar2 = malloc(sizeof(int)*skoka);
	ar2[0]=3;
	for (int i=1; i<7; i++) {
		ar2[i]=ar2[i-1] + (rand() & 63);
	}
	for (int i=0; i<skoka; i++){printf("%i ", ar2[i]);}
	const char *answ;
	switch (compare(ar1,ar2,skoka)){
		case -1: answ = "2-ой больше"; break;
		case 0: answ = "равны"; break;
		case 1: answ = "1-ый больше"; break;
	}
	printf("Равны ли оне?! %s\n", answ);
	printf("Введите, пожалуйста, число:\n");
	int x;
	scanf("%d", &x);
	printf("%i (ячейка ближайшего от серединного деления, [-1 - нет такого числа в 1-м массиве])\n\n", search(ar1, skoka, x));
	char trash;
	scanf("%c", &trash);
	int skoka2 = 30;
	int *ar3 = malloc(sizeof(int)*skoka2);
	for (int i=0; i<skoka2; i++) {
		ar3[i]=(rand() % 4294967296*2);
	}
	for (int i=0; i<skoka2; i++) printf("%u\n", ar3[i]);
	printf("Это то, что было сначала\n\n");
	bitsort(ar3, skoka2);
	for (int i=0; i<skoka2; i++) {printf("%u\n", ar3[i]);}
	printf("А это - то, что насортировалось\n\n");
	
	free(ar1);
	free(ar2);
	free(ar3);
	
	skoka = 30; 
	ar1 = malloc(sizeof(int)*skoka);
	for (int i=0; i<skoka; i++) {
		printf("%3i", i);
	}
	printf("\n");
	for (int i=0; i<skoka; i++) {
		ar1[i]=(rand() & 15)-8;
		printf("%3i", ar1[i]);
	}
	int fr, to, rez;
	getmix(ar1, skoka, &fr, &to, &rez);
	printf("\nСейчас я найду самый выгодный микс! Это: с %i-й ячейки по %i-ю, сумма их - %i\n\n", fr, to, rez);
	
	otnulirovaniye(ar1, skoka);
	printf("Здесь мы видим, как все числа < 0 перешли в левую сторону, > 0 - в правую, а нули встали по-середине: \n");
	for (int i=0; i<skoka; i++) {
		printf("%i ", ar1[i]);
	}
	printf("\n");
	printf("\nСейчас посчитаем, сколько в том массиве разных чисел: %i\n", countdif(ar1, skoka));
	printf("\nА теперь я выведу размер самой длинной очереди подряд идущих чисел: %i\n", countqueue(ar1, skoka));
	return 0;
}
