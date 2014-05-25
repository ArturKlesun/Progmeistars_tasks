#include <stdio.h>
#include <stdlib.h>

void printbi(unsigned n){
  unsigned sub = n;
  int i=0;
  for (; i<16; i++){
        if (n & 1<<15)
       printf("1");
    else
       printf("0");
    n <<= 1;
    if (i == 7) printf(" ");
  }
  printf("=%d",sub);
  printf("\n");
}

unsigned getchecksum(char *f){
   FILE *fr = fopen(f, "rb");
   unsigned long sum=0;
   unsigned c=0;
   int i=0;
   while ( (c = getc(fr)) != EOF){
   	if (i % 2 == 1) {c <<= 8;}
	sum += c;
   	if ( sum & (1<<16) ) {sum ^= 1<<16; sum++;}
   	i++;
   }
   fclose(fr);
   return sum;
}
