#include <stdint.h>

int32_t getByaku(unsigned char b,int32_t key);
int32_t *hash_table_renew(int32_t key, int32_t arr[]);
int32_t make_hash(FILE *fr, int32_t key);

void printbi(unsigned n){
	for (unsigned i = 1<<31; i; i>>=1) if (n & i) printf("1"); else printf("0");
}

int32_t getByaku(unsigned char pb,int32_t key){
	int32_t byaka = 0;
	int32_t sub;
	int32_t b = pb;
	b<<=24;
	int i=1<<31;
	unsigned mask = 127<<25;
	for (char c=7; c>=0; c--){
		/*if (pb == 234) {
			printf("11101010");
			printf("\n");
			for (int y=0; y<8; y++) printf(" ");
			printbi(byaka);
			printf("\n");
			for (int y=0; y<8-c; y++) printf(" ");
			printbi(key);
			printf("\n");
			//printf("\n%#010x %#010x\n", b, byaka);
			//for (int y=0; y<7-c; y++) printf(" ");
		}*/
		if (i & b) {
			sub = (b<<=1) + (byaka>>c);
			sub ^= key;
			byaka = sub<<(c); 
			b = sub & mask; 
		} else b<<=1;
		mask<<=1;
	}
	return byaka;
}
int32_t *hash_table_renew(int32_t key, int32_t arr[]){
	for (int i=0; i<256; i++){
		arr[i]=getByaku(i, key);
		//printf("%i %#010x ", i, arr[i]);
	}
	return arr;
}
//4
int32_t make_hash(FILE *fr, int32_t key){
	
	unsigned char fst = getc(fr);
	int32_t rez=0;
	
	for (int i=0; i<4; i++){
		char sb = getc(fr);
		if (sb == EOF) exit(666);
		rez += sb<<(24-i*8); 
	}
	
	int32_t ht[256];
	hash_table_renew(key, ht);
	for (char b = getc(fr); b!=EOF; b = getc(fr)){
		rez ^= ht[fst];
		fst = rez>>24;
		rez<<=8;
		rez+=b;
		//printf("\nb=%c\nfst=%i\nrez  =  %#010x\nht[%3u]=%#010x\n\n", b, fst, rez, fst, ht[fst]);
	}

	for (char i = 0; i<5; i++){
		rez ^= ht[fst];
		fst = rez>>24;
		if (i!=4) rez<<=8;
	}
	
	return rez;
	
}
