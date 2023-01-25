.code
INICIO:    lda    N           ;carrega o valor b em AC
           not                ;faz o compl. C-1 de b
           add    #01h        ;faz o compl. C-2 de b
           add    i           ;realiza op. (a-b)
           jn     OPERACAO    ;se (i-N)<0 realiza operacao
           jz     FIM         ;se (i-N)=0 encerra programa

OPERACAO:  lda    i           ;carrega i atual em AC
           sta    auxMult     ;guarda valor de i em auxMult

           lda    X           ;carrega X atual em AC
           sta    auxSum      ;guarda valor de X em auxSum

           lda    auxMult     ;carrega aux em AC
           add    i           ;soma valor armazenado em AC com i
           add    auxSum      ;soma valor armazenado em AC com auxSum
           sta    X           ;armazena valor de AC (duas somas) em X

           lda    i           ;carrega i em AC
           add    #01h        ;incrementa valor armazenado em AC em 1
           sta    i           ;armazena valor calculado em AC em i
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