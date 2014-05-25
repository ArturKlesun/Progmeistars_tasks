// Эта программа сжимает файл по методу Хаффмана в файл compressed.klsn
// Путь к файлу для сжатия передаётся параметром функции main()
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <limits.h>

typedef struct telement *pelement;
struct telement{
	pelement left;
	pelement right;
	int value;
	char bitpath[258];
} telement_default = {NULL, NULL, INT_MIN, {""}};

void s1tos2s1(char* a1, char* a2);
void printstr(char* a);
void razdatj_ot(pelement viska);
void printtree(pelement p, int n);
void otsortirovatj(pelement a[], unsigned len);
void mkbound(pelement otmasuk[], pelement where);
int compar(const void * a, const void * b);
int doklsn(FILE* vvod, void* viska, struct telement* skoki);




int main(char argc, char* argv[]){
	if (argc<2) {printf("Вы не правы!\n"); return(66);}
	int start_count = 256;	
	struct telement *skoka = malloc(sizeof(struct telement) * (start_count*2-1));
	for (int i = 0; i < start_count*2-1; i++) skoka[i] = telement_default;
// Отсортированный массив указателей
	pelement* otmasuk = malloc(sizeof(pelement) * (start_count+1));
	pelement* origin = otmasuk;
// Заглушка
	otmasuk[start_count] = malloc(sizeof(struct telement));
	otmasuk[start_count]->value = INT_MAX;
	for (int i=0; i<start_count; i++) {
		skoka[i].value = 0;
		otmasuk[i] = &(skoka[i]);
	}
	FILE* fr = fopen(argv[1], "rb");
	unsigned long int bcount =0;
	for (int b = getc(fr); b!=EOF; b = getc(fr)){
		skoka[b].value++;
	}
	fclose(fr);

	otsortirovatj(otmasuk, start_count);
	
	for (int i=0; i<start_count-1; i++)
		mkbound(otmasuk++, &(skoka[start_count+i]) );

	free(origin[start_count]); // Освобождаем память из под заглушки
	free(origin);

	pelement viska = skoka+start_count*2-2;
	
	razdatj_ot(viska);
	
	for (int i=0; i<256; i++) {
		skoka[i].bitpath[257] = i;
	}
	
	fr = fopen(argv[1], "rb");	
	
	doklsn(fr, viska, skoka);
	return 0;
}


void s1tos2s1(char* a1, char* a2){
	char sub[256] = {0};
	char *a0 = a1;
	char *p = sub;
	while (*a1) {
		*p = *a1;
		a1++; p++;
	}
	p = sub;
	while (*a2) {
		*a0 = *a2; a2++; a0++;
	}
	while (*p){
		*a0 = *p;
		a0++; p++;
	}
	*a0=0;
	
}

void printstr(char* a){
	while (*a) printf("%c", *(a++));
}

void razdatj_ot(pelement viska){
	if (viska->left == NULL) return;
	s1tos2s1(viska->left->bitpath, viska->bitpath);
	s1tos2s1(viska->right->bitpath, viska->bitpath);
	razdatj_ot(viska->left);
	razdatj_ot(viska->right);
}

void printtree(pelement p, int n){
	for (int i=20; i>n; i--) {printf(" ");}
	if (p->value!=0) printf(" %i_%i_%s\n", p->value, n, p->bitpath);
	
	if (p->left == NULL) return;
	printtree(p->left, n+1);
	printtree(p->right, n+1);
}


void otsortirovatj(pelement a[], unsigned len){
	pelement* ar1 = malloc(sizeof(pelement)*len);
	int l0,l1; 
	for (unsigned i=1; i; i<<=1){
		l0 = l1 = 0;
		for (int r=0; r<len; r++){
			if (a[r]->value & i) {ar1[l1] = a[r]; l1++;}
			else {a[l0] = a[r]; l0++;}
		}
		memcpy(a + l0, ar1, (l1 * sizeof(&(*a)) ));
	}
	
	free(ar1);	
}

void mkbound(pelement otmasuk[], pelement where){
	where->left = otmasuk[0];
	s1tos2s1(where->left->bitpath, "0");
	otmasuk++;
	where->right = otmasuk[0];
	s1tos2s1(where->right->bitpath, "1");
	where->value = where->left->value + where->right->value;
	pelement* sp = otmasuk;
	while ( (*(sp+1))->value < where->value){
		*sp = *(sp+1);
		sp++;
	}
	*sp = where;
}



//---------
// Компрессор
//--------


int compar(const void * a, const void * b){ // a,b - указатель на указатель на строку... наверное
	int aa, bb;
	aa = strlen(*(char**)a);
	bb = strlen(*(char**)b);
	if (aa<bb) return -1;
	else if (aa>bb) return 1;
	else return 0;
}

int doklsn(FILE* vvod, void* viska, struct telement* skoki){
	FILE* fw = fopen("compressed.klsn", "wb");
	unsigned char sb = 0; unsigned char c = 0;
	char* s;	
	unsigned long int bcount = 0;
	for ( int b = getc(vvod);  b != EOF;  b = getc(vvod) ){
		s = skoki[b].bitpath;
		while (*s) {
			if (*s == '1') sb += 128>>c;
			c++;
			if (c == 8) {
				putc(sb, fw);
				c = 0;
				sb = 0;
			}
			s++;
		}
	}
	putc(sb, fw);
	putc(c, fw);
	fclose(fw);	fclose(vvod);
	printf("Кодирование завершено!\n");
	int l;
	
	for (int i=0; i<256; i++){
		l = strlen(skoki[i].bitpath);
		skoki[i].bitpath[l] = i;
		skoki[i].bitpath[l+1] = 0;
	}
// Создадим массив указателей (), чтобы отсортить пути
	char* masiki[256];
	for (int i=0; i<256; i++){
		masiki[i] = skoki[i].bitpath;
	}
	qsort(masiki, 256, sizeof(char*), compar);
	FILE* key = fopen("key.key", "w");
	for (int i=0; i<256; i++){
		fprintf(key, "%s\n", masiki[i]);
	}
	fclose(key);
	printf("Создание файла ключей завершено!\n");
	return 0;
}



