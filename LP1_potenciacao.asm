; Dados um inteiro x e um inteiro não-negativo n, calcular 𝑥^n

section .text

global loop_potencia
global loop_mult

mov    counter, [x]         ; copiar o valor de x em counter

mov    ecx, [n]             ; iniciar um loop ate n vezes   
loop_potencia:
    loop_mult:
        mov    eax, [result]    ; carregar em eax o valor de result
        sub    eax, '0'
        mov    ebx, [x]         ; carrega valor de x em ebx
        sub    ebx, '0'
        add    eax, ebx         ; soma os valores dos dois
        add    eax, '0'
        mov    [result], eax    ; armazenar esse valor dnv em result
    
        mov    eax, [counter]   ; carregar em eax o valor do counter
        sub    eax, '1'         ; decrementa em 1
        mov    [counter], eax   ; armazena o valor calculado em counter
        
        cmp    eax, '0'         ; compara valor de eax com 0
                                ; se eax < 0, zf = 0 e cf = 1
                                ; se eax > 0, zf = 0 e cf = 0
                                ; se eax = 0, zf = 1 e cf = 0
        
        jnz    loop_mult        ; se eax = 0 (zf dif de zero)
                                ; refaz o loop_mult
        
    
    mov     eax, [x]
    sub     eax, '0'
    mov     ebx, [y]
    sub     ebx, '0'
    add     eax, ebx
    add     eax, '0'

    mov     [sum], eax

    mov     ecx, msg
    mov     edx, len
    mov     ebx, 1
    mov     eax, 4
    int     0x80

    mov     ecx, sum
    mov     edx, 1
    mov     ebx, 1
    mov     eax, 4
    int     0x80

    mov     eax, 1
    int     0x80

section .data
    x db '5'
    n db '3'
    counter db '0'
    result dd '0'
    
segment .bss

    sum resb 1
