#include <stdio.h>
#include <stdlib.h>

typedef unsigned char byte;

// bueee
byte* begin;
byte* end;
unsigned byte_count;

void outputandfree(byte* otmasuk[], FILE* fw);
byte* dec(byte* b);

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

/**
 * Burrows–Wheeler transform
 *
 * Despite the file name, it's actually awfully slow BWT implementation... I would guess
 * that "quick" part means that it uses built-in qsort() function instead of bucket sort
 */
int main(char argc, char* argv[]){
	if (argc != 2) {printf("Извините, но вы неправы\n"); return 66;}
	byte* input_bytes = malloc(1024*8 * sizeof(byte));
	unsigned heap_size = 1024*8;
	unsigned input_size = 0;
	
	FILE* input_file = fopen(argv[1], "rb");

	int readb;
	while ((readb = getc(input_file)) != EOF) {
		input_bytes[input_size] = readb;
		input_size++;
		if (input_size == heap_size) {
			input_bytes = realloc(input_bytes, heap_size *= 2); //extend(&heap, &heap_size);
		}
	}
	fclose(input_file);

	byte_count = input_size;
	begin = input_bytes;
	end = input_bytes + byte_count;
	byte** otmasuk = malloc(byte_count*sizeof(byte*));

	int i;
	for (i=0; i<byte_count; i++){
		otmasuk[i] = input_bytes+i;
	}
	printf("Начал сортировку (если файл больше мегабайта, она длится больше 30 секунд)\n");
	qsort(otmasuk, byte_count, sizeof(byte*), comp);
	printf("Закончил сортировку\n");
	
	FILE* fw = fopen("output.bwt", "wb");
	
	outputandfree(otmasuk, fw);
	printf("Файл записан!\n");
	free(input_bytes);
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
	unsigned bytes_written = 0;
	for (i = 0; i<byte_count; i++){
		if (otmasuk[i] == begin) printf("%u\n", n=bytes_written);
		putc(*dec(otmasuk[i]), fw);
		bytes_written++;
	}
	// finishing the file with the length of data
	for (i=0; i<4; i++){
		putc( (byte)(n>>24) ,fw );
		n<<=8;
	}
}

