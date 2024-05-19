   .data
msg1:      .asciiz    "Enter a hexadecimal value.\n"
msg2:      .asciiz    "You entered hexstring "
msg3:      .asciiz    "The decimal value for this hexstring is "
newline:   .asciiz    "\n"

   .text
   .globl main
main:
   # prompt the user to enter the hexadecimal value
   li   $v0,4
   la   $a0,msg1
   syscall
   jr   $ra
