// В этой библиотеке хранятся функции для:
//  Переворачивания битов переменной шиворот навыворот
//  Нахождения самой длинной последовательности ноликов в числе
//  Нахождения самой длинной последовательности единичек в числе
unsigned max(unsigned arg1, unsigned arg2){
	if (arg1 > arg2) return arg1; else return arg2;
}

void printbi(unsigned n){
  unsigned sub = n;
  int i=0;
  for (; i<32; i++){
        if (n & 1<<31)
       printf("1");
    else
       printf("0");
    n <<= 1;
    if ((i+1) % 8 == 0) printf(" ");
  }
  printf("=%d",sub);
  printf("\n");
}

unsigned reverse(unsigned b){
	unsigned sub = 0;
	char i=31;
	while (b){
		sub += (b & 1)<<i;
		i--;
		b >>= 1;
	}
	return sub;
}

char longest1(unsigned b){
	unsigned sub = 0;
	unsigned rez = 0;
	while (b){
		if (b & 1) sub++;
		else {
			rez = max(rez,sub);
			sub = 0;
		}
		b >>= 1;
	}
	return rez;
}

char longest0(unsigned b){
	unsigned sub = 0;
	unsigned rez = 0;
	while (b){
		if (~b & 1) sub++;
		else {
			rez = max(rez,sub);
			sub = 0;
		}
		b >>= 1;
	}
	return rez;
}
