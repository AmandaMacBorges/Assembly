// Definir as constantes para os valores das moedas e o valor do troco
VALOR_1 EQU 1
VALOR_5 EQU 5
VALOR_10 EQU 10
VALOR_25 EQU 25
TROCO EQU 67

// Definir as variáveis para a quantidade de cada moeda necessária
QTD_MOEDAS_1 DS.W 1
QTD_MOEDAS_5 DS.W 1
QTD_MOEDAS_10 DS.W 1
QTD_MOEDAS_25 DS.W 1

// Início do programa
INICIO: 
    // Inicializar a quantidade de cada moeda necessária com zero
    LOAD 0, R1
    STORE R1, QTD_MOEDAS_1
    STORE R1, QTD_MOEDAS_5
    STORE R1, QTD_MOEDAS_10
    STORE R1, QTD_MOEDAS_25
    
    // Subtrair os valores das moedas do troco, enquanto o troco for maior que zero
    LOAD TROCO, R1
    CMP R1, 0
    JLE FIM
    CMP R1, VALOR_25
    JL VERIFICA_10
    SUB VALOR_25, R1
    LOAD QTD_MOEDAS_25, R2
    ADD 1, R2
    STORE R2, QTD_MOEDAS_25
    JMP INICIO
VERIFICA_10:
    CMP R1, VALOR_10
    JL VERIFICA_5
    SUB VALOR_10, R1
    LOAD QTD_MOEDAS_10, R2
    ADD 1, R2
    STORE R2, QTD_MOEDAS_10
    JMP INICIO
VERIFICA_5:
    CMP R1, VALOR_5
    JL VERIFICA_1
    SUB VALOR_5, R1
    LOAD QTD_MOEDAS_5, R2
    ADD 1, R2
    STORE R2, QTD_MOEDAS_5
    JMP INICIO
VERIFICA_1:
    CMP R1, VALOR_1
    JL FIM
    SUB VALOR_1, R1
    LOAD QTD_MOEDAS_1, R2
    ADD 1, R2
    STORE R2, QTD_MOEDAS_1
    JMP INICIO

// Fim do programa
FIM:
    HALT
