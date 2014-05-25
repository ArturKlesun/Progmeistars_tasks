#include "heapsort.c"

int progress;

int main(char argc, char* argv[]){
	progress = 0;
	if (argc<2) {printf("Вы не правы!\n"); return(66);}
	int start_count = 256;	
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
	FILE* fr = fopen(argv[1], "rb");
	FILE* fw = fopen("compressed.klsn", "wb");
	int b = 0;

	pelement* p;
	for (int iter=1; b!=EOF; iter++){
		b = getc(fr);
		if (b == EOF) break;
		
		skoka[b].value++;
		sp = skoka+b;
		sp->pravoli = 2;
		
		while (sp != viska) {
			if (sp->parent->left == sp) sp->parent->pravoli = 0;
			else sp->parent->pravoli = 1;
			sp = sp->parent;
		}

		while (sp->pravoli != 2)			
			if (sp->pravoli) {
				buff_add(&buf,1, fw);  
				sp = sp->right;
			} else {
				buff_add(&buf,0, fw); 
				sp = sp->left;
			}
		if (iter % 1000) continue;
		
		progress+=1000;
		if (progress % 1000000 == 0) {system("clear"); printf("%i мегабайт готово\n", progress/1000000);}
		somesort(otmasuk,start_count);
		//отсортить отмасуки...
		mkbounds(otmasuk, skoka);
		//Обновить древо Хаффмана по отмасукам
	}
	while (buf.l) buff_add(&buf, 0, fw);
	fclose(fr);	
	fclose(fw);	
	printf("Сжатие завершено\n");
	
	free(origin[start_count+1]); // Освобождаем память из под заглушки
	free(origin);
	free(skoka);
	return 0;
}
