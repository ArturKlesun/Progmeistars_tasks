// Привет
// Эта программа конвертирует файл с 8-битовыми байтами в файл с 6-битовыми байтами и наоборот
#include <stdio.h>	

void decript(char *name, int from, int to, char *output){
	FILE *fr;
	fr = fopen(name, "rb");
	FILE *fw;
	fw = fopen(output, "wb");
	char b;
	char sdvig = 0;
	unsigned sub_field = 0;
	char mask = (1<<to) - 1;
	for (b = getc(fr); b!=EOF; b = getc(fr)){
		sub_field += b << sdvig;
		sdvig += from;
		while (sdvig >= to){
			putc(sub_field & mask, fw);
			sdvig -= to;
			sub_field >>= to;
		}
	}
	if (from > to && sdvig > 0){
		putc(sub_field & mask, fw);
	}
	fflush(fw);
	fclose(fw);
	fclose(fr);
	return;
}



void print64(char *s){
	char b;
	FILE *fr;
	fr = fopen(s, "rb");
	b = getc(fr);
	do{
		if (b < 26) b += 0x41;
		else if (b < 52) b += 0x61 - 26;
		else if (b < 62) b += 0x30 - 52;
		else if (b == 62) b = '-';
		else b = '_';
		printf("%4c ", b);
		b = getc(fr);
	} while (b != EOF);
	printf("\n");
	fclose(fr);
}

void printfl(char *s){
	char b;
	FILE *fr;
	fr = fopen(s, "rb");
	b = getc(fr);
	do{
		printf("%4i ", b);
		b = getc(fr);
	} while (b != EOF);
	printf("\n");
	fclose(fr);
}

int main(){
	// Файл, который мы будем криптовать, а потом раскриптовывать
	printf("Введите, пожалуйста, название файла:\n");
	char s[255];
	scanf("%s", &(s[0]));
	// выводим содержимое файла
	printfl(s);
	decript(s, 8, 6, "result.dat");
	printfl("result.dat");
	print64("result.dat");
	decript("result.dat", 6, 8, "rezrez.txt");
	printfl("rezrez.txt");
	return 0;
}
