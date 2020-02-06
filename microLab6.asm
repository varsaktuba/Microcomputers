; Directive to make EXE output:
       #start=Emulation Kit.exe#

DSEG    SEGMENT 'DATA'

Dots    DB	00000000b, 00000000b, 00000000b, 00000000b, 00000000b
        DB	00000000b, 00000000b, 00000000b, 00000000b, 00000000b
        DB	00000000b, 00000000b, 00000000b, 00000000b, 00000000b
        DB	00000000b, 00000000b, 00000000b, 00000000b, 00000000b	
        DB	01111111b, 01001001b, 01001001b, 01001001b, 01000001b  ; E
	    DB	01001111b, 01001001b, 01001001b, 01001001b, 01111001b  ; S
	    DB	00000001b, 00000001b, 01111111b, 00000001b, 00000001b  ; T
	    DB	01111111b, 01000000b, 01000000b, 01000000b, 01111111b  ; U

DSEG    ENDS

                 
;*******************************************

START   PROC    FAR
 
; Store return address to OS:
	MOV DX,2000h 
	
FIRST:
    MOV loc,DX
    PUSH    DS
    MOV     AX, 0
    PUSH    AX

; set segment registers:
	MOV     AX, DSEG
    MOV     DS, AX
    MOV     ES, AX

; first DOT MATRIX digit
	MOV BX, 0  
	
	    
	
INDEX:
    MOV SI,0
    MOV CX,5
    
NEXT:
    CMP DX,2027h
    JBE PRINT
    MOV DX,2000h

PRINT:
    MOV AL,Dots[BX][SI]
    OUT DX,AL
    INC SI 
    INC DX   
    
    CMP SI,5
    LOOPNE NEXT
    
    ADD BX,5
    CMP BX,40
    JL INDEX
    
    MOV DX,loc
    CMP loc,2027h
    JBE RELOC
    MOV DX,2000h
    
RELOC:
    ADD DX,5
    JMP FIRST    
    
    
    
        
    RET   
    START   ENDP    
    
    loc DW 2000h         
    
    END    START