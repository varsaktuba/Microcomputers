
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov ax, 3000h
mov ds, ax

mov [2000h], 01h
mov [2001h], 02h
mov [2002h], 03h
mov [2003h], 04h
mov [2004h], 05h
mov [2005h], 06h
mov [2006h], 07h
mov [2007h], 08h
mov [2008h], 09h
mov [2009h], 0Ah

mov ax, 0
mov cx, 1

LABEL1:
add ax, cx
inc cx
cmp cx, 10
jle LABEL1

ret




