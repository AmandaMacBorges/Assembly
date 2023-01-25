;Requisito do problema: range do loop eh (i=0) ate (i<N)

.code
INICIO:    lda    N           ;carrega o valor b em AC
           not                ;faz o compl. C-1 de b
           add    #01h        ;faz o compl. C-2 de b
           add    i           ;realiza op. (a-b)
           jn     OPERACAO    ;se (i-N)<0 realiza operacao
           jz     FIM         ;se (i-N)=0 encerra programa

OPERACAO:  lda    i           ;carrega i atual em AC
           add    i
           add    X           ;realiza (i+i+X) em AC
           sta    X           ;armazena resultado em X

           lda    i           ;recarrega i em AC
           add    #01h        ;incrementa em 1
           sta    i           ;armazena valor incrementado 
           jmp    INICIO      ;repete todo processo

FIM:       hlt
.endcode

.data
i:         db     #00h
X:         db     #00h
N:         db     #05h
auxMult:   db     #00h
auxSum:    db     #00h
.enddata