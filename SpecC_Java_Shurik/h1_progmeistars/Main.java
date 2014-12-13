
public class Main {
    public static int lvl;
    private static int klesort(int[] ar, int start, int len){
    	lvl++;
        //System.out.printf("Йоу! start-%d len-%d\n", start, len);
        if (len < 2) {lvl--; return 0;}
        int len1,len2;
        len1 = (int)(  Math.ceil( (float)len/2 ));
        len2 = (int)( Math.floor( (float)len/2 ));
        //for (int i=0; i<lvl; i++) System.out.print(" ");
        //System.out.printf("Ща отправлю в полёт: %d_%d %d_%d\n", start, len1, start+len1, len2);
        klesort(ar, start, len1);
        klesort(ar, start+len1, len2);
        // 1 3 5 9    4 7 9
        int[] subaru = new int[len1+len2];
        int p1 = start, p2 = start+len1;
	int p20 = p2;/*
        System.out.printf("Так инфа: len1=%d, len2=%d, p1=%d, p2=%d, start=%d, len=%d\n", len1, len2, p1, p2, start, len);
        System.out.printf("Было:");
        for (int i=start; i<start+len; i++) System.out.printf(" %d", ar[i]);
        System.out.println();*/
	for (int i=0; i<len; i++) {
            if ( (p2 == start + len) || (ar[p1] < ar[p2]) && (p1<p20) ) {
                subaru[i] = ar[p1];
                p1++;
            } else {        // [p2] < [p1]
                subaru[i] = ar[p2];
                p2++;
            }
        }		
        for (int i=0; i<len; i++) { // Да, это плохо и медленно, и я об этом знаю!
                ar[start+i] = subaru[i];
        }
        /*System.out.printf("Стало:");
        for (int i=start; i<start+len; i++) System.out.printf(" %d", ar[i]);
        System.out.println();*/
        lvl--;
        return 0;
    }

    public static void main(String[] args) {
        System.out.print("Добро пожаловать в мою программу!\n");
        int len = 17;
        int[] otmasuk = new int[len];
        for (int i = 0; i<len; i++){
            otmasuk[i] = (int)(Math.random()*256);
            System.out.printf("%d ", otmasuk[i]);
        }
        System.out.println();
        lvl=0;
        klesort(otmasuk, 0, len);
        for (int i = 0; i<len; i++){
            System.out.printf("%d ", otmasuk[i]);
        }
    }

}
