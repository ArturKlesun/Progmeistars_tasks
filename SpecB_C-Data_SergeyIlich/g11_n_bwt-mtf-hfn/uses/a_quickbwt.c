#include <stdio.h>
#include <stdlib.h>

#define universe 42
//#define x->-> x=x->next
//#define x->=y x=x->y 
//static

typedef unsigned char byte;

byte* begin;
byte* end;
unsigned byte_count;
unsigned ari;
unsigned byteWritten;

void outputandfree(byte* otmasuk[], FILE* fw);
byte* dec(byte* b);
byte* inc(byte* b);

int comp (const void* va,const void* vb){
	byte* a;
	byte* b;
	a = *(byte**)va;
	b = *(byte**)vb;
	while (*a == *b){
		a++;
		b++;
		if (a == end) a = begin;
		if (b == end) b = begin;
	}
	return *a - *b;
}

int main(char argc, char* argv[]){
	if (argc != 2) {printf("Извините, но вы неправы\n"); return 66;}
	byte* heap = malloc(1024*8 * sizeof(byte));
	unsigned heap_size = 1024*8;
	unsigned cur_b = 0;
	
	FILE* fr = fopen(argv[1], "rb");
	
	int readb;
	while ((readb = getc(fr)) != EOF){
		
		heap[cur_b] = readb;
		cur_b++;
		if (cur_b == heap_size) {
			heap = realloc(heap, heap_size *= 2); //extend(&heap, &heap_size);	
		}
	}
	fclose(fr);
	byte_count = cur_b;
	begin = heap;
	end = heap + byte_count;  
	byte** otmasuk = malloc(byte_count*sizeof(byte*));

	int i;
	for (i=0; i<byte_count; i++){
		otmasuk[i] = heap+i;
	}
	printf("Начал сортировку (если файл больше мегабайта, она длится больше 30 секунд)\n");
	qsort(otmasuk, byte_count, sizeof(byte*), comp);
	printf("Закончил сортировку\n");
	
	FILE* fw = fopen("output.bwt", "wb");
	
	byteWritten = 0;
	outputandfree(otmasuk, fw);
	printf("Файл записан!\n");
	free(heap);
	free(otmasuk);
	fclose(fw);
	return 0;
}
byte* dec(byte* b){
	if (b == begin) b = end;
	b--;
	return b;
}

void outputandfree(byte* otmasuk[], FILE* fw){
	int i;
	unsigned n;
	for (i = 0; i<byte_count; i++){
		if (otmasuk[i] == begin) printf("%u\n", n=byteWritten);
		putc(*dec(otmasuk[i]), fw);
		byteWritten++;
	}
	for (i=0; i<4; i++){
		putc( (byte)(n>>24) ,fw );
		n<<=8;
	}
}

