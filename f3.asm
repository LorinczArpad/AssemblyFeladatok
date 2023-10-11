
Code Segment
                        assume CS:Code, DS:Data, SS:Stack
    Start:              
                        mov    ax, Code
                        mov    ds, ax
                        mov    di, offset ertek
                        mov    ax, 03
                        int    10h
                   
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
    nck:                
                        cmp    al, '0'
                        jz     HibaK
                        cmp    al, ah
                        jz     Tarol
                        inc    ah
                        loop   Vizsg
                        
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
	
                        mov    dx, offset megegy
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
                        jz     Program_vege_Gate_2
	
	
                        mov    cx, 10
                        mov    ah, '0'
    Vizsg2:             
    ;0 at nem fogad el elsore
                        cmp    cx, 10
                        jz     nck2
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
    nck2:               
                        cmp    al, '0'
                        jz     HibaK2
                        cmp    al, ah
                        jz     Tarol2
                        inc    ah
                        loop   Vizsg2
                        jmp    HibaK2
	
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
	
                        mov    dx, offset kerdes
                        mov    ah, 09h
                        int    21h

                        xor    ax, ax
                        int    16h
                        cmp    al, 2
                        jz     Program_vege
                        jmp    Menu
    Program_vege_Gate_2:
                        jmp    Program_vege
    Menu:               
                        mov    ax,03h
                        int    10h


                        mov    dx, offset kerdes2
                        mov    ah, 09h
                        int    21h
                        xor    ax, ax
                        int    16h
                        cmp    al, 2
                        jz     M2
                        cmp    al,1
                        jz     M1
                      
    M1:                 
                        
                        mov    dx, offset kerdes2
                        mov    ah, 09h
                        int    21h
    M2:                 
                      

    Program_vege:       
                        mov    ax, 4c00h
                        int    21h
    ertek:              db     '****$'
    ertek2:             db     '****$'
    hiba:               db     'Nem megengedett karakter!$'
    uzenet:             db     'Vege a bevitelnek$'
    welcomem:           db     'Adjon meg ket szamot$'
    megegy:             db     'Adjon meg egy szamot$'
    kerdes:             db     'Kivanja modositani a szamokat? 1=igen 2=nem$'
    kerdes2:            db     'Melyik szamot kivanja modositani? 1=elso, 2 = masodik$'
    megy:               db     'VAlami egyes$'
    megy2:              db     'VAlami kettes$'

Code Ends

Data Segment
Data Ends

Stack Segment
Stack Ends

End Start
