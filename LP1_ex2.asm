section .data
    n dd 29        ; numero escolhido
    primo dd 0     ; flag primo
    nn_p dd 0      ; flag nn primo

section .text
    global _start

_start:
    mov eax, [n]    ; carrega o valor de n em eax
    cmp eax, 2      ; compara com 2
    jl na_prim      ; se n < 2, nao eh primo

    mov ecx, 2      ; inicializa o divisor em 2, primeiro primo
    
verifica_div:
    cmp ecx, eax    ; verifica se o divisor eh maior ou igual ao valor de n
    jge eh_prim     ; se sim, n eh primo

    mov edx, 0      ; limpa edx para armazenar o resto da divisao
    div ecx         ; divide eax por ecx, armazenando o quociente em eax e o resto em edx
    cmp edx, 0      ; verifica se o resto é zero
    je na_prim
    inc ecx         ; incrementa o divisor
    jmp verifica_div

eh_prim:
    mov eax, [primo]
    add eax, 1
    mov [primo], eax
    jmp end

na_prim:
    mov eax, [nn_p]
    add eax, 1
    mov [nn_p], eax

end: 
    int 0x80        ; termina o programa
