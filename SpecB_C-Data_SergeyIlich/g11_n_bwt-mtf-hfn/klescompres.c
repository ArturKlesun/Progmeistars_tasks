// Параметр - имя файла
#include <stdio.h>
#include <string.h>

/**
 * this, ladies and gentlemen, despite yoptascriptish variable
 * naming, is a self-sufficient data compressor comparable to gzip
 *
 * for https://code.jquery.com/jquery-3.4.1.js
 * it gives such compression rate: 4,10607621
 * whereas gzip gives: 4,415282392
 * (gzip uses some complex less academic algorithms to win these few % difference afaik)
 *
 * be careful, the bwt part uses qsort instead of bucket sort, so
 * compression time grows exponentially with input file size
 */
int main(char argc, char* argv[]){
	if (argc < 2) {printf("Извините, но вы неправы. Введите путь к файлу параметром\n"); return 66;}
	printf("Сейчас сожму файл\n");

	// first apply Burrows–Wheeler transform to the file contents
	// it's a neat algorithm that re-arranges bytes in such way that
	// most repeating sequences are placed next to each
	// other - such structure compresses very well
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