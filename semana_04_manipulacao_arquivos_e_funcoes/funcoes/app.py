def media(x, y=10): # passei manual, mas ele ignora
  soma = x + y
  media = soma / 2
  return(media) # print nao tem retorno, nao consigo salvar em variavel


# MANUAL
# media1 = media(10)
# media2 = media(20,35)
# media3 = media(6,8)

# print(media1)
# print(media2)
# print(media3)

# COM DADOS DO USUARIO
# nota1 = float(input("Nota 1: "))
# nota2 = float(input("Nota 2: "))

# media_input = media(nota1, nota2)
# print(media_input)



# cria a funcao, definindo o que voce quer receber e o processamento
def dizer_oi(nome_pessoa=""):
    mensagem = f"Oi, {nome_pessoa}"
    
    print(mensagem)
    return mensagem

# pedi dados externos
# nome = input()

# chamei a funcao (que ja ta definida e eu ja tenho os daods)
# dizer_oi(nome_pessoa="BDHBSHJ")



