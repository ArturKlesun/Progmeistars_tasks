// Параметр - имя файла
#include <stdio.h>
#include <string.h>

int main(char argc, char* argv[]){
	if (argc < 2) {printf("Извините, но вы неправы. Введите путь к файлу параметром\n"); return 66;}
	printf("Сейчас сожму файл\n");
	
	char command[256] = "gcc ./uses/a_quickbwt.c && ./a.out ";
	char* p;
	p = strcat(command, argv[1]);
	if (unix) system(command);
	else  {
		printf("Извините, но вы пользуетесь Windows (или MacOS)\n");
		return 33;
	}
	printf("Перевели файл в BWT\n");
	
	system("gcc ./uses/b_klesmtf.c && ./a.out output.bwt");
	system("rm output.bwt");
	printf("Перевели файл в MTF\n");
	
	system("gcc ./uses/c_hufcompress.c -std=c99 && ./a.out output.mtf");
	system("rm output.mtf");
	printf("Сжали файл\n");	
	
	printf("Всем спасибо, все свободны, название вашего файла: compressed.klsn\n");
	
	return 0;
}