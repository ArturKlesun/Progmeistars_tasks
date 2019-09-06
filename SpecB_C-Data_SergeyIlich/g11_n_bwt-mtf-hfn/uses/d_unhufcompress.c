#include "heapsort.c"

int start_count;
int progress;

void recalc_weights(pelement *otmasuk, struct telement *weights){
		progress+=1000;
		if (progress % 1000000 == 0) {system("clear"); printf("%i мегабайт готово\n", progress/1000000);}
		somesort(otmasuk,start_count);
		//отсортить отмасуки...
		mkbounds(otmasuk, weights);
		//Обновить древо Хаффмана по отмасукам
}

int main(){	
	progress = 0;
	start_count = 256;
	struct telement *weights = malloc(sizeof(struct telement) * (start_count*2-1));
	for (int i = 0; i < start_count*2-1; i++) weights[i] = telement_default;
// Отсортированный массив указателей
	pelement* otmasuk = malloc(sizeof(pelement) * (start_count+2));
	pelement* origin = otmasuk;
	otmasuk++;
// Заглушка
	otmasuk[start_count] = malloc(sizeof(struct telement));
	otmasuk[start_count]->value = INT_MAX;
	for (int i=0; i<start_count; i++) {
		weights[i].right = NULL;
		weights[i].left = NULL;
		weights[i].value = 0;
		otmasuk[i] = weights+i;
	}
	
	pelement pp;
	int y = 0;

	pp = weights + start_count*2-1;
	do {
		y++;
		(pp-y)->left = pp-y*2-1;		(pp-y)->left->parent = pp-y;
		(pp-y)->right = pp-(y*2);		(pp-y)->right->parent = pp-y;
	} while (y < 255);
	weights[start_count*2-2].parent = NULL;
	// Делаем липовое дерево
	pelement sp;
	int sb;
	for (int c=0; c<256; c++){
		sp = weights + start_count*2-2;
		sb = c;
		for (int i = 1; i<=7; i++) {
			if (sb & 128) sp = sp->right;
			else sp = sp->left;
			sb <<= 1;
		}
		if (sb) {sp->right = weights+c; sp->right->parent = sp; sp->right->character=(int)c;}
		else {sp->left = weights+c; sp->left->parent = sp; sp->left->character=(int)c;}
	}

	pelement last_weight = weights + start_count*2-2;
	FILE* fr = fopen("compressed.klsn", "rb");
	FILE* fw = fopen("uncompressed.dat", "wb");
	int b = 0;

	pelement p = last_weight;
	int iter = 0;
	while (b!=EOF){
		b = getc(fr);
		if (b == EOF) break;
		
		for (int bc=0; bc<8; bc++){
			if (b & 128) p = p->right;
			else p = p->left;
			if (p->right == p->left/*==NULL*/) {
					putc(p->character, fw);
					weights[p->character].value++;
					iter++;
					p = last_weight;
					if (iter % 1000 == 0) recalc_weights(otmasuk, weights);
				}
			b<<=1;
		}
	}
	fclose(fr);	
	fclose(fw);	
	printf("Разжатие завершено\n");
	
	free(origin[start_count+1]); // Освобождаем память из под заглушки
	free(origin);
	free(weights);
	return 0;
}
