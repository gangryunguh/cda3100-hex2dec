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

   # convert hexstring into a decimal value using Horner's polynormial evalaution algorithm
   # initialize the registers
   li   $t1,0           # total = 0
   la   $t2,hexstring
   lb   $t3,0($t2)      # t = *s
Loop:
   li   $t4,'\n'
   beq  $t3,$t4,exit

   li   $t4,'a'
   slt  $t5,$t3,$t4    # if (t < 'a') $t5 = 1 else $t5 = 0
   beq  $t5,$zero,L1
   li   $t4,'a'
   sub  $t5,$t3,$t4    # digit = t - 'a'
   addi $t5,$t5,10     # digit = digit+10
   b    L1
   li   $t4,'0'
   sub  $t5,$t3,$t4    # digit = t - '0'
L1:
   sll $t1,$t1,4       # total = total * 16
   add $t1,$t1,$t5     # total = total + digit

   #increment the next char address of the hexstring
   addi $t2,$t2,1      # s++
   lb   $t3,0($t2)
   b    Loop
exit:
   # print the decimal value
   li   $v0,4
   la   $a0,msg3
   syscall
   li   $v0,1
   move $a0,$t1
   syscall

   jr   $ra