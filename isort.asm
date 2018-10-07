[org 0x100]
jmp start
data: dw 5,4,3,2,1
size: dw 10

start:         mov bx,2
               jmp insertionsort
    
nextpass:      add bx,2
               cmp bx,[size]
               je end
insertionsort: mov dx,[data+bx]
               mov si,bx
               sub si,2
               jl nextpass
               jge nextiter
nextiter:      cmp [data+si],dx
               jnl shforwrd
               jl insertat           
shforwrd:      mov ax,[data+si]
               mov [data+si+2],ax
               sub si,2
               cmp si,0
               jl insertat
               jnl nextiter
insertat: 
               mov [data+si+2],dx
               jmp nextpass

end:           mov ax,0x4c00
               int 0x21
               