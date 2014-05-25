// 1 3 6 10 15 21 28, всё ясно
#include <stdio.h>
#include <stdlib.h>

int main(){
	printf("\nПривет.");
	printf("\nВведите число, и я скажу, к какому элементу последовательности оно соответствует.\n");
	int n;
	scanf("%i", &n);
	int rez=0;
	for (int i1=1; i1<1000; i1++){
		rez+=i1;
		printf(" %i",rez);
		if (rez==n){
			printf("Номер вашего числа: %i\n", i1);
			return 0;
		}
	}
	return 0;
}
