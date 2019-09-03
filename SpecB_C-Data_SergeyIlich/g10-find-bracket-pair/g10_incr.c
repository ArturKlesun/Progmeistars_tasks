//найти скобочную пару в скобочном выражении быстрее, чем за 31 подход, считая что у нас есть функция, которая находит последнюю единичку в числе за одну операцию.
#include <stdio.h>
#include <stdlib.h>

typedef unsigned char byte;

int inc(int x){
	unsigned b = 1;
	while (b){
		if (!(b & x)) return (x | b);
		else x &= ~b;
		b<<=1;
	}
}

int getlastbitonly(unsigned x){
	return x & (x ^ (x-1));
}

unsigned lastnrs(unsigned* x){
	unsigned rez = getlastbitonly(*x);
	*x ^= rez;
	return rez;
}

unsigned getfirstskob(unsigned x){
	x ^= 1;
	unsigned edge = 1;
	for (unsigned i=1<<2; i; i<<=2){
		if (i == lastnrs(&x)) edge = i;		
	}
	return edge;
}

char getdibisum(unsigned x){
	int i = 0;
	while (x){
		x &= x-1;
		i++;
	}
	return i % 2;
}

int incpro(int x){
	int b = getlastbitonly(~x);
	x |= b;
	b>>=1;
	while (b){
		x &= ~b;
		b>>=1;
	}
	return x;
}

int main(){
	printf("\nПрошу, введите правильное скобочное выражение из 32 символов (например: 4x\"(()(()))\")\n");
	char c[32];
	unsigned y = 0;
	unsigned cur = 1<<31;
	scanf("%s",c);
	for (int i=0; i<32; i++){
		c[i]-=40;
		if (c[i]) y |= cur;
		cur>>=1;
	}
	unsigned rez = getfirstskob(y); 
	int b;
	for (b = 0; rez; rez<<=1, b++);
	printf("Вот оно, наше число: %x\n", y);
	printf("Первая скобка закрывается в %i-й ячейке (начиная с единицы)\n", b);
	return 0;
}
