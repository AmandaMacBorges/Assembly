.code
INICIO:    lda    counterFour    ;verificar se o nro eh < q o cnt
           not
           add    #01h
           add    N
           jn     FIM            ;se N < cnt encerra a funcao
           jz     multiplo       ;se N = cnt seta flag multiplo

proxMult:  lda    counterFour    ;se N > cnt incrementa cnt
           add    #04h
           sta    counterFour
           jmp    INICIO         ;reinicia verificacao

multiplo:  lda    #01h           ;se for multiplo seta flagFour em 1
           sta    flagFour

FIM:       hlt
.endcode

.data
N:            db    #10h       ;valor inicial escolhido pra N
counterFour:  db    #04h       ;contador que vai de 4 em 4
flagFour:     db    #00h       ;flag que indica que eh multiplo
.enddata