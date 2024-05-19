#include <stdio.h>
/*
 * Using the Horner's method to covert hex value to decimal value
 *
 *    https://en.wikipedia.org/wiki/Horner%27s_method
 *
 *  Written by Gang-Ryung
 */

char hexstring[12] = {0};

int hextodec(char *s) {
   char t;
   int total = 0;
   for (t = *s; t; s++,t = *s) {
      int digit;
      if (t >= 'a')
         digit = t - 'a' + 10;
      else
         digit = t - '0';
      total = total*16 + digit;
   }
   return total;
}

int hextodec2(char *s) {
   char t;
   int digit;
   int total = 0;
   t = *s;
Loop:
   if (t=='\0')
      goto exit;
   if (t >= 'a')
      digit = t - 'a' + 10;
   else
      digit = t - '0';
   total = total*16 + digit;
   s++;
   t = *s;
   goto Loop;

exit:
   return total;

}

int main(void) {
   char *s, t;

   /* prompt the user to enter the hexadecimal value */
   printf("Enter a hexadecimal value.\n");
   fgets(hexstring,12,stdin);
   printf("You entered hexstring %s\n", hexstring);

#ifdef PROCEDURAL_ABSTRACTION
   int value = 0, value2=0;
   value = hextodec(hexstring);
   value2 = hextodec2(hexstring);
   printf("The decimal value for this hexstring is %d,%d\n", value, value2);
#elif FORLOOP
   int total = 0;
   for (t = *s; t; s++,t = *s) {
      int digit;
      if (t >= 'a')
         digit = t - 'a' + 10;
      else
         digit = t - '0';
      total = total*16 + digit;
   }
#else
   int digit;
   int total = 0;
   s = hexstring;
   t = *s;
Loop:
   if (t=='\n')
      goto exit;
   if (t >= 'a')
      digit = t - 'a' + 10;
   else
      digit = t - '0';
   total = total*16 + digit;
   s++;
   t = *s;
   goto Loop;
#endif
exit:
   printf("The decimal value for this hexstring is %d\n", total);
   return 0;
}
