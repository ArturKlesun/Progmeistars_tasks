// Эта программа создаёт хэш-сумму файла!
#include <stdio.h>
#include <stdlib.h>
#include "b2_unit.c"

int main(){
   printf("Привет! Я - программа, которая считает хэш файла и проверяет его.\n");
   printf("Пожалуйста, введите название файла, с которым мне работать (по умолчанию - 'asd.dat').\n");
   char nazvaniye[50];
   scanf("%s", nazvaniye);
   getchar();
   if (nazvaniye == "") *(&nazvaniye[0]) = "asd.dat";
   char bo;
   printf("Желаете создать хеш-сумму файла %s? (y/n)\n", nazvaniye);
   scanf("%c", &bo);
   switch (bo){
   case 'y' : 
      bo = bo;
      unsigned sub = getchecksum(nazvaniye);
      FILE *fw = fopen("checksum.dat", "wb");
      int i=0;
      for (; i<2; i++){
         putc(sub & 255, fw); 
         sub >>= 8;
      }
      fclose(fw);
      break;
   case 'n' : break;
   }
   printf("Желаете проверить хеш-сумму файла %s? (y/n)\n", nazvaniye);
   scanf("%c", &bo);
   scanf("%c", &bo);
   switch (bo){
   case 'y' : 
      printf("От вас получили багаж: Диван, Чемодан, Саквояж, Картину, Корзину, Картонку И маленькую собачонку.\n");
      unsigned truesum = getchecksum(nazvaniye);
      unsigned gotsum;
      FILE *fr = fopen("checksum.dat", "rb");
      gotsum = getc(fr);
      gotsum += getc(fr) << 8;
      fclose(fr);
      if (gotsum == truesum) printf("Байты доставленны без потерь\n"); else printf("Однако за время пути. Собака могла подрасти.\n");
      break;
   case 'n' : break;
   }
   return 0;
}


