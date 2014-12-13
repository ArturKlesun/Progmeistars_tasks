#include <stdio.h>

int main(){
// Задача: сделать таблицу умножения
	for (int subj=1; subj<10; subj++){
		printf("\n");
		for (int obj=1; obj<10; obj++){
			printf("%d*%d=%2d  ", subj, obj, obj*subj);
		}
	}
	printf("\n");
	return 0;
}
