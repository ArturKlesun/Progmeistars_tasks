// Запустите эту программу с путём к файлу в качестве параметра
// Программа вычисляет 32-хбитную хеш-сумму файла по введённому ключу
#include <stdlib.h>
#include <stdio.h>
#include "unit.c"

int main(char argc, char *argv[]){
	if (argc == 1) exit(13);
	FILE *f;
	f = fopen(argv[1], "r");
	int32_t hash; 
	if (argc > 2) hash = make_hash( f, atoi(argv[2]) );
	else hash = make_hash( f, 42 );
	printf("\nВаш хэш: %u\n", hash);
	fclose(f);
	return 0;
}
