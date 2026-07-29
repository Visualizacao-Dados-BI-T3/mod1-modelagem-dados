"""# Escrita

arquivo = open("teste.txt", "w") # a - append e adiciona no final

arquivo.write('Testando o barra n')

arquivo.close()
"""

# Ler 

"""arquivo_leitura = open('teste.txt', 'r')

texto = arquivo_leitura.read()
print(texto)

arquivo_leitura.close()
with open('/home/cibelle/curso-dataviz-bi/teste.txt', 'r') as arquivo_teste:
    texto_completo = arquivo_teste.read()
    print(texto_completo)
    """
    
lista_texto = ["Cibelle", "Ana", "João", "Renato"]

"""with open('/home/cibelle/curso-dataviz-bi/teste_lista.txt', 'w') as arquivo_teste:
    arquivo_teste.writelines(lista_texto)
    """

with open('/home/cibelle/curso-dataviz-bi/teste_lista.txt', 'r') as arquivo_teste:
    print(arquivo_teste.readlines())
