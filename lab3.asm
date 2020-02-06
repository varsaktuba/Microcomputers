org 100h 
  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    MOV CH,15        ; it is controled value N (14<N<26).
    MOV CL,25
    CMP CH,N
    JA ERROR_MES
    CMP CL,N
    JB ERROR_MES 
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 


MOV DL,1
MOV SI,0   

LOOP1:

MOV ARR [SI], DL
MOV CH, 0
MOV CL, N
INC SI
CMP DL,CL
INC DL
JB LOOP1
MOV SI, 0
JMP CHECK
      
CHECK:
CMP SI, CX
JE END 
CMP ARR[SI],1
JE COND1
CMP ARR[SI],2
JE COND2
CMP ARR[SI],2
JA CONDITION

COND1:
MOV ARR2[SI],0
INC SI
JMP CHECK

COND2:
MOV ARR2[SI],1
INC SI
JMP CHECK

CONDITION:
MOV BL,2
MOV AL,ARR[SI]
DIV BL
CMP AH,00H
JE EVEN
JMP ODD
        


ODD:
        MOV DL, ARR2[SI-1]
        SUB DL, ARR2[SI-2]          
        MOV ARR2[SI], DL
        INC SI
        JMP CHECK
        
EVEN:
        MOV DL,ARR2[SI-1]
        ADD DL, ARR2[SI-2]
        MOV ARR2[SI], DL
        INC SI
        JMP CHECK 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ERROR_MES:
        LEA SI, MESSAGE
        MOV CX, 38
        MOV AH, 0Eh 
                                  ; ERROR MESSAGE
GO: 	LODSB
        INT 10h
        LOOP GO
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
END: 
 
RET
N DB 21
ARR DB N DUP(0)  
ARR2 DB N DUP(0)
MESSAGE  DB 'Please enter a value between 14 and 26', 0 

