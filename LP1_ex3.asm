section .data
    n dd 10         ; número pre-def de impares a serem impressos

section .text
    global _start

_start:
    mov eax, [n]     ; carrega o valor de n em eax
    mov ebx, 1       ; inicializa o numero impar em 1

print_loop:
    cmp eax, 0       ; verifica se ainda ha numeros impares para imprimir
    je end_print

    mov edx, ebx     ; carrega o valor a ser impresso em edx
    mov eax, 4       ; define a chamada do sistema para impressao
    mov ebx, 1       ; define o identificador de arquivo como stdout
    mov ecx, number_format ; carrega o formato de impressao
    int 0x80         ; chama a interrupcao do sistema para imprimir o numero

    add ebx, 2       ; adiciona 2 ao numero impar para encontrar o proximo impar
    dec eax          ; decrementa o contador de numeros impares para imprimir
    jmp print_loop   ; repete o laco

end_print:
    mov eax, 1       ; define o cod de saida como 1 (sucesso)
    xor ebx, ebx     ; define o cod de erro como zero
    int 0x80         ; chama a interrupcao do sistema para terminar o programa
