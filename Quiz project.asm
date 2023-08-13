
 Information macro Rx,Tx
   
   mov al,Rx
   mov bl,Tx
   
   cmp al,bl 
   call  Stop_string                 
   
 endm
 
 Check_Answer macro Rj,Rz
    
    mov al,Rj
    mov bl,Rz
   
    cmp al,bl 
    call  Result_of_Quiz                 
   
 endm 
  
   
 Print_R macro T
   
   mov al,T
   
   lea dx,T 
   mov ah,9 
   int 21H

 endm
     
     
 Print_R1 macro S     
    
    mov al,S
     
    mov ah,2
    mov dl,al
    add dl,30H
    int 21H 
    
 endm
  
  
.MODEL SMALL
.STACK 100H
.DATA
 
 RE_Name DB 25 DUP (?)
 RC_Phone DB 25 DUP (?)
 
 Op1 db ? 
 Op2 db ?
 Op3 db ?
 Op4 db ?
 Score db ?
 R db ?

     R1 DB "            Welcome to Quiz Competition ! $"
     R2 DB 0AH,0DH," Please, put on your answer: $" 
     R3 DB 0AH,0DH,"                  End your test ! $" 
     R4 DB 0AH,0DH,"   From this Quiz Competition, you have gained: $"
     R5 DB 0AH,0DH,"           ___&___ Congratulations ___&___ $" 
     
     RE DB 0AH,0DH,"            Real name: $"
     RC DB 0AH,0DH,"           Contact number: $"
     RN DB 0AH,0DH,"$"
     RZ DB 0AH,0DH,"        _____________________________________$"
     RA DB 0AH,0DH,"  The Correct answer is: $" 
     
     Q1 DB 0AH,0DH,"Question - 1 : Who is Md.Romzan Alom ?$"
     Q2 DB 0AH,0DH,"Question - 2 : How many friends does Romzan have ?$"
     Q3 DB 0AH,0DH,"Question - 3 : What is the currency of Bangladesh ?$"
     Q4 DB 0AH,0DH,"Question - 4 : What does 'Bangladesh' mean ?$"
     Q5 DB 0AH,0DH,"Question - 5 : X = 8 and X + Y = 9 and Z = X - Y then X = ?$" 
     Q6 DB 0AH,0DH,"Question - 6 : What is Rusmita Halim Chaity's nickname ?$"
     Q7 DB 0AH,0DH,"Question - 7 : What does 'Romzan' mean ?$"
     Q8 DB 0AH,0DH,"Question - 8 : What is the relationship Romzan Tanjim and Bristy ?$"
     Q9 DB 0AH,0DH,"Question - 9 : What does 'Bristy' mean ?$"
     Q10 DB 0AH,0DH,"Question - 10 : How many marks do the teacher of GUB give to the students ?$"
     Q11 DB 0AH,0DH,"Question - 11 : Who is the best captain in Bangladesh ?$"
     Q12 DB 0AH,0DH,"Question - 12 : How many campus does GUB have ?$"
     Q13 DB 0AH,0DH,"Question - 13 : 4 + 6 / 2 - 1  = What ?$" 
     Q14 DB 0AH,0DH,"Question - 14 : What does 'Tanjim' mean ?$"
     Q15 DB 0AH,0DH,"Question - 15 : Who loves you forever ?$"
     
     Option_1 DB 0AH,0DH,"  1. A king  2. A player    3. A ordinary man    4. A prince $"
     Option_2 DB 0AH,0DH,"  1. No friend  2. Only one friend   3. Too many friends   4. Some friends $"
     Option_3 DB 0AH,0DH,"  1. Taka  2. TK    3. Dollar    4. BD  $"
     Option_4 DB 0AH,0DH,"  1. Bangali  2. Land of the Bengali's    3. Smallest Country   4. Big Country $"
     Option_5 DB 0AH,0DH,"  1. Sixteen  2. Seven    3. One    4. Eight $"
     Option_6 DB 0AH,0DH,"  1. Rusmita   2. Halim    3. Chaity    4. Mam $"
     Option_7 DB 0AH,0DH,"  1. A month  2. Burning    3. Love    4. Hungry $"
     Option_8 DB 0AH,0DH,"  1. Brothers-Sister  2. Only friend   3. Bad friend    4. Good friend $"
     Option_9 DB 0AH,0DH,"  1. Papa ka pori  2. Queen    3. Nagin    4. Rain $"
     Option_10 DB 0AH,0DH,"  1. High number  2. Very high number    3. By open mind    4. By stinginess$"
     Option_11 DB 0AH,0DH,"  1. Mashrafe Mortaza  2. Sakib Al Hasan    3. Romzan    4. Tanjim $"
     Option_12 DB 0AH,0DH,"  1. Four  2. One    3. Three    4. Two $"
     Option_13 DB 0AH,0DH,"  1. 4  2. 10    3. 6    4. All of them $"
     Option_14 DB 0AH,0DH,"  1. To be defined   2. Hero    3. The big lier   4. Special $"
     Option_15 DB 0AH,0DH,"  1. Your lover(gf)   2. Parents  3. Friends   4. Relative $"

.CODE

MAIN PROC    
   
 mov ax, @DATA
 mov ds, ax
    
 mov Score,0
 mov Op1, 1
 mov Op2, 2
 mov Op3, 3
 mov Op4, 4
    
 xor cx,cx  ;starting page
 mov cl,4
    
 Loop_1:
    
  Print_R RN 
    
 loop Loop_1
    
 Print_R R1    
 Print_R RZ 
 Print_R RN
 
 Print_R RN
 Print_R RE
  
 xor cx,cx
 mov cl,25
 mov bl,13
 mov si,0

 Loop_2:
   
    mov ah,1
    int 21H
    mov RE_Name[si],al
    inc si 
    
   Information al,bl
  
 loop Loop_2
  
 Print_R RN
 Print_R RC
  
 xor cx,cx
 mov cl,25
 mov bl,13
 mov si,0

 Loop_3:
   
    mov ah,1
    int 21H
    mov RC_Phone[si],al
    inc si 
     
   Information al,bl
  
 loop Loop_3
 
 Print_R RN 
 Print_R RN 
     
              ;Quiz start
 Print_R RN  
 Print_R Q1   
 Print_R RN 
 Print_R Option_1 
 Print_R RN
 Print_R R2 
    
 call Answer
 Check_Answer al,Op3
 
 Print_R RN
 Print_R RA
 Print_R1 Op3
 Print_R RN 
            ; end Q1

 Print_R RN
 Print_R Q2  
 Print_R RN 
 Print_R Option_2
 Print_R RN
 Print_R R2 
    
 call Answer
 Check_Answer al,Op4

 Print_R RN
 Print_R RA
 Print_R1 Op4
 Print_R RN       
            ; end Q2      

 Print_R RN
 Print_R Q3  
 Print_R RN 
 Print_R Option_3 
 Print_R RN
 Print_R R2 
    
 call Answer
 Check_Answer al,Op1

 Print_R RN
 Print_R RA
 Print_R1 Op1
 Print_R RN            
            ; end Q3 
            
 Print_R RN  
 Print_R Q4  
 Print_R RN 
 Print_R Option_4
 Print_R RN
 Print_R R2 
    
 call Answer
 Check_Answer al,Op2

 Print_R RN
 Print_R RA
 Print_R1 Op2
 Print_R RN          
            ; end Q4
                  
 Print_R RN
 Print_R Q5  
 Print_R RN 
 Print_R Option_5
 Print_R RN
 Print_R R2 
    
 call Answer
 Check_Answer al,Op4

 Print_R RN
 Print_R RA
 Print_R1 Op4
 Print_R RN
            ; end Q5
                  
  Print_R RN
  Print_R Q6  
  Print_R RN 
  Print_R Option_6
  Print_R RN
  Print_R R2 
    
  call Answer
  Check_Answer al,Op3

  Print_R RN
  Print_R RA
  Print_R1 Op3
  Print_R RN        
             ; end Q6
 
  Print_R RN
  Print_R Q7  
  Print_R RN 
  Print_R Option_7 
  Print_R RN
  Print_R R2 
    
  call Answer
  Check_Answer al,Op2

  Print_R RN
  Print_R RA
  Print_R1 Op2
  Print_R RN
             ; end Q7
   
  Print_R RN
  Print_R Q8    
  Print_R RN 
  Print_R Option_8 
  Print_R RN
  Print_R R2 
    
  call Answer
  Check_Answer al,Op4

  Print_R RN
  Print_R RA
  Print_R1 Op4
  Print_R RN 
             ; end Q8
                  
  Print_R RN
  Print_R Q9   
  Print_R RN 
  Print_R Option_9 
  Print_R RN
  Print_R R2 
    
  call Answer
  Check_Answer al,Op4

  Print_R RN
  Print_R RA
  Print_R1 Op4
  Print_R RN
             ; end Q9    
    
  Print_R RN
  Print_R Q10   
  Print_R RN 
  Print_R Option_10 
  Print_R RN
  Print_R R2 
    
  call Answer
  Check_Answer al,Op4

  Print_R RN
  Print_R RA
  Print_R1 Op4
  Print_R RN            
             ; end Q10
    
  Print_R RN
  Print_R Q11   
  Print_R RN 
  Print_R Option_11 
  Print_R RN
  Print_R R2 
    
  call Answer
  Check_Answer al,Op1

  Print_R RN
  Print_R RA
  Print_R1 Op1
  Print_R RN          
             ; end Q11
                  
  Print_R RN
  Print_R Q12   
  Print_R RN 
  Print_R Option_12 
  Print_R RN
  Print_R R2 
    
  call Answer
  Check_Answer al,Op4

  Print_R RN
  Print_R RA
  Print_R1 Op4
  Print_R RN         
             ; end Q12
                  
  Print_R RN
  Print_R Q13   
  Print_R RN 
  Print_R Option_13 
  Print_R RN
  Print_R R2 
    
  call Answer
  Check_Answer al,Op3

  Print_R RN
  Print_R RA
  Print_R1 Op3
  Print_R RN        
             ; end Q13
                  
  Print_R RN
  Print_R Q14   
  Print_R RN 
  Print_R Option_14 
  Print_R RN
  Print_R R2 
    
  call Answer
  Check_Answer al,Op1
  
  Print_R RN
  Print_R RA
  Print_R1 Op1
  Print_R RN
             ; end Q14        
    
  Print_R RN
  Print_R Q15  
  Print_R RN 
  Print_R Option_15
  Print_R RN
  Print_R R2 
    
  call Answer
  Check_Answer al,Op2

  Print_R RN
  Print_R RA
  Print_R1 Op2
  Print_R RN         
             ; end Q15
       
             
  xor cx,cx  ; end page
  mov cl,4
  
  Loop_4:
    
    Print_R RN 
    
  loop Loop_4
     
  Print_R R3     
  Print_R Rz
  Print_R RN   
  Print_R R4
    
  xor ax,ax  ;result show
  
  mov al,Score
  mov R,10
  div R
  mov bh,ah
    
  Print_R1 al
  Print_R1 bh
  
  Print_R RN
  Print_R R5
    
mov ah, 4ch
int 21h

MAIN ENDP
 

Stop_string proc
  
  jne Stop_1
  je Stop_2
    
  Stop_1:
  
   inc R
   jmp end1
    
  Stop_2:
  
    mov ch,0
    mov cl,1
    
   end1:  
  ret
    
Stop_string endp


Result_of_Quiz proc
  
 je RESULT_1
 jne RESULT_2
   
  RESULT_1:
     
    Add Score,1
     
  RESULT_2: 
     
    ret
        
Result_of_Quiz endp
     

Answer proc
       
    xor ax,ax
    mov ah,1
    int 21H
    sub al,30H 
    
    ret
    
Answer endp
 
   
END MAIN