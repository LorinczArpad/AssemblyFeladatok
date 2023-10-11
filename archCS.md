## Kiiratas:

mov Ah, 09
mov Dx, offset message //Mit irunk ki
int 21h

## KepernyoTorles:

mov ax,03h
int 10h

## KurzorPozicionalas:

mov ah,02h
mov bh,0
mov dh, 10 // oszlop
mov dl, 40 // sor
int 10h

## Bevitel:

xor ax,ax //torli az ax-et
int 16h // al-be tolti a billenyut amit lenyomtunt

## Ertek betoltese:

mov al, [di] // al-be a di erteket toltjuk be

## Osszehasonlitas:

cmp al, ah // osszehasonlitja a al-t az ah-val
jz // ha akkor akarunk ugrani egyenlo
je // ha egyenlo
jg // ha nagyobb
jge // ha nagyobb egyenelo
jl // ha kisebb
jle // ha kisebb vagy egyenelo
jmp // ha feltetel nelkul ugrunk
jnz // ha nem egyenlo
JCXZ // ha a cx register 0

## Loop:

mov cx, 10
Ciklus:  
 // ciklus torzs
loop Vizsg
// a cx erteket minden itteracioban csokkenti de ezt nekunk manualisan kell vizsgalni

## HosszVizsgalat:

                        mov    [di], al
                        inc    di
                        mov    al, '$'
                        mov    [di], al
                        mov    ax, offset ertek
                        add    ax, 4
                        cmp    ax, di

                        //megnezzuk hogy a ertek 4 hosszu-e
                        // legyen az ertek 1000$
                        //ebben az esteben ha ax-hez hozza adunk 4-et akkor a $ et fogjuk kapni
