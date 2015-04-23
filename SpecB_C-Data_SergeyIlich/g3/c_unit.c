#include <string.h>
#include <stdio.h>

void printbi(unsigned);

// 1
int sum(int *a, int len){
	int rez=0;
	int *p = a;
	while (p-a<len){
		rez += *p;
		p++;
	}
	return rez;
}

// 2
int countmax(int *a, int len){
	int max = a[0];
	int count = 0;
	int *p = a;
	while (p-a < len){
		if (*p>=max){
			if (*p == max) count++; else {max = *p; count=1;}
		}
		p++;
	}
	return count;
}
// 3
// Сравнивает два массива; сначала первые элементы, потом последние
int compare(int *a, int *b, int len){
	for (int i=0; i<len; i++){
		if (a[i] > b[i]) return 1; 
		else if (a[i] < b[i]) return -1;
	}
	return 0; // Поскольку из цикла не вышел - они равны
}
// 4
// Находит число в упорядоченном массиве
int search(int *a, int len, int x){
	int l,r;
	l=-1;
	r=len;
	int cen;
	do{
		cen = (l+r)/2;
		if (a[cen] == x) return cen;
		else if (a[cen] > x) r = cen;
		else l = cen; 
	}while (l+1 < r);
	return -1;
}
//6
// Битовая сртировка
//~2,8 секунды на массив из миллиона элементов
void bitsort(unsigned *a, int len){
	unsigned *ar1 = malloc(sizeof(unsigned)*len);
	int l0,l1; 
	for (unsigned i=1,c=0;  c<32;  i<<=1,c++){
		l0 = l1 = 0;
		for (int r=0; r<len; r++){
			if (a[r] & i) {ar1[l1] = a[r]; l1++;}
			else {a[l0] = a[r]; l0++;}
		}
		memcpy(a + l0, ar1, (l1 * sizeof(unsigned) ));
	}
	
	free(ar1);
	return;
}
void printbi(unsigned n){
	for (unsigned i = 1<<31; i; i>>=1) if (n & i) printf("1"); else printf("0");
	printf("\n");
}
//7
// Эта функция находит, с какой по какую ячейку будет выгоднее всего взять числа,
// чтобы получить самый большой результат. Ответы передаются в переменные fr, to, rez
void getmix(int *a, int l, int *fr, int *to, int *rez){
	int max_beg = -1;
	int max_end = -1;
	int max_val = -4294967296/2;
				 	
	int cur_beg = -1;
	int cur_val = -4294967296/2;
	
	char begun = 0;
	for (int i = 0; i < l; i++){
		if (begun) {
			
			if (a[i]<0) {
				if (cur_val > max_val) {
					max_beg = cur_beg;
					max_val = cur_val;
					max_end = i-1;
				}				
				if (cur_val + a[i] <= 0) {
					begun = 0;
				}
			}
			cur_val += a[i];
			
			if (i==l-1) {
				if (cur_val > max_val) {
					max_beg = cur_beg;
					max_val = cur_val;
					max_end = i;
				}		
			}
			
		} else {
			if (a[i]<=0) {
				if (max_val < a[i]){
					max_beg = i;
					max_end = i;
					max_val = a[i];
				}
				continue;
			}
			cur_beg = i;
			cur_val = a[i];
			begun = 1;
		}
	}
	*fr = max_beg;
	*to = max_end;
	*rez = max_val;
	return;
}
//8
// Здравствуйте, Сергей Ильич!
// Пожалуйста, не смотрите на реаллизацию этой функции!
// Здесь можно найти только боль и отчаяние...
struct Ssegment_cepi_nulej{
	int *place;
	struct Ssegment_cepi_nulej *next;
};
void otnulirovaniye(int *a, int len){
	
	struct Ssegment_cepi_nulej beg;
	beg.place = NULL;
	beg.next = NULL; 
	struct Ssegment_cepi_nulej *cur = &beg;
	
	
	int *l = a;
	int *r = a + len-1;
	int dirka = a[0];
	char dirka_sleva = 1;
	int *dirka_pos;
	while (l!=r){
		if (dirka_sleva){
			if (*r == 0) {
				(*cur).place = r;
				(*cur).next =  malloc(sizeof(struct Ssegment_cepi_nulej));
				cur = (*cur).next;
				(*cur).next = NULL;
			}
			
			if (*r < 0) {
				*l = *r;
				dirka_pos = r;
				l++;
				dirka_sleva--;
			} else r--;
		} else {
			if (*l == 0) {
				(*cur).place = l;
				(*cur).next =  malloc(sizeof(struct Ssegment_cepi_nulej));
				cur = (*cur).next;
				(*cur).next = NULL;
			}
			
			if (*l > 0) {
				*r = *l;
				dirka_pos = l;
				r--;
				dirka_sleva++;
			} else l++;
		}
	}
	*dirka_pos = dirka;
// После своей пробежки мы оставили нетронутыми нолики. Исправим это!
	if (beg.place != NULL) {
		int *kotl;
		struct Ssegment_cepi_nulej *ptr = &beg;
		while ((*ptr).next != NULL) {
			if ((*ptr).place < l) {
				kotl = l;
				while (*kotl>=0) kotl--;
				*((*ptr).place) = *kotl;
				*kotl = 0;
				l = kotl; 
			} else {
				kotl = r;
				while (*kotl<=0) kotl++;
				*((*ptr).place) = *kotl;
				*kotl = 0;
				r = kotl; 
			}
			ptr = (*ptr).next;
		}
	}
	struct Ssegment_cepi_nulej *ptr = beg.next;
	void *subptr;
	while (ptr!=NULL) {
		subptr = ptr;
		ptr=ptr->next;
		free(subptr);
	}
	return;
}

// 9
// Функция возвращает кол-во различных чисел в массиве
int search_n_add(int *a, int len, int x){
	int l,r;
	l=-1;
	r=len;
	int cen;
	do{
		cen = (l+r)/2;
		if (a[cen] == x) return cen;
		else if (a[cen] > x) r = cen;
		else l = cen; 
	}while (l+1 < r);
	int sub;
	for (int i = r; i<=len; i++){
		sub = a[i];
		a[i] = x;
		x = sub;
	}
	return -1;
}
int countdif(int *a, int len){
	int counter = 0;
	int *sub_arr = malloc(sizeof(int)*len);
	int sub_len = 0;
	int l,r;
	for (int i=0; i<len; i++){
		if ( search_n_add( sub_arr, sub_len, a[i]) == -1 ) {
			sub_len++;
			counter++;
		}
		
	}
	free(sub_arr);
	return counter;
}
// 10
// Функция возвращает длинну самого длинного отрезка подряд идущих чисел

int countqueue(int *a, int len){
	int max = 0;
	int counter = 0;
	int cur_num = a[0];
	for (int i = 0; i<len; i++){
		if (a[i] == cur_num) {
			counter++;
		} else {
			if (counter > max) max = counter;
			counter = 1;
			cur_num = a[i];
		}
	}
	return max;
}
