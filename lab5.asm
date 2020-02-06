
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV AX,2000H
MOV SI,AX

CALL NUMBER1       
CALL NUMBER2
CALL MULTIPLICATION
CALL RESULT     

ret 

N1A DW 1122H
N1B DW 3344H

N2A DW 5566H
N2B DW 7788H

NUMBER1 PROC 
    
    MOV AX,N1A
    MOV BX,N1B
    
    MOV [SI+2],AX
    MOV [SI],BX    
    
    RET
    NUMBER1 ENDP

NUMBER2 PROC  
    
    MOV CX,N2A
    MOV DX,N2B
    
    MOV [SI+6],CX
    MOV [SI+4],DX
    
    RET
    NUMBER2 ENDP
                                
MULTIPLICATION PROC
    
    ; -- N1B X N2B --
    MOV AX,N1B
    MOV BX,N2B
    MUL BX    
    MOV [SI+8],AX
    MOV [SI+10],DX 
    
    ; -- N1A X N2A --
    MOV AX,N1A
    MOV BX,N2A
    MUL BX
    MOV [SI+12],AX
    MOV [SI+14],DX
    
    ; -- N1A X N2B -- 
    MOV AX,N1A
    MOV BX,N2B
    MUL BX
    ADD AX,[SI+10] 
    MOV [SI+10],AX
    ADC DX,[SI+12]
    MOV [SI+12],DX
    MOV AX,0000H 
    ADC AX,[SI+14]
    MOV [SI+14],AX
    
    ; -- N1B X N2A --
    MOV AX,N1B
    MOV BX,N2A
    MUL BX
    ADD AX,[SI+10] 
    MOV [SI+10],AX
    ADC DX,[SI+12]
    MOV [SI+12],DX
    MOV AX,0000H
    ADC AX,[SI+14]
    MOV [SI+14],AX   
   
    RET
    MULTIPLICATION ENDP 

RESULT PROC 
    
    PRINT:
    ADD SI,15 
    MOV CX,8 
    MOV AH,0EH 
    STD
    GO:
    LODSB
    INT 10H
    LOOP GO 
    
    RET
    RESULT ENDP  
