import pandas as pd

# Matriz (linhas e colunas)
lista = [
    ["Produto", "Preco"],
    ["Notebook", 1520],
    ["Celular", 15555]
]

# Criando o DataFrame a partir da matriz
df = pd.DataFrame(lista, columns=["Produto", "Preco"])

print(df)