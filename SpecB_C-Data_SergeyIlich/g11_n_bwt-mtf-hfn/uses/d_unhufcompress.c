#include "heapsort.c"

int start_count;
int progress;

void peres4itatj(pelement otmasuk[], struct telement skoka[]){
		progress+=1000;
		if (progress % 1000000 == 0) {system("clear"); printf("%i мегабайт готово\n", progress/1000000);}
		somesort(otmasuk,start_count);
		//отсортить отмасуки...
		mkbounds(otmasuk, skoka);
		//Обновить древо Хаффмана по отмасукам
}

int main(){	
	progress = 0;
	start_count = 256;
	struct telement *skoka = malloc(sizeof(struct telement) * (start_count*2-1));
	for (int i = 0; i < start_count*2-1; i++) skoka[i] = telement_default;
// Отсортированный массив указателей
	pelement* otmasuk = malloc(sizeof(pelement) * (start_count+2));
	pelement* origin = otmasuk;
	otmasuk++;
// Заглушка
	otmasuk[start_count] = malloc(sizeof(struct telement));
	otmasuk[start_count]->value = INT_MAX;
	for (int i=0; i<start_count; i++) {
		skoka[i].right = NULL;
		skoka[i].left = NULL;
		skoka[i].value = 0;
		otmasuk[i] = skoka+i;
	}
	
	pelement pp;
	int y = 0;

	pp = skoka + start_count*2-1;
	do {
		y++;
		(pp-y)->left = pp-y*2-1;		(pp-y)->left->parent = pp-y;
		(pp-y)->right = pp-(y*2);		(pp-y)->right->parent = pp-y;
	} while (y < 255);
	skoka[start_count*2-2].parent = NULL;
	// Делаем липовое дерево
	pelement sp;
	int sb;
	for (int c=0; c<256; c++){
		sp = skoka + start_count*2-2;
		sb = c;
		for (int i = 1; i<=7; i++) {
			if (sb & 128) sp = sp->right;
			else sp = sp->left;
			sb <<= 1;
		}
		if (sb) {sp->right = skoka+c; sp->right->parent = sp; sp->right->etotchar=(int)c;}
		else {sp->left = skoka+c; sp->left->parent = sp; sp->left->etotchar=(int)c;}
	}

	buf_t buf = {0,0};
	pelement viska = skoka + start_count*2-2;
	FILE* fr = fopen("compressed.klsn", "rb");
	FILE* fw = fopen("uncompressed.dat", "wb");
	int b = 0;

	pelement p = viska;
	int iter = 0;
	while (b!=EOF){
		b = getc(fr);
		if (b == EOF) break;
		
		for (int bc=0; bc<8; bc++){
			if (b & 128) p = p->right;
			else p = p->left;
			if (p->right == p->left/*==NULL*/) {
					putc(p->etotchar, fw);
					skoka[p->etotchar].value++;
					iter++;
					p = viska;
					if (iter % 1000 == 0) peres4itatj(otmasuk, skoka);
				}
			b<<=1;
		}
	}
	fclose(fr);	
	fclose(fw);	
	printf("Разжатие завершено\n");
	
	free(origin[start_count+1]); // Освобождаем память из под заглушки
	free(origin);
	free(skoka);
	return 0;
}
