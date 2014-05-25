#include <stdio.h>
#include <stdlib.h>
#include "b4_unit.c"

int main(){
	time_t t;
	srand((unsigned) time(&t));
	unsigned n = rand() % (1<<31);
	printf("Привет! Наше исходное число:\n");
	printbi(n);
	
	printf("Сначала его надо перевернуть:\n");
	n = reverse(n);
	printbi(n);
	
	printf("Теперь надо найти в нём самую длинную цепочку единичек:\n");
	printf("А вот и она - %i\n", longest1(n));
	
	printf("Теперь надо найти в нём самую длинную цепочку ноликов:\n");
	printf("А вот и она - %i\n", longest0(n));
	
	printf("Все свободны, спасибо за внимание.\n");
	return 0;
}
