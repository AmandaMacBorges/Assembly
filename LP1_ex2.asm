; dado um inteiro positivo n, verificar se n eh primo

section .data
    msg db 'O numero eh primo', 0
    not_prime db 'O numero nao eh primo', 0

section .bss
    n resb 4

section .text
    global _start

_is_prime:
    mov eax, dword [esp+4]
    cmp eax, 2
    jle _not_prime

    mov ecx, 2
_loop:
    mov edx, 0
    div ecx
    cmp edx, 0
    je _not_prime
    inc ecx
    cmp ecx, eax
    jle _loop

    ret

_start:
    ; le o numero inteiro do usuario
    mov eax, 3
    mov ebx, 0
    mov ecx, n
    mov edx, 4
    int 0x80

    ; converte a entrada do usuario em um numero inteiro
    mov eax, dword [n]
    sub eax, 0x30

    ; chama a funcao _is_prime para verificar se o numero eh primo
    push eax
    call _is_prime
    add esp, 4

    ; exibe a mensagem correspondente
    cmp eax, 0
    jne _not_prime_msg
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 16
    int 0x80
    jmp _exit
_not_prime_msg:
    mov eax, 4
    mov ebx, 1
    mov ecx, not_prime
    mov edx, 21
    int 0x80
_exit:
    ; finaliza o programa
    mov eax, 1
    xor ebx, ebx
    int 0x80

_not_prime:
    xor eax, eax
    ret

;Explicação do código:

    ;A seção .data contém as mensagens que serão exibidas ao usuário para informar se o número é primo ou não.

    ;A seção .bss reserva espaço na memória para a variável n, que armazenará o número inteiro
