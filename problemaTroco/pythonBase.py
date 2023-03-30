def troco(valores, troco):
    # Inicializar uma lista para armazenar a quantidade de moedas necessárias
    qtd_moedas = [0] * len(valores)

    # Ordenar a lista de valores de forma decrescente
    valores.sort(reverse=True)

    # Iterar sobre cada valor na lista de valores
    for i in range(len(valores)):
        # Enquanto o troco for maior ou igual ao valor atual
        while troco >= valores[i]:
            # Subtrair o valor atual do troco
            troco -= valores[i]
            # Incrementar a quantidade de moedas necessárias para o valor atual
            qtd_moedas[i] += 1

    # Retornar a lista de quantidade de moedas necessárias
    return qtd_moedas

'''
  Para usar essa função, basta passar uma lista com os valores das moedas disponíveis 
  e o valor do troco que precisa ser dado como parâmetros. O resultado será uma lista 
  com a quantidade de cada moeda necessária para dar o troco desejado. Por exemplo:
  
  valores = [1, 5, 10, 25]
  troco = 67

  qtd_moedas = troco(valores, troco)
  print(qtd_moedas) # [17, 1, 1, 2]

'''
