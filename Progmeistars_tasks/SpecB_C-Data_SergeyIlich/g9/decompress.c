// Эта программа вызывается с одним параметром - путём файла, который надо разжать
// Результат разжатия сохраняется в файл result.txt
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int compare(char * a, char * b, unsigned char len);
void printbp(char* a, int len);
int decompress(char* pth);
	
int main(char argc, char* argv[]){
	char* s;
	if (argc<2) s = "compressed.klsn";
	else s = argv[1];
	decompress(s);
	return 0;
}

int compare(char * a, char * b, unsigned char len){
	while (len--) {
		if (*a > *b) return 1; 
		else if (*a < *b) return -1;
		a++; b++;
	}
	return 0; // Поскольку из цикла не вышел - они равны
}

void printbp(char* a, int len){
	while(len--){
		printf("%c", *(a++));
	}
}

int decompress(char* pth){
	char* temp;
	FILE* fkey = fopen("key.key", "rb");
	char sklad[256]; char *strar[256]; int l;
	 
	for (int i=0; sklad != NULL && i < 256; i++){
		fgets(sklad, sizeof(sklad), fkey);
		if (sklad[0]=='\n') { 
			temp = strar[i-1]+strlen(strar[i-1]);
			*temp ='\n';					
			temp++;
			*temp = 0;
			fgets(sklad, sizeof(sklad), fkey);
		}
		l = strlen(sklad);
		
		sklad[--l] = 0; // Перекрываем возврат каретки
		strar[i] = malloc(sizeof(char)*l+2);
		memcpy(strar[i], sklad, l+1);
		
	}
	fclose(fkey); // strar - массив ключиков
	
	char ku4abit[256]; int b, b1, b2; int c = 0; char found; char specsymb = 0; char fignya;
	
	FILE* fklsn = fopen(pth, "rb"); 
	b1 = getc(fklsn);
	b2 = getc(fklsn);
	b = getc(fklsn);
	
	FILE* result = fopen("result.txt", "wb"); 
	unsigned long int bcount = 0;
	for (int g=0; b2 != EOF; g++) {
		if (b == EOF) {
			for (int i=128; b2; i>>=1, b2--) if (i & b1) ku4abit[c++] = '1'; else ku4abit[c++] = '0'; 
			ku4abit[c++]=0;
			b2 = EOF;
		} else {
			for (int i=128; i; i>>=1) if (i & b1) ku4abit[c++] = '1'; else ku4abit[c++] = '0'; 
			b1 = b2; b2 = b;
			b = getc(fklsn);
			if (c<256) continue;
		}	
		do {
			for (l=1, found = 0; l<c && !found; l++) {// Длинна
				for (int i = 0; i<256; i++) { // С каким по очереди сравнивать
					
					if (strlen(strar[i])-1 > l) break;
					if (strlen(strar[i])-1 < l) continue;
					
					if (compare(ku4abit,strar[i],l) == 0) {
						putc( strar[i][l], result );
						memcpy(ku4abit, ku4abit+l, strlen(ku4abit)-l);
						ku4abit[strlen(ku4abit)-l]=0;
						c -= l;
						l = 0;
						break;
					}
				}	
			}	
		} while ( l < c);
	} 
	//b2 - хранит число нужных битов в предпоследнем
	//b1 - последний байт с лишними битами
	fclose(result);
	fclose(fklsn);
	for (int i = 0; i<256 && strar[i]!=NULL; i++) free(strar[i]);
	printf("Разжатие завершено.\n");
	return 0;
}


