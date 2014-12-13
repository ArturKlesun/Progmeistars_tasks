// Параметр - имя файла
#include <stdio.h>
#include <string.h>

int main(char argc, char* argv[]){
	if (argc < 2) {printf("Извините, но вы неправы. Введите путь к файлу параметром\n"); return 66;}
	printf("Сейчас разожму файл\n");
	
	char command[256] = "gcc ./uses/d_unhufcompress.c -std=c99 && ./a.out ";
	char* p;
	p = strcat(command, argv[1]);
	if (unix) system(command);
	else  {
		printf("Извините, но вы пользуетесь Windows (или MacOS)\n");
		return 33;
	}
	printf("Перевели файл в mtf\n");
	
	system("gcc ./uses/e_unmtf.c && ./a.out uncompressed.dat");
	system("rm uncompressed.dat");
	printf("Перевели файл в bwt\n");
	
	system("gcc ./uses/f_unbwt.c && ./a.out unmtfout.dat");
	system("rm unmtfout.dat");
	printf("Разжали файл\n");	
	
	printf("Всем спасибо, все свободны, название вашего файла: unbwtout.dat\n");
	
	return 0;
}