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

int getlen(int n, bound_p p){
	int i=0;
	while (p->value != n) {i++; p=p->next; if (p->next == p) getchar();}
	return i;
}

int mtf(FILE* fr){
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

    bound_p p = bukvar;
    FILE* fw = fopen("output.mtf", "wb");
	int b;
    while ( (b = getc(fr))!=EOF ) {
		byte sb = getlen(b, root);
        putc(sb, fw);
        tofront(sb, &root);
    }
	fclose(fw);
	fclose(fr);
	return 0;
}

int main(char argc, char* argv[]){
    setlocale(LC_CTYPE, "rus");
    if (argc<2) {printf("Missing input file path for MTW encoding, please specify it as first command line argument\n"); return 66;}
    FILE* fr = fopen(argv[1],"rb");
    printf("MTF encoding started\n");
    mtf(fr);
    printf("MTF encoding done\n");
    return 0;
}
