// Привет.
// Эта программа реаллизует работу с множествами чисел в пределе [o..31]

#include <stdio.h>
#include "b3_set_unit.c"

void printset(unsigned s){
   int i=0;
   printf("множество: [ ");
   for (; i<32; i++){
     if (1<<i & s) printf("%i ", i);
   }
   printf("]\n");
}

int main(){
  int bo;
  char c, trash;
  int rez;
  unsigned s1 = 0;
  unsigned s2 = 0;
  printf("Здравствуйте. Сейчас я продемонстрирую вам работу множеств!\n");
  printf("Пожалуйста, введите первое множество: (числа от 0 до 31, по окончании введите -1)\n");
  do{
    scanf("%i", &rez);
    c = rez;
    scanf("%c", &trash);
    if ((c>=0) && (c<32)) include(&s1, c); else break;
  }while (1);
  printf("Пожалуйста, введите второе множество:\n");
  do{
    scanf("%i", &rez);
    c = rez;
    scanf("%c", &trash);
    if ((c>=0) && (c<32)) include(&s2, c); else break;
  }while (1); 
  do{
     printf("%i, 1-oe ", s1);
     printset(s1);
     printf("%i, 2-oe ", s2);
     printset(s2);
 
     printf("Можете выбрать, какую операцию произвести над множествами: (введите цифру)\n");
     printf("1. Включить\n");
     printf("2. Иcключить\n");
     printf("3. Вычитание s2 из s1\n");
     printf("4. Пересечение\n");
     printf("5. Сумма\n");
     printf("6. Разность\n");
     printf("7. Присутствует ли во множестве чиcло?\n");
     
     scanf("%c", &c);
     scanf("%c", &trash);
     
     printf("\n");
     switch(c){
     case '1':
        printf("В первое множество? (1/0)\n");
        scanf("%i",&bo);
        scanf("%c",&trash);
	printf("Введите чиcло, пожалуйста:\n"); 
        scanf("%i", &rez); c = rez;
        scanf("%c", &trash);
        if (bo) include(&s1,c); else include(&s2,c);
        c = '1';
        break;
     case '2':
        printf("Из первого множества? (1/0)\n");
        scanf("%i",&bo);
        scanf("%c",&trash);
        printf("Введите чиcло, пожалуйста:\n"); 
        scanf("%i", &rez); c = rez;
        scanf("%c", &trash);
        if (bo) exclude(&s1,c); else exclude(&s2,c);
        c = '2';
        break;
     case '3':
        printset(substr(s1,s2));
        break;
     case '4':
        printset(intersection(s1,s2));
        break;
     case '5':
        printset(getunion(s1,s2));
        break;
     case '6':
        printset(difference(s1,s2));
        break;
     case '7':
        printf("В первом множестве? (1/0)\n");
        scanf("%i",&bo);
        scanf("%c",&trash);
        printf("Введите чиcло, пожалуйста:\n"); 
        scanf("%i", &rez); c = rez;
        scanf("%c", &trash);
        if (bo)
	  if (in(c,s1)) printf("Да\n"); else printf("Нет\n");
	else
          if (in(c,s2)) printf("Да\n"); else printf("Нет\n");
        c = '7';
        break;    
     }
     printf("\n");
     getchar();
     
     
  }while ((c>'0') && (c<'8'));
  
  return 0;
}

