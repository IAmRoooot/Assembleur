section .data
        ;Valeurs des datas
        valeura: dd "Saisir le premier chiffre : "
        formata: equ $-valeura
        numa: dd 0
        valeurb: dd "Saisir le deuxième chiffre : "
        formatb: equ $-valeurb
        numb: dd 0
        format: dd  "Le résultat de l'addition de ces deux nombres est : "
        formatsize: equ $-format
        formatsub: dd "Le résultat de la soustraction de ces deux nombres est : "
        formatsubsize: equ $-formatsub
        formatmul: dd "Le résultat de la multiplication de ces deux nombres est : "
        formatmulsize: equ $-formatmul
        saut: dd 10
        result: dd 0
        resultsub: dd 0
        resultmul: dd 0

section .text
        ;Code segment
        global _start

_start:
        ;Saisir A
        mov eax,4
        mov ebx,1
        mov ecx,valeura
        mov edx,formata
        int 80h

        ;Lit et stock A
        mov eax,3
        mov ebx,2
        mov ecx,numa
        mov edx,2
        int 80h

        ;Saisir B
        mov eax,4
        mov ebx,1
        mov ecx,valeurb
        mov edx,formatb
        int 80h

        ;Lit et stock B
        mov eax,3
        mov ebx,2
        mov ecx,numb
        mov edx,2
        int 80h

        ;Message 'Addition'
        mov eax,4
        mov ebx,1
        mov ecx,format
        mov edx,formatsize
        int 80h

        ;Calcul
        mov eax,[numa]
        sub eax,48
        mov ebx,[numb]
        sub ebx,48
        add eax,ebx
        add eax,48
        mov [result],eax

        ;Affichage résultat
        mov eax,4
        mov ebx,1
        mov ecx,result
	mov edx,1
        int 80h

        ;Saut de ligne
        mov eax,4
        mov ebx,1
        mov ecx,saut
        mov edx,1
        int 80h

        ;Message 'Soustraction'
        mov eax,4
        mov ebx,1
        mov ecx,formatsub
        mov edx,formatsubsize
        int 80h

        ;Calcul
        mov eax,[numa]
        sub eax,48
        mov ebx,[numb]
        sub ebx,48
        sub eax,ebx
        add eax,48
        mov [resultsub],eax

        ;Affichage résultat
        mov eax,4
        mov ebx,1
        mov ecx,resultsub
        mov edx,1
        int 80h

        ;Saut de ligne
        mov eax,4
        mov ebx,1
        mov ecx,saut
	mov edx,1
        int 80h

        ;Message 'Multiplication'
        mov eax,4
        mov ebx,1
        mov ecx,formatmul
        mov edx,formatmulsize
        int 80h

        ;Calcul
        mov eax,[numa]
        sub eax,48
        mov ebx,[numb]
        sub ebx,48
        imul eax,ebx
        add eax,48
        mov [resultmul],eax

        ;Affichage résultat
        mov eax,4
        mov ebx,1
        mov ecx,resultmul
        mov edx,1
        int 80h

        ;Saut de ligne
        mov eax,4
        mov ebx,1
        mov ecx,saut
        mov edx,1
        int 80h

        ;Exit code
        mov eax,1
        mov ebx,0
        int 80h
