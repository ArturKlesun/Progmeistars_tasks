// Считаем кубический корень  
#include <stdlib.h>
#include <stdio.h>

int main(){
	float eps=0.0000000001;
	float n;
	printf("Введите, пожалуйста, число, из кторого хотите вычислить кубический корень:\n");
	scanf("%a", &n);
	double l=0, r=n, sub;
	while (r-l>eps) {
		sub=(l+r)/2;
		if (sub*sub*sub>n) {
			r=sub;
		} else l=sub;
	}
	printf("Кубический корень из числа %f равен где-то %f\n", n, sub);
	return 0;
}
