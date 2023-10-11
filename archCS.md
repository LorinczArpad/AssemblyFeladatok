## Kiiratas:

mov Ah, 09 <br>
mov Dx, offset message `Mit irunk ki`<br>
int 21h<br>

## KepernyoTorles:

mov ax,03h<br>
int 10h

## KurzorPozicionalas:

mov ah,02h<br>
mov bh,0<br>
mov dh, 10 `oszlop`<br>
mov dl, 40 `sor`<br>
int 10h<br>

## Bevitel:

xor ax,ax `torli az ax-et`<br>
int 16h `al-be tolti a billenyut amit lenyomtunt`<br>

## Ertek betoltese:

mov al, [di] `al-be a di erteket toltjuk be`

## Osszehasonlitas:

cmp al, ah `osszehasonlitja a al-t az ah-val`<br>
jz `ha akkor akarunk ugrani egyenlo`<br>
je `ha egyenlo`<br>
jg `ha nagyobb`<br>
jge `ha nagyobb egyenelo`<br>
jl `ha kisebb`<br>
jle `ha kisebb vagy egyenelo`<br>
jmp `ha feltetel nelkul ugrunk`<br>
jnz `ha nem egyenlo`<br>
JCXZ `ha a cx register 0`<br>

## Loop:

mov cx, 10<br>
Ciklus:<br>
`ciklus torzs`<br>
loop Vizsg<br>

`a cx erteket minden itteracioban csokkenti de ezt nekunk manualisan kell vizsgalni`

## HosszVizsgalat:

mov \[di], al<br>
inc di<br>
mov al, '$'<br>
mov \[di], al<br>
mov ax, offset ertek<br>
add ax, 4<br>
cmp ax, di<br>

`megnezzuk hogy a ertek 4 hosszu-e`<br>
`legyen az ertek 1000$`<br>
`ebben az esteben ha ax-hez hozza adunk 4-et akkor a $ et fogjuk kapni`<br>
