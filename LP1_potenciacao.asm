; Dados um inteiro x e um inteiro não-negativo n, calcular 𝑥^n

SECTION .text

global POTENCIA

MOV    EAX, [x]              ; movendo 'x' EAX

MOV    ECX, [n]              ; movendo n para o contador ECX   
POTENCIA:
    imul    EDX, EAX, [x]    ; atribui a edx 'x' vezes o valor contido em EAX
    LOOP    POTENCIA         ; ECX = ECX - 1 & Verifica -> ECX != 0 (se sim vai ao label)
    
PRINT_UDEC 4, EDX            ; mostrando na saída inteiro de 4 bytes
MOV EDX, 0                   ; movendo 0 a EDX
RET                          ; retorna EDX

section .data
    x db '5'
    n db '3'
