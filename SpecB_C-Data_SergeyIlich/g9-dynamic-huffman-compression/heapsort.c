#include <stdio.h>
#include <stdlib.h>
#include <stdio.h>
#include <limits.h>
#include <sys/ioctl.h>
#include <unistd.h>
#define red   "\033[0;31m"        /* 0 -> normal ;  31 -> red */
#define cyan  "\033[1;36m"        /* 1 -> bold ;  36 -> cyan */
#define green "\033[1;32m"        /* 4 -> underline ;  32 -> green */
#define blue  "\033[9;34m"        /* 9 -> strike ;  34 -> blue */
 
#define black  "\033[0;30m"
#define brown  "\033[0;33m"
#define magenta  "\033[0;35m"
#define gray  "\033[0;37m"
 
#define none   "\033[0m"        /* to flush the previous property */
struct tbuf{
	unsigned char byte;
	char l;
} tbuf;
typedef struct tbuf buf_t;


typedef struct telement *pelement;
struct telement{
	pelement parent;
	pelement left;
	pelement right;
	int value;
	char pravoli;
	int etotchar;
} telement_default = {NULL, NULL, NULL, 0, 0, INT_MAX};


void printtree(pelement viska, pelement cur);
void mkbound(pelement otmasuk[], pelement where, int* len);
int compar(const void * a,const void * b);
void buff_add(buf_t* buf,char bo, FILE* f);  
int getcols();
void heapSort(pelement items[], int array_size);
void heapify(pelement items[], int array_size);
void shiftDown(pelement items[], int shifting, int last);
void somesort(pelement otmasuk[], int len);

int compar(const void* a,const void* b){	
	return (*(pelement*)a)->value - (*(pelement*)b)->value;
}


int getcols(){
	int cols, lines;
#ifdef TIOCGSIZE
    struct ttysize ts;
    ioctl(STDIN_FILENO, TIOCGSIZE, &ts);
    return ts.ts_cols;
#elif defined(TIOCGWINSZ)
    struct winsize ts;
    ioctl(STDIN_FILENO, TIOCGWINSZ, &ts);
    return ts.ws_col;
#endif /* TIOCGSIZE */
}

void buff_add(buf_t* buf,char bo, FILE* f){
	if (bo) buf->byte += 128>>buf->l;
	buf->l++;
	if (buf->l != 8) return;
	else {
		putc(buf->byte, f);
		buf->byte = 0;
		buf->l = 0;
	}
}

void mkbounds(pelement otmasuk[], struct telement skoka[]){
	int len = 256;
	int start_count = 256;
	pelement* p = otmasuk;
	
	pelement where = skoka+start_count;
	pelement w = where;
	where->value = INT_MAX;
	
	for (int i=0; i<start_count-1; i++){
		if (w==where || p[0]->value <= w->value) {
			p[0]->parent = where; where->left = p[0];
			p++;
		} else {
			w->parent = where; where->left = w;
			w++;
		}
		if (w==where || p[0]->value <= w->value) {
			p[0]->parent = where; where->right = p[0];
			p++;
		} else {
			w->parent = where; where->right = w;
			w++;
		}
		where->value = where->left->value + where->right->value;
		where++;
	}
	
	for (int i=0; i<256; i++) otmasuk[i] = skoka+i;
}
/*
void mkbound(pelement otmasuk[], pelement where, int* len){
	otmasuk[0]->parent = where;  where->left = otmasuk[0];
	otmasuk++;
	(*len)--;
	otmasuk[0]->parent = where;  where->right = otmasuk[0];
	where->value = where->left->value + where->right->value;
	otmasuk[0] = where;
	somesort(otmasuk, *len);
}
*/
void printtree(pelement viska, pelement cur){
	printf("%sНаше дерево Хаффмана%s\n", cyan, none);
	int wid = getcols();
	pelement a[256];
	pelement b[256];
	pelement* vivodar=a;
	pelement* subvivodar=b;
	pelement* tmp;
	vivodar[0] = viska;
	for (int q=1; q<=256; q*=2){
		for (int z=0; z<q; z++){
			for (int i=0; i<wid/q/2-2; i++) printf(" ");
			if (vivodar[z] == cur) printf("%s", red);
			printf("%4i", vivodar[z]->value);
			printf("%s", none);
			if (z!=q-1) for (int i=0; i<wid/q/2; i++) printf(" ");
		}
		printf("\n----------------\n");
		for (int i=0; i<q; i++){
			if (i >= 128) break;
			subvivodar[i*2] = vivodar[i]->left;
			subvivodar[i*2+1] = vivodar[i]->right;
		}
		tmp = vivodar;
		vivodar = subvivodar;
		subvivodar = tmp;

	}
	printf("%sГотово%s\n", green, none);
}

void heapSort(/*int*/pelement items[], int array_size)
{

  heapify (items, array_size);

  int i;
  for (i = array_size; i >= 1; i--)  {
    items[0] = items[1];
    items[1] = items[i];
    items[i] = items[0];
    shiftDown(items, 1, i-1);
  }
}


void somesort(pelement otmasuk[],int start_count){
	heapSort(otmasuk-1,start_count+1);
	//qsort(otmasuk, start_count, sizeof(pelement), compar);
}

void heapify(/*int*/pelement items[], int array_size) {
    int i;
    for (i = (array_size/2); i >= 1; i--) {
        shiftDown(items, i, array_size);
    }
}


void shiftDown(/*int*/pelement items[], int shifting, int last)
{
    unsigned int maxChild = 2*shifting;
    items[0] = items[shifting];
    while (maxChild <= last)  {
        if ( (maxChild < last) && (items[maxChild+1]->value > items[maxChild]->value) )  {
            maxChild++;
        }

        if (items[0]->value < items[maxChild]->value)  {
            items[shifting] = items[maxChild];
            shifting = maxChild;
            maxChild <<= 1;
        }
        else  {
            break;
        }
    }
    items[shifting] = items[0];
}

