#include <stdio.h>

int main(char argc, char* argv[]){
	if (argc < 2) {printf("Вы не правы!\n"); return(66);}
	FILE* fr = fopen(argv[1], "rb");
	unsigned char b;
	do{
		b = getc(fr);
		printf("%2x_%i ", b, b);
	}while (b != 255);
	printf("\n");
	return 0;
}
