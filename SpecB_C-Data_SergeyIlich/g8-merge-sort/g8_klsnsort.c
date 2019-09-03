#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
const int AR_SIZE = 1000000;

int globvar = 0;
int* aror;

int compar(const void* a, const void* b){
    globvar++;
    int rez = *(int*)a - *(int*)b;
	return rez;
}

void swap(int* i1, int* i2){
    int tmp;
    tmp = *i1;
    *i1 = *i2;
    *i2 = tmp;
}

int ceildiv(int x, int y){
	if (x % y) {
		return x/y+1;
	} else return x/y;
}

void mergesort(int* ar, int len){
    if (len < 2) return;
    int* ar1=ar;
    int* ar2=ar+ len/2;
    int* ar2or = ar2;
    
    mergesort(ar1, len/2);
    mergesort(ar2, ceildiv(len,2));
	if (*ar2 > *(ar2-1)) return;  // ля, ля-ля...

    int* arsub = malloc(len*sizeof(int));
    int* p = arsub;
    char broken = 0;   
    for (int i=1; i<len; i++, p++){
        if (compar(ar1,ar2)>0 && ar2-ar2or<ceildiv(len,2)) {
            *p = *ar2; 
            ar2++;
        } else {
            *p = *ar1;  
            ar1++;
            
            if (ar1 == ar2or) {
				len = i;
				broken = 1;
				break;
			}
        }
    }
    if (!broken) *p =  ar1 == ar2or ?  *ar2 : *ar1;
    memcpy(ar, arsub, len*sizeof(int));
    free(arsub);
}

int main(){
    int ar[AR_SIZE];
    int ar2[AR_SIZE];
    for (int i = 0; i<AR_SIZE; i++){
        ar[i] = rand() % 1000;
    }
    memcpy(ar2, ar, sizeof(int)*AR_SIZE);
    // Предлагаю подойти к делу с Рекурсией!
    qsort(ar, AR_SIZE, sizeof(int), compar);
    printf("%i - qsort\n", globvar);
    globvar = 0;
	aror = ar2;
    mergesort(ar2, AR_SIZE);
    printf("%i - klsnsort\n", globvar);
	return 0;
}
