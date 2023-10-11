
Code Segment
	                  assume CS:Code, DS:Data, SS:Stack
	Start:            
	                  mov    ax, Code
	                  mov    ds, ax
	;mov di, offset ertek
	;mov ax, 03
	;int 10h

	                  mov    ah, 09
	                  mov    dx, offset welcomem
	                  int    21h
	
	
	
	
	Bevitel:          
	                  xor    ax, ax
	                  int    16h
	                  mov    bx,ax
	
	                  mov    ax, 03
	                  int    10h
	

	
	                  mov    ax,bx
	                  cmp    al, 27
	                  jz     Program_vege_Gate
	
	
	                  mov    cx, 10
	                  mov    ah, '0'
	Vizsg:            
	;0 at nem fogad el elsore
	                  cmp    cx, 10
	                  jz     nck
	nck:              
	                  cmp    al, '0'
	                  jz     HibaK
	                  cmp    al, ah
	                  jz     Tarol
	                  inc    ah
	                  loop   Vizsg
	                  jmp    HibaK
	
	HibaK:            
	                  mov    ah, 02h
	                  mov    bh, 0
	                  mov    dh, 10
	                  mov    dl, 5
	                  int    10h
	                  mov    dx, offset hiba
	                  mov    ah, 09
	                  int    21h
	
	
	                  jmp    Bevitel
	Program_vege_Gate:
	                  jmp    Program_vege
	Tarol:            
	                  mov    [di], al
	                  inc    di
	                  mov    al, '$'
	                  mov    [di], al
	
	                  mov    ah, 02h
	                  mov    bh, 0
	                  mov    dh, 5
	                  mov    dl, 28
	                  int    10h
	                  mov    dx, offset ertek
	                  mov    ah, 09
	                  int    21h
	                  mov    ax, offset ertek
	                  add    ax, 4
	                  cmp    ax, di
	                  jnz    Bevitel
	
	                  mov    ah, 02h
	                  mov    bh, 0
	                  mov    dh, 7
	                  mov    dl, 0
	                  int    10h
	
	                  mov    dx, offset welcomem
	                  mov    ah, 09h
	                  int    21h
	Bevitel2:         
	                  xor    ax, ax
	                  int    16h
	                  mov    bx,ax
	
	                  mov    ax, 03
	                  int    10h
	

	
	                  mov    ax,bx
	                  cmp    al, 27
	                  jz     Program_vege
	
	
	                  mov    cx, 10
	                  mov    ah, '0'
	Vizsg2:           
	;0 at nem fogad el elsore
	                  cmp    cx, 10
	                  jz     nck2
	nck2:             
	                  cmp    al, '0'
	                  jz     HibaK2
	                  cmp    al, ah
	                  jz     Tarol2
	                  inc    ah
	                  loop   Vizsg2
	                  jmp    HibaK2
	
	HibaK2:           
	                  mov    ah, 02h
	                  mov    bh, 0
	                  mov    dh, 10
	                  mov    dl, 5
	                  int    10h
	                  mov    dx, offset hiba
	                  mov    ah, 09
	                  int    21h
	
	
	                  jmp    Bevitel2
	
	Tarol2:           
	                  mov    [di], al
	                  inc    di
	                  mov    al, '$'
	                  mov    [di], al
	
	                  mov    ah, 02h
	                  mov    bh, 0
	                  mov    dh, 5
	                  mov    dl, 28
	                  int    10h
	                  mov    dx, offset ertek2
	                  mov    ah, 09
	                  int    21h
	
	                  mov    ax, offset ertek2
	                  add    ax, 4
	                  cmp    ax, di
	                  jnz    Bevitel2
	
	
	                  mov    ah, 02h
	                  mov    bh, 0
	                  mov    dh, 7
	                  mov    dl, 0
	                  int    10h
	
	                  mov    dx, offset uzenet
	                  mov    ah, 09h
	                  int    21h
	Program_vege:     
	                  mov    ax, 4c00h
	                  int    21h
	ertek:            db     '****$'
	ertek2:           db     '****$'
	hiba:             db     'Nem megengedett karakter!$'
	uzenet:           db     'Vege a bevitelnek$'
	welcomem:         db     'Adjon meg egy szamot$'
Code Ends

Data Segment
Data Ends
