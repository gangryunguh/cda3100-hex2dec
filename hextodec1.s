   .data
hexstring: .space     12
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

   # read the hexadecimal value as a string
   li   $v0,8
   la   $a0,hexstring
   li   $a1,10
   syscall

   # print the input hexstring
   li   $v0,4
   la   $a0,msg2
   syscall
   la   $a0,hexstring
   syscall
   la   $a0,newline
   syscall

   jr   $ra