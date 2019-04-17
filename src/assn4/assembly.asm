global main
extern printf
extern scanf
extern malloc
extern gets
extern puts
section .data
    temp dq 0
    print_int db "%i ", 0x00
    farray_print db "%f ", 0x0a, 0x00
    print_line db "", 0x0a, 0x00
    scan_int db "%d", 0
section .text
foo1:
    push ebp
    mov ebp, esp
    sub esp, 52
    fld dword [ebp+8]
    fmul dword [ebp+8]
    fstp dword [ebp-4]
    fld dword [ebp+8]
    fmul dword [ebp-4]
    fstp dword [ebp-8]
    fld dword [ebp+8]
    fmul dword [ebp+8]
    fstp dword [ebp-12]
    fld dword [ebp-8]
    fsub dword [ebp-12]
    fstp dword [ebp-16]
    mov edi, 0b01000000010000000000000000000000
    mov [ebp-20], edi
    fld dword [ebp-16]
    fadd dword [ebp-20]
    fstp dword [ebp-24]
    lea eax, [ebp-24]
    mov esp, ebp
    pop ebp
    ret
    mov esp, ebp
    pop ebp
    ret
derivFunc2:
    push ebp
    mov ebp, esp
    sub esp, 52
    mov edi, 0b01000000010000000000000000000000
    mov [ebp-4], edi
    fld dword [ebp+8]
    fmul dword [ebp+8]
    fstp dword [ebp-8]
    fld dword [ebp-4]
    fmul dword [ebp-8]
    fstp dword [ebp-12]
    mov edi, 0b01000000000000000000000000000000
    mov [ebp-16], edi
    fld dword [ebp-16]
    fmul dword [ebp+8]
    fstp dword [ebp-20]
    fld dword [ebp-12]
    fsub dword [ebp-20]
    fstp dword [ebp-24]
    lea eax, [ebp-24]
    mov esp, ebp
    pop ebp
    ret
    mov esp, ebp
    pop ebp
    ret
abs3:
    push ebp
    mov ebp, esp
    sub esp, 16
    mov edi, 0b00000000000000000000000000000000
    mov [ebp-4], edi
    fld dword [ebp+8]
    fld dword [ebp-4]
    xor eax, eax
    fcomip
    fstp dword [temp]
    setl al
    mov [ebp-8], eax
    mov edi, [ebp-8]
    cmp edi, 0
    je label20
    mov edi, 0b00000000000000000000000000000000
    mov [ebp-12], edi
    fld dword [ebp-12]
    fsub dword [ebp++8]
    fstp dword [ebp-12]
    lea eax, [ebp-12]
    mov esp, ebp
    pop ebp
    ret
    jmp label21
label20:
    lea eax, [ebp+8]
    mov esp, ebp
    pop ebp
    ret
label21:
    mov esp, ebp
    pop ebp
    ret
NR6:
    push ebp
    mov ebp, esp
    sub esp, 68
    mov edx, [ebp+8]
    push edx
    call foo1
    mov esi, ebp
    add esi, -4
    mov cx, 1
looping1:
    mov edx, [eax]
    mov [esi], edx
    add esi, 4
    add eax, 4
    dec cx
    jnz looping1
    mov edx, [ebp+8]
    push edx
    call derivFunc2
    mov esi, ebp
    add esi, -8
    mov cx, 1
looping2:
    mov edx, [eax]
    mov [esi], edx
    add esi, 4
    add eax, 4
    dec cx
    jnz looping2
    fld dword [ebp-4]
    fdiv dword [ebp-8]
    fstp dword [ebp-12]
    fld dword [ebp-12]
    fstp dword [ebp-16]
    mov edi, 0
    mov [ebp-20], edi
    mov edi, [ebp-20]
    mov [ebp-24], edi
label29:
    mov edi, 50
    mov [ebp-28], edi
    mov edi, [ebp-24]
    mov esi, [ebp-28]
    xor eax, eax
    cmp edi, esi
    setl al
    mov [ebp-32], eax
    mov edi, [ebp-32]
    cmp edi, 0
    je label27
    jmp label26
label28:
    mov esi, [ebp-24]
    inc esi
    mov [ebp-24], esi
    jmp label29
label26:
    mov edx, [ebp+8]
    push edx
    call foo1
    mov esi, ebp
    add esi, -36
    mov cx, 1
looping3:
    mov edx, [eax]
    mov [esi], edx
    add esi, 4
    add eax, 4
    dec cx
    jnz looping3
    mov edx, [ebp+8]
    push edx
    call derivFunc2
    mov esi, ebp
    add esi, -40
    mov cx, 1
looping4:
    mov edx, [eax]
    mov [esi], edx
    add esi, 4
    add eax, 4
    dec cx
    jnz looping4
    fld dword [ebp-36]
    fdiv dword [ebp-40]
    fstp dword [ebp-44]
    fld dword [ebp-44]
    fstp dword [ebp-16]
    fld dword [ebp+8]
    fsub dword [ebp-16]
    fstp dword [ebp-48]
    fld dword [ebp-48]
    fstp dword [ebp+8]
    jmp label28
label27:
    lea eax, [ebp+8]
    mov esp, ebp
    pop ebp
    ret
    mov esp, ebp
    pop ebp
    ret
main:
    push ebp
    mov ebp, esp
    sub esp, 48
    mov edi, 0b01000000000000000000000000000000
    mov [ebp-8], edi
    fld dword [ebp-8]
    fstp dword [ebp-4]
    mov edi, 0b01000000010000000000000000000000
    mov [ebp-12], edi
    fld dword [ebp-12]
    fstp dword [ebp-16]
    mov edx, [ebp-4]
    push edx
    call NR6
    mov esi, ebp
    add esi, -20
    mov cx, 1
looping5:
    mov edx, [eax]
    mov [esi], edx
    add esi, 4
    add eax, 4
    dec cx
    jnz looping5
    fld dword [ebp-20]
    fstp dword [ebp-24]
    fld dword [ebp-24]
    fstp qword [temp]
    push dword [temp+4]
    push dword [temp+4]
    push dword farray_print
    call printf
    add esp, 12
    mov esp, ebp
    pop ebp
    ret
