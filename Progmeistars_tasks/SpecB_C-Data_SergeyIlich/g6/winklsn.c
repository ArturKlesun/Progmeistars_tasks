#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int unklsn(FILE*  slovarj, FILE* szatij, char* vivod){
	char sklad[256];
	char *strar[255];
	unsigned char l; 
	fgets(sklad, sizeof(sklad), slovarj);
	for (int i=0; sklad != NULL && i < 255; i++, fgets(sklad, sizeof(sklad), slovarj)){
		l = strlen(sklad);
		strar[i] = malloc(sizeof(char)*l+1);
		memcpy(strar[i], sklad, l+1);
	}
	fclose(slovarj);
	
	FILE* rez;
	rez = fopen(vivod, "wb");
	char u = 0;
	char* ss;
	unsigned char ku4a=0;
	for (unsigned char c = getc(szatij); c != 255; c = getc(szatij)){
		ss = strar[c];
		//printf("%i, %s", c, ss);
		for (int i=0; i<strlen(ss)-1; i++){
			if (ss[i] =='1') ku4a += 128>>u;
			if (u % 8 == 7) {
				putc((char)(ku4a & 255), rez);
				ku4a=0;
				u=-1;
			}
			//printf("i=%i, u=%i, ss[i]=%c, ku4a+%i=%i\n", i, u, ss[i], ss[i]=='1' ? 128>>u : 0, ku4a);
			u++;
		}
	}	
	if (u) putc((char)(ku4a & 255), rez);
	fclose(rez);
	fclose(szatij);
	return u;
}
