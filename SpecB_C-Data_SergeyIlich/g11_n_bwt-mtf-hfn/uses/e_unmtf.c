#include <stdio.h>
#include <stdlib.h>
#include <locale.h>

typedef unsigned char byte;

typedef struct bound_t* bound_p;
struct bound_t {
    bound_p next;
    bound_p prev;
    byte value;
};

void tofront(int b, bound_p* rroot){
    bound_p root = *rroot;
    if (!b) return;
    bound_p ptrx = root;
    while (b) {
        ptrx = ptrx->next;
        b--;
    }
    if (!(ptrx->next == root)) {
		bound_p l0 = root->prev;
		bound_p r0 = root->next;
		bound_p l1 = ptrx->prev;
		bound_p r1 = ptrx->next;
				
		l1->next = r1;
		r1->prev = l1;
		l0->next = ptrx;
		ptrx->prev = l0;
		ptrx->next = root;
		root->prev = ptrx;
	}
    *rroot = ptrx;
}

bound_p getnthelement(int n, bound_p p){
	while (n) {p=p->next; n--;}
	return p;
}


int unmtf(FILE* fr){
	int i;

	struct bound_t bukvar[256];
	for (i=0; i<256; i++) {
        bukvar[i].prev = &bukvar[i-1];
        bukvar[i].next = &bukvar[i+1];
        bukvar[i].value = i;
	}
	bukvar[0].prev = &bukvar[255];
	bukvar[255].next = &bukvar[0];
	bound_p root = bukvar;

    FILE* fw = fopen("unmtfout.dat", "wb");
	int b;
    while ( (b = getc(fr))!=EOF ) {
        putc(getnthelement(b, root)->value, fw);
        tofront(b, &root);
    }
	fclose(fw);
	fclose(fr);
	return 0;
}

int main(char argc, char* argv[]){
    if (argc<2) {printf("Missing input file path for MTW decoding, please specify it as first command line argument\n"); return 66;}
    setlocale(LC_CTYPE, "rus");
    FILE* fr = fopen(argv[1],"rb");
    unmtf(fr);
    printf("MTF decoding completed\n");
    return 0;
}
