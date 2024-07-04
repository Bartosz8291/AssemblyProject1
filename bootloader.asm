; bootloader.asm
BITS 16
ORG 0x7C00

start:
    ; Set up the segment registers
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00

    ; Print "Hello, Bardows 2.0!" to the screen
    mov si, hello_msg
print_loop:
    lodsb
    or al, al
    jz done
    mov ah, 0x0E
    int 0x10
    jmp print_loop

done:
    ; Infinite loop to keep the bootloader running
    jmp $

hello_msg db "Hello, Bardows 2.0!", 0

TIMES 510-($-$$) db 0
DW 0xAA55
