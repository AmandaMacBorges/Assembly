;
;    Problema do Troco
;

.code

    INICIO:
        lda    troco       ; carrega troco em AC
        sta    restante    ; copiar troco na var aux

        lda    restante    ; carrega restante em AC
        jz     FIM         ; se zerou, encerra programa

    TESTE100:
        lda    valor_100   ; carrega valor_100 em AC
        not                ; faz compl. C-1 em valor_100
        add    #01h        ; faz compl. C-2 em valor_100
        add    restante    ; realizar (rest - 100)
        jn     TESTE50     ; se for mt grande, pula pra 50

    SOMA100:               ; se a moeda 100 encaixa
        lda    valor_100   ; carrega valor_100 em AC
        not                ; faz compl. C-1 em valor_100
        add    #01h        ; faz compl. C-2 em valor_100
        add    restante    ; realizar (rest - 100)
        sta    restante    ; armazena resultado em rest

        lda    qtd_100     ; carrega qtd_100 em AC
        add    #01h        ; incrementa em 1
        sta    qtd_100     ; armazena resultado em qtd_100

        jmp    TESTE100    ; refaz loop realizavel
  

    TESTE50:
        lda    valor_50    ; carrega valor_50 em AC
        not                ; faz compl. C-1 em valor_50
        add    #01h        ; faz compl. C-2 em valor_50
        add    restante    ; realizar (rest - 50)
        jn     TESTE25     ; se for mt grande, pula pra 25

    SOMA50:                ; se a moeda 50 encaixa
        lda    valor_50    ; carrega valor_50 em AC   
        not                ; faz compl. C-1 em valor_50
        add    #01h        ; faz compl. C-2 em valor_50
        add    restante    ; realizar (rest - 50)
        sta    restante    ; armazena resultado em rest
        lda    qtd_50      ; carrega qtd_50 em AC
        add    #01h        ; incrementa em 1
        sta    qtd_50      ; armazena resultado em qtd_50

        jmp    TESTE50     ; refaz loop realizavel         
         

    TESTE25:
        lda    valor_25    ; carrega valor_25 em AC
        not                ; faz compl. C-1 em valor_25
        add    #01h        ; faz compl. C-2 em valor_25
        add    restante    ; realizar (rest - 25)
        jn     TESTE10     ; se for mt grande, pula pra 10

    SOMA25:                ; se a moeda 25 encaixa
        lda    valor_25    ; carrega valor_25 em AC
        not                ; faz compl. C-1 em valor_25
        add    #01h        ; faz compl. C-2 em valor_25
        add    restante    ; realizar (rest - 25)
        sta    restante    ; armazena resultado em rest

        lda    qtd_25      ; carrega qtd_25 em AC 
        add    #01h        ; incrementa em 1
        sta    qtd_25      ; armazena resultado em qtd_25

        jmp    TESTE25     ; refaz loop realizavel

    TESTE10:
        lda    valor_10    ; carrega valor_10 em AC
        not                ; faz compl. C-1 em valor_10
        add    #01h        ; faz compl. C-2 em valor_10
        add    restante    ; realizar (rest - 10)
        jn     TESTE5      ; se for mt grande, pula pra 5

    SOMA10:                ; se a moeda 10 encaixa
        lda    valor_10    ; carrega valor_10 em AC
        not                ; faz compl. C-1 em valor_10
        add    #01h        ; faz compl. C-2 em valor_10
        add    restante    ; realizar (rest - 10)
        sta    restante    ; armazena resultado em rest

        lda    qtd_10      ; carrega qtd_10 em AC
        add    #01h        ; incrementa em 1
        sta    qtd_10      ; armazena resultado em qtd_10

        jmp    TESTE10     ; refaz o loop realizavel

    TESTE5:
        lda    valor_5     ; carrega valor_5 em AC
        not                ; faz compl. C-1 em valor_5
        add    #01h        ; faz compl. C-2 em valor_5
        add    restante    ; realizar (rest - 5)
        jn     TESTE1      ; se for mt grande, pula pra 1

    SOMA5:                 ; se a moeda 5 encaixa
        lda    valor_5     ; carrega valor_5 em AC
        not                ; faz compl. C-1 em valor_5
        add    #01h        ; faz compl. C-2 em valor_5
        add    restante    ; realizar (rest - 5)
        sta    restante    ; armazena resultado em rest

        lda    qtd_5       ; carrega qtd_5 em AC
        add    #01h        ; incrementa em 1
        sta    qtd_5       ; armazena resultado em qtd_5

        jmp    TESTE5      ; refaz o loop realizavel     

    TESTE1:
        lda    valor_1     ; carrega valor_1 em AC
        not                ; faz compl. C-1 em valor_1
        add    #01h        ; faz compl. C-2 em valor_1
        add    restante    ; realizar (rest - 1)
        jn     FIM         ; se negativou, encerra programa

    SOMA1:                 ; se a moeda 1 encaixa
        lda    restante    ; carrega restante em AC
        add    #0FFh       ; decrementa rest em 1
        sta    restante    ; armazena resultado em rest

        lda    qtd_1       ; carrega qtd_1 em AC
        add    #01h        ; incrementa em 1
        sta    qtd_1       ; armazena resultado em qtd_1

        jmp    TESTE1      ; refaz o loop realizavel

    FIM:    hlt

.endcode

.data

    ; vetMoedas [1, 5, 10, 25] em decimais
    ; vamos declarar os valores separados
    valor_1:   db  #01h
    valor_5:   db  #05h
    valor_10:  db  #0Ah
    valor_25:  db  #19h
    valor_50:  db  #32h
    valor_100:  db  #64h

    ; troco eh 67 em decimais 
    troco:     db  #43h

    ; iniciar o valor de cada qtd como zero
    qtd_1:     db  #00h
    qtd_5:     db  #00h
    qtd_10:    db  #00h
    qtd_25:    db  #00h
    qtd_50:    db  #00h
    qtd_100:   db  #00h

    ; variavel auxiliar 
    restante:  db  #00h

.enddata.enddata