#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <limits.h>

typedef struct telement *pelement;
struct telement{
	pelement left;
	pelement right;
	int value;
};

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
	otmasuk++;
	where->right = otmasuk[0];
	where->value = where->left->value + where->right->value;
	pelement* sp = otmasuk;
	while ( (*(sp+1))->value < where->value){
		*sp = *(sp+1);
		sp++;
	}
	*sp = where;
}

pelement create(unsigned start_count){
	
	struct telement *derevo = malloc(sizeof(struct telement) * (start_count*2-1));
	
	// Отсортированный массив указателей
	pelement* otmasuk = malloc(sizeof(pelement) * (start_count+1));
	pelement* origin = otmasuk;

// Заглушка
	otmasuk[start_count] = malloc(sizeof(struct telement));
	otmasuk[start_count]->value = INT_MAX;
	
	for (int i=0; i<start_count; i++) {
		derevo[i].value = rand() % 100;
		otmasuk[i] = &(derevo[i]);
		printf("%i ", derevo[i].value);
	}
	
	otsortirovatj(otmasuk, start_count);
	printf("\n");	
	
	for (int i=0; i<start_count-1; i++){
		/*
			printf("\n%i\n", i);
			for (int i2=0; i2<start_count+i; i2++) printf("%i ", derevo[i2].value);
			printf(" - Основной массив");
			printf("\n");
			for (int i2=0; i2<start_count-i; i2++) printf("%i ", otmasuk[i2]->value);
			printf(" - Отсортированный массив указателей");
			printf("\n");
		*/
		mkbound(otmasuk++, &derevo[start_count+i]);
	}
	pelement p = otmasuk[0];
	free(origin[start_count]); // Освобождаем память из под заглушки
	free(origin);
	return p;
}
