; Dados um inteiro x e um inteiro não-negativo n, calcular 𝑥^n

 .code

 LOOP_POT:
     lda    n                 ; carrega valor de n em AC
     add    #0FFh             ; decrementa em 1
     sta    n                 ; armazena novamente em n
     jz     FIM               ; se zerou, finaliza programa
     
     lda    x                 ; carrega x em AC
     sta    counter           ; copia esse valor pro counter
     
 LOOP_MULT:
     lda    counter           ; carrega counter em AC
     add    #0FFh             ; decrementa em 1
     sta    counter           ; armazena resultado em counter
     
     jn     LOOP_POT          ; negativou, refaz potencia
     
     lda    result            ; carrega result em AC
     add    x                 ; realiza result + x
     sta    result            ; armazena resultado em result
     jmp    LOOP_MULT         ; refaz loop multiplicacao
     
     FIM:    hlt              ; encerra programa
     
 .endcode
 
 .data
     x:          db    #03h    ; valor do op x
     counter:    db    #00h    ; aux pra var x
     n:          db    #02h    ; valor da potencia n
     result:     db    #00h    ; var que armazenara o resultado
 .enddata
