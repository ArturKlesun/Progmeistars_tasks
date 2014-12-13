#include "drevomassiva.c"
#include "math.h"

void printtree(pelement p, int n){
	for (int i=7; i>n; i--) {printf("      ");}
	printf(" %i_%i \n", p->value, n);
	
	if (p->left == NULL) return;
	printtree(p->left, n+1);
	printtree(p->right, n+1);
}

int main(){
	pelement p = create(10);
	printf("\n");
	printtree(p, 0);
	return 0;
}
