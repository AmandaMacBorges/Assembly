.code
              lda    a        ;carrega a em AC
              jz     FIM      ;se for zero encerra programa
              lda    b        ;carrega b em AC
              jz     FIM      ;se for zero encerra programa

INICIO:       lda    b        ;recarrega b em AC
              not             ;faz compl. C-1 em b
              add    #01h     ;faz compl. C-2 em b
              add    a        ;realiza operacao (a-b)
              jn     menorA   ;se (a-b)<0 entao (a<b)

menorB:       lda    b        ;caso (b<a) carrega b em AC
              add    #0ffh    ;decrementa b em 1 
              sta    b        ;armazena resultado em b

              jn     FIM      ;se (b-1)<0 encerra programa

              lda    resultado    ;carrega resultado em AC
              add    a            ;realiza (resultado+a)
              sta    resultado    ;armazena soma em resultado
              jmp    menorB       ;reinicia todo processo

menorA:       lda    a            ;caso (a<b) carrega a em AC
              add    #0ffh        ;decrementa a em 1
              sta    a            ;armazena resultado em a

              jn     FIM          ;se (a-1)<0 encerra programa

              lda    resultado    ;carrega resultado em AC
              add    b            ;realiza (resultado+b)
              sta    resultado    ;armazena soma em resultado
              jmp    menorA       ;reinicia todo processo

FIM:          hlt                 ;por fim, encerra programa
.endcode

.data
a:            db      #04h        ;valor arbitrado para a
b:            db      #02h        ;valor arbitrado para b
resultado:    db      #00h        ;var. q armazena resultado final
.enddata