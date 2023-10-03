.model small
.data
    ertek db '*****$'             ; Buffer to store user input (up to 5 characters)
    hiba db 'Nem megengedett karakter!$' ; Error message for non-numeric input
    uzenet db 'Vege a bevitelnek$'     ; Message for the end of input

.code
start:
    mov ax, @data           ; Initialize DS with the address of data segment
    mov ds, ax

    mov di, offset ertek    ; Initialize DI with the address of ertek buffer

    mov ax, 0003h           ; Set video mode 80x25, 16 colors
    int 10h                 ; Call BIOS video interrupt

Bevitel:
    xor ax, ax              ; Clear AX
    int 16h                 ; BIOS keyboard input

    mov bx, ax              ; Store the input in BX

    mov ax, 0003h           ; Restore video mode (clear screen)
    int 10h                 ; Call BIOS video interrupt

    mov ax, bx              ; Move the input from BX to AX
    cmp al, 27              ; Check if the input is ESC (ASCII 27)
    jz Program_vege         ; If ESC, jump to Program_vege

    mov cx, 10              ; Initialize CX with 10 for the loop
    mov ah, '0'             ; Initialize AH with '0'

Vizsg:
    cmp al, ah              ; Compare AL (input) with AH ('0')
    jz Tarol                ; If equal, jump to Tarol
    inc ah                  ; Increment AH
    loop Vizsg              ; Loop until CX becomes zero

    mov ah, 02h             ; Set up for BIOS video write
    mov bh, 0               ; Page number (0 for standard video memory)
    mov dh, 10              ; Row (vertical position)
    mov dl, 0               ; Column (horizontal position)
    int 10h                 ; Call BIOS video interrupt

    mov dx, offset hiba     ; DX points to the hiba message
    mov ah, 09h             ; Set up for displaying a string
    int 21h                 ; Call DOS interrupt to display error message

    jmp Bevitel             ; Jump back to Bevitel for another input

Tarol:
    mov [di], al            ; Store the numerical character in the buffer
    inc di                  ; Increment DI to point to the next position
    mov al, '$'             ; Put '$' to terminate the string
    mov [di], al
    mov ah, 02h             ; Set up for BIOS video write
    mov bh, 0               ; Page number
    mov dh, 5               ; Row
    mov dl, 28              ; Column
    int 10h                 ; Call BIOS video interrupt

    mov dx, offset ertek    ; DX points to the ertek buffer
    mov ah, 09h             ; Set up for displaying a string
    int 21h                 ; Call DOS interrupt to display entered value

    mov ax, offset ertek    ; Load AX with the address of ertek
    add ax, 4               ; Move AX to the end of the buffer
    cmp ax, di              ; Compare AX with DI to check if all four values are entered
    jnz Bevitel             ; If not, continue input

    mov ah, 02h             ; Set up for BIOS video write
    mov bh, 0               ; Page number
    mov dh, 7               ; Row
    mov dl, 0               ; Column
    int 10h                 ; Call BIOS video interrupt

    mov dx, offset uzenet   ; DX points to the uzenet message
    mov ah, 09h             ; Set up for displaying a string
    int 21h                 ; Call DOS interrupt to display the end message

Program_vege:
    mov ah, 4Ch             ; Terminate program with return code 0
    int 21h                 ; Call DOS interrupt

Code Ends
End Start

