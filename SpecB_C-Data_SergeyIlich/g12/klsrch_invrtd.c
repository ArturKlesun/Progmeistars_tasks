// Это доработка небезызвестной программы klesearch
// В отличии от своей предшественницы, эту версию отличает производительность
// обусловленная использованием меньшего числа бинарных операций при поиске.
// Чтобы этого добиться, пришлось поменять единички с ноликами местами, что
// делает программу совершенно нечитабельной, но компилируемой
#include <stdio.h>
#include <stdlib.h>
#include "colors.c"

typedef unsigned char byte;
typedef unsigned uns;

int main(char argc, char* argv[]){
	if (argc<2) {printf("А где файл вторым параметром?\n"); return 66;}
	uns pre[256] = {0};
	char word[32] = {0};
	byte patlen = 0;
	printf("Введите, пожалуйста, паттерн для поиска\n");
	scanf("%s", word);
	uns b;
	byte cnt;
	uns asdcnt = 1;
	for (b=0; b<256; b++){
		asdcnt = 1;
		for (cnt=0; word[cnt]; cnt++, asdcnt<<=1){
			if (word[cnt] == b) { 
				pre[b] |= (asdcnt);
			}
		}
		pre[b] = ~pre[b];
		patlen = cnt;
	}
	
	FILE* fr = fopen(argv[1], "rb");
	byte* text = malloc(1024);
	uns textlen = 1; // В text[0] будет мусор, чтобы следить за порядком
	uns bufsize = 1024;
	while ( (b = getc(fr)) != EOF ) {
		text[textlen] = b;
		textlen++;
		if (textlen == bufsize) {
			text = realloc(text, bufsize*=2);
		}
	}
	text = realloc(text, textlen);
	
	uns* Viktor = malloc(textlen*sizeof(uns));
	uns* VikZam = malloc(textlen*sizeof(uns)); 
	uns* ViVsta = malloc(textlen*sizeof(uns)); 
	uns* VikUda = malloc(textlen*sizeof(uns)); 
	Viktor[0] = (unsigned)(-1); // R[0], ну эта... невидимая... чтобы первая не была изгоем
	printf("Ща вдарим по Викторам!\n");
	
	int i;
	printf("len %i\n", patlen);
	uns answer = (unsigned)(-1) ^ (1<<(patlen-1));
	for (i=1; i<textlen; i++){
		Viktor[i] =   (Viktor[i-1]<<1) | pre[ text[i] ]; 
		VikZam[i] = ( (VikZam[i-1]<<1) | pre[ text[i] ] ) & (Viktor[i-1]<<1);
		ViVsta[i] = ( (ViVsta[i-1]<<1) | pre[ text[i] ] ) & (Viktor[i]<<1  );
		VikUda[i] = ( (VikUda[i-1]<<1) | pre[ text[i] ] ) & (Viktor[i-1]   );
	}
	for (i=0; i<textlen; i++){
		printf("%c", text[i]);
		if (~(Viktor[i] | answer) ) printf("%sP", green); // Совпадает слово целиком
		else {
			if (~(VikZam[i] | answer) ) printf("%sZ", cyan); // Совпадает, если заменить одну букву
			if (~(ViVsta[i] | answer) ) printf("%sV", magenta); // Совпадает, если вставить одну букву
			if (~(VikUda[i] | answer) ) printf("%sD", brown); // Совпадает, если удалить одну букву
		}
		printf("%s",none);
	}
	free(VikUda);
	free(ViVsta);
	free(VikZam);
	free(Viktor);
	free(text);
	return 0;
}

