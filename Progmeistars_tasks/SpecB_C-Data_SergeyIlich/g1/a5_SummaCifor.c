// Эта программа находит сумму цифр введённого числа
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int chrtoint(char c){
	c-=48;
	return c;
}

int main(){
	printf("\nВведите, пожалуйста, число:");
	char c[100];
	scanf("%s", c);
	int sum=0;
	for (int i=0; i<strlen(c); i++){
		sum+=chrtoint(c[i]);
	}
	printf("\n%i\n", sum);
}
