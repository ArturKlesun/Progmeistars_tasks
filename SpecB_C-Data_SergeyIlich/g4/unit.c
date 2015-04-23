#include <stdio.h>
#include <string.h>
#include <sys/ioctl.h>
#include <unistd.h>

void printvert(char *s){
	struct winsize w;
    ioctl(STDOUT_FILENO, TIOCGWINSZ, &w);
    
	int l = strlen(s);
	int screenheight;
	screenheight = l/w.ws_col*6;
	for (int x = 0; (x<screenheight); x++){
		for (int i = 0; i<l; i+=screenheight){
			printf("%c  ", *(s+i+x));
		}
		printf("\n");
	}
	printf("\n");
	return;
}
int GREATCHARS(char *s){
	int i = 0;
	while (*s) {
		if (*s >= 97 && *s <= 122){
			 *s -= 32;
			 i++;
		}
		s++;
	}
	return i;
}
int pow(int n,char i){
	if (i) return n*pow(n,--i); 
	else return 1;
}
int strtoint(char *s){
	char i = strlen(s)-1;
	int rez = 0;
	while( *s ){
		rez += (*s - 48) * pow(10, i--); 
		s++;
	}
	return rez;	
}
char toup(char n){
	if ((n >= 97) && (n <= 122)){
		n -= 32;
	}
	return n;
}
int comparestring(char *a, char *b){
	while (1){
		if ( toup(*a) > toup(*b) ) return 1;
		else if ( toup(*a) < toup(*b) ) return -1;
		if (*a == 0) return 0;
		a++; b++;
	}
}
