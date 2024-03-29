.data
    userInput: .space 11
.text
    main:
    #Lets users input a 10 character string
      li $v0, 8
      la $a0, userInput
      li $a1, 11
      syscall 
    
    start:
    #Loads the address of inputted string into register $t1, puts first bit (character) of string in $s0
      la $t1, userInput
      add $t1, $t1, $t0
      lb $s0, ($t1)
      beq $t0, 10, exit #checks if it is 10th character

      ble $s0, 57, integers #function for the numbers 0-9  integers
      bge $s0, 97, lowerASCI #function for asci values a-y   lowerASCI
      bge $s0, 65, UpperASCI #function for asci values A-Y   UpperASCI
      j exit
    
      addi $t0,$t0, 1
      j start
    
    
    integers:
      addi $t0, $t0, 1 #adds one to the incrementer 
      ble $s0, 47, start #if its less than or equal to 47 it is not in the range of what numbers we want, starts loop for next character
      sub $s7, $s0, 48 #subtracts 48 from the asci value to represent the decimal  number and store it in $s7
      add $s6, $s6, $s7 #add the decimal number from $s7 to $s6 where i add the numbers
      j start
        
    
    lowerASCI:
      addi $t0, $t0, 1 #incrementer
      bge $s0, 122, start #if it is greater than or equal to 122 that would represent 'z' and my program is only supposed to go to 'y'
      sub $s4, $s0, 87 #subtracts 87 from asci value to represent the corresponding decimal in the program instructions
      add $s6, $s6, $s4 #adds the decimal number to $s6 where sum is being calculated
       j start
    
    UpperASCI:
      addi $t0, $t0, 1 #incrementer
      bge $s0, 90, start #if it is greater than 90 that would represent 'Z' and 'Y'
      sub $s5, $s0, 55  #subtracts 55 from asci value to represent corresponding decimal in the program instructions
      add $s6, $s6, $s5 #adds the decimal number to $s6
      j start
      
     
    exit:
      li $v0, 1
      la $a0, ($s6) #loads sum into a0 and prints it out
      syscall
      li $v0, 10 
      syscall

  
  

