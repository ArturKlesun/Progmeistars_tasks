#include "unit.c"
#include <stdio.h>

int main(){
	char s[] = "Privet! Ja - dusha Vasi Pupkina, zastrjavshaja na 4-om zanjatii kursa C/Data, potomu chto ne smog napisatj funkciju, kotoraja pechataet stroku v stolbik";
	printvert(s);
	int i;
	i = GREATCHARS(s);
	printf("\n%s\n%i букв были заглавлены\n", s, i);
	char ints[] = "2654";
	printf("\n%i\n\n", strtoint(ints));
	char *s1 = "AAAA";
	char *s2 = "bbbb";
	int rez = comparestring(s1,s2);
	char c;
	switch (rez){
	case 0: c = '='; break;
	case -1: c = '<'; break;
	case 1: c = '>'; break;
	}
	printf("%s %c %s\n", s1, c, s2);
	rez = comparestring(s1,s1);
	switch (rez){
	case 0: c = '='; break;
	case -1: c = '<'; break;
	case 1: c = '>'; break;
	}
	printf("%s %c %s\n", s1, c, s1);
	return 0;
}
