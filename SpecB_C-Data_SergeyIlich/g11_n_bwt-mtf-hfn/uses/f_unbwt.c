// Первый параметр - имя файла, второй - номер исходной строки (от нуля)

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef unsigned usg;
typedef unsigned char byte;

usg byte_count;
byte* beg_col;
byte* end_col;
usg* na4ali;

usg findPlace(byte* end_col[], byte curb, usg splo6nyak);

void update(usg na4ali[256], byte* otmasuk[]){
	usg l,r,mid;
	l = 0;
	r = byte_count;
	byte curb;
	int i;
	for (i = 0; i < 256; i++){
		curb = i;
		if (*(otmasuk[0]) == curb) {
			mid = 0;
		} else {
			while (l < r-1){
				mid = (l+r)/2;
				if ( *(otmasuk[mid]) >= curb ) {
					r = mid;
				} else {
					if ( *(otmasuk[mid+1])==curb ) {mid++; break;}
					l = mid;
				}
			}
		}
		na4ali[curb] = mid;
	}
}

int cmpr(const void* av, const void* bv){
	byte a,b;
	a = **(byte**)av;
	b = **(byte**)bv;
	return a - b;
}

int main(char argc, char* argv[]){
	na4ali = malloc(256*(sizeof(usg)));
	int i;
	if (argc < 2) {printf("Извините, но вы не правы\n"); return 66;}
	FILE* fr = fopen(argv[1], "rb");
	byte_count = 0;
	usg heapsize = 4096;
	byte* heap = malloc(heapsize);
	int b;
	while ( (b=getc(fr)) != EOF) {
		if (byte_count == heapsize) {
			heapsize *= 2;
			heap = realloc(heap, heapsize);
		}
		heap[byte_count] = b;
		byte_count++;
	}
	byte* p = heap+byte_count - 1;
	usg koef = 1;
	usg n=0;
	for (i = 0; i<4; koef*=256, i++, p--){
		n += koef * (*p); 
	} 
	byte_count-=4;
	heap = realloc(heap, byte_count);
	end_col = heap;
	byte** otmasuk = malloc(byte_count*sizeof(byte*));
	for (i=0; i<byte_count; i++){
		otmasuk[i] = end_col+i;
	}
	qsort(otmasuk, byte_count, sizeof(byte*), cmpr);
	update(na4ali, otmasuk);
	beg_col = malloc(byte_count);
	for (i=0; i<byte_count; i++){
		beg_col[i] = *(otmasuk[i]);
	}
	
	byte* orig_row = malloc(byte_count);
	orig_row[0] = beg_col[n];
	orig_row[byte_count-1] = end_col[n];
	
	usg place = n;
	usg splo6nyak;
	byte curb = beg_col[place];
	
	for (i = 1; i<byte_count-1; i++) {
		//if (i % 1000 == 0) printf("%u\n", i);
		splo6nyak = 0;
		p = beg_col+place;
		splo6nyak = p - (beg_col + na4ali[curb]);
		place = findPlace(otmasuk, curb, splo6nyak);
		curb = orig_row[i] = beg_col[place];
	}
	FILE* fw = fopen("unbwtout.dat", "wb");
	for (i=0; i<byte_count; i++) putc(orig_row[i], fw);
	free(end_col);
	free(beg_col);
	free(orig_row);
	free(na4ali);
	return 0;
}

usg findPlace(byte* otmasuk[], byte curb, usg splo6nyak){
	usg mid = na4ali[curb] + splo6nyak;
	return otmasuk[mid] - end_col;
}