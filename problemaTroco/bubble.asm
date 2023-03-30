;
;	Bubble Sort
;
			
.code
lda tam
add #0ffh
sta tmp1		

main_loop:			; Loop principal
lda #vet
add tmp1		
sta endvar1		
lda endvar1,I

lda tmp1
add #0ffh
sta tmp2		

loop:				; Loop secundario
lda #vet
add tmp2
sta endvar2
lda endvar2,I
not
add #01h
add endvar1,I
jn troca
jmp nao_troca

troca:			;Realiza troca 
lda endvar1,I		;entre elementos do vetor
sta var1
lda endvar2,I
sta endvar1,I
lda var1
sta endvar2,I

nao_troca:
lda tmp2
add #0ffh
sta tmp2
jn sai
jmp loop			; Fim do loop secundario

sai:
lda tmp1
add #0ffh
sta tmp1
jz fim
jmp main_loop		; Fim do loop principal


fim:
hlt

.endcode


org #80h
.data
tmp1: db #00			;Contador 1 
tmp2: db #00			;Contador 2
var1: db #00		;Conteudo da pos endvar1
endvar1: db #00		;Posicao 1 no vetor
endvar2: db #00		;Posicao 2 no vetor
tam: db #07				;Tamanho do vetor
;Vetor
vet: db #065h,#34h,#011h,#27h,#44h,#022h,#02h

.enddata
