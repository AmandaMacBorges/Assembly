.code
              lda    a
              jz     FIM
              lda    b
              jz     FIM

INICIO:       lda    b
              not
              add    #01h
              add    a
              jn     menorA

menorB:       lda    b
              add    #0ffh
              sta    b

              jn     FIM

              lda    resultado
              add    a
              sta    resultado
              jmp    menorB

menorA:       lda    a
              add    #0ffh
              sta    a

              jn     FIM

              lda    resultado
              add    b
              sta    resultado
              jmp    menorA

FIM:          hlt
.endcode

.data
a:            db      #1Ah
b:            db      #03h
resultado:    db      #00h
.enddata
