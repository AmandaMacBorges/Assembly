.code
        lda    n2       ;carrega valor de n2 em AC
        not             ;faz compl. C-1 de n2 em AC
        add    #01h     ;faz compl. C-2 de n2 em AC
        add    n1       ;realiza operacao (n1-n2) em AC
        jn     CASO2    ;se (n1-n2)<0 vai para CASO2
        jz     CASO3    ;se (n1-n2)=0 vai para CASO3

CASO1:  lda    n1       ;senao usa o CASO1
        sta    max      ;grava n1 em max
        lda    n2   
        sta    min      ;grava n2 em min
        jmp    FIM 

CASO2:  lda    n1       ;quando n2>n1
        sta    min      ;grava n1 em min
        lda    n2 
        sta    max      ;grava n2 em max
        jmp    FIM

CASO3:  lda    iguais   ;qdo (n1=n2)
        add    #01h     ;incrementa a flag de iguais em 1
        sta    iguais

FIM:    hlt
.endcode

.data
n1:     db     #02h     ;valor inicial que defini para A
n2:     db     #05h     ;valor inicial que defini para B
max:    db     #00h     ;var. onde armazenarei o valor max
min:    db     #00h     ;var. onde armazenarei o valor min
iguais: db     #00h     ;flag que indica se os valores sao =
.enddata
