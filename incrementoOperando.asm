.code
INICIO:    lda    b          ;carrega o valor b em AC
           not               ;faz o compl. C-1 de b
           add    #01h       ;faz o compl. C-2 de b
           add    a          ;realiza a op. (a - b)
           jn     casoInc    ;se (a-b)<0 vai pra Incre. Op. a
           jz     FIM        ; se (a0b)>0 entao encerra programa

casoInc:   lda    a          ;carrega o valor a em AC
           add    #01h       ;soma o q ta armazenado em AC + 1
           sta    a          ;armazena o resultado dnv em a
           jmp    INICIO

FIM:       hlt
.endcode

.data
a:         db     #00h
b:         db     #05h
.enddata