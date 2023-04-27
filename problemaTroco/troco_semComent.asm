.code
    INICIO:
        lda    troco
        sta    restante
        lda    restante
        jz     FIM
    TESTE25:
        lda    valor_25
        not
        add    #01h
        add    restante
        jn     TESTE10
    SOMA25:
        lda    valor_25
        not
        add    #01h
        add    restante
        sta    restante
        lda    qtd_25
        add    #01h
        sta    qtd_25
        jmp    TESTE25
    TESTE10:
        lda    valor_10
        not
        add    #01h
        add    restante
        jn     TESTE5
    SOMA10:
        lda    valor_10
        not
        add    #01h
        add    restante
        sta    restante
        lda    qtd_10
        add    #01h
        sta    qtd_10
        jmp    TESTE10
    TESTE5:
        lda    valor_5
        not
        add    #01h
        add    restante
        jn     TESTE1
    SOMA5:
        lda    valor_5
        not
        add    #01h
        add    restante
        sta    restante
        lda    qtd_5
        add    #01h
        sta    qtd_5
        jmp    TESTE5   
    TESTE1:
        lda    valor_1
        not
        add    #01h
        add    restante
        jn     FIM
    SOMA1:
        lda    restante
        add    #0FFh
        sta    restante
        lda    qtd_1
        add    #01h
        sta    qtd_1
        jmp    TESTE1
    FIM:    hlt
.endcode

.data
    valor_1:   db  #01h
    valor_5:   db  #05h
    valor_10:  db  #0Ah
    valor_25:  db  #19h
    troco:     db  #43h
    qtd_1:     db  #00h
    qtd_5:     db  #00h
    qtd_10:    db  #00h
    qtd_25:    db  #00h
    restante:  db  #00h
.enddata
