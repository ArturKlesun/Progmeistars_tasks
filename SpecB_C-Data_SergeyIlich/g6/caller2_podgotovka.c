#include <stdio.h>
#include <stdlib.h>

int main(){
	FILE* slovarj = fopen("slovarj.txt", "w");
	FILE* szatij = fopen("szatij.dat", "wb");
	unsigned char r;
	for (int i=0; i<255; i++){
		r = rand() % 10;
		for (int u=0; u<r; u++){
			if (rand() % 2) putc('1', slovarj);
			else putc('0', slovarj);
		}
		putc('\n', slovarj);
	}
	for (int i=0; i<5; i++) putc(rand() % 255, szatij);
	fclose(slovarj);
	fclose(szatij);
}
