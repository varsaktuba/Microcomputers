
org 100h

#start=Emulation Kit.exe#         


jmp START

FAIL: 
lea si, m6
call print

 ;mov cx, [si]
 ;inc si
 ;inc cx 
 ;cmp cx, 20
 ;jge EXIT
 ;jmp START


START: 
call random   
mov dh, dl    
and dh, 5     

push dx
mov al, dh
mov ah, 0
mov bl, dl    
mul bl       
add al, 5    
mov bl, 5
div bl
mov dh, ah    
cmp dh, 0
je openlock1  
jmp FAIL

openlock1:

lea si, m1
call print
pop dx
push dx
or dh, dl
cmp dh, 0
jne openlock2 
jmp FAIL

openlock2:

lea si, m2
call print
pop dx
push dx
add dh, dl
sar dh, 2
cmp dh, 0
jne openlock3 
jmp FAIL

openlock3:

lea si, m3
call print
pop dx
push dx
xor dh, dl
cmp dh, 0
jne openlock4 
jmp FAIL

openlock4:

lea si, m4
call print
pop dx
push dx
mov al, dh
mov ah, 0
mov bl, dl
mul bl
mov dh, al
cmp dh, 0
je openlock5  
jmp FAIL

openlock5:

lea si, m5
call print

hlt

ret
 ;m7 db 'Locks are not open.      ', '$'
m1 db 'Lock1 was opened.             ', '$'
m2 db 'Lock2 was opened.             ', '$'
m3 db 'Lock3 was opened.             ', '$'
m4 db 'Lock4 was opened.             ', '$'
m5 db 'Lock5 was opened and I am out.', '$'
m6 db 'I couldnt open it.            ', '$'
m0 db   30 dup(0)



print proc
    mov dx, 2040h
    mov cx, 30
    L:mov al, [si]
    out dx, al
    inc si
    inc dx
    loop L
    ret
print endp 

random proc
    mov ah, 00h
    int 1ah
    mov ax, dx
    xor dx, dx
    mov cx, 10
    div cx
    ret
random endp 

;EXIT:
;LEA si,m7  
;call print  
;hlt
;ret 




