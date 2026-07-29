import pandas as pd

# 1. Leitura do arquivo Excel
df = pd.read_excel("vendas_brutas_clientes.xlsx")

print("--- DataFrame Bruto Original ---")
print(df.head())


# 2. Converter datas com pd.to_datetime()
# O 'dayfirst=True' ajuda a interpretar formatos do tipo DD/MM/AAAA corretamente
df['Data_Venda_Clean'] = pd.to_datetime(df['Data_Venda'], dayfirst=True)


# 3. Limpeza de Telefone com REGEX (str.replace)
# Remove parenteses, traços, pontos, espaços e código de país (+55) para manter apenas os dígitos do DDD + Número
df['Telefone_Limpo'] = (
    df['Telefone_Cliente']
    .astype(str)
    .str.replace(r'^\+55\s?', '', regex=True)  # Remove +55 do início
    .str.replace(r'[()\s.-]', '', regex=True) # Remove (, ), espaços, . e -
)


# 4. Extração do DDD e do Número com REGEX (str.extract)
# Pega os 2 primeiros dígitos como DDD e os restantes como Número
df[['DDD', 'Telefone_Num']] = df['Telefone_Limpo'].str.extract(r'^(\d{2})(\d{8,9})$')


# 5. Validação e Filtro de E-mails Válidos com REGEX (str.contains)
# Exige pelo menos 2 letras após o ponto final do domínio (evita e-mails terminados em .c ou .x)
padrao_email_valido = r'[\w.-]+@[\w.-]+\.[a-zA-Z]{2,}$'

# Cria uma coluna booleana indicando se o e-mail é válido
df['Email_Valido'] = df['Email_Cliente'].str.contains(padrao_email_valido, regex=True, na=False)


# 6. Filtragem de Vendas com E-mails Válidos e Vendedor Específico
vendas_carlos = df[
    (df['Email_Valido'] == True) & 
    (df['Nome_Vendedor'].str.contains('Carlos', regex=False))
]


# 7. Exibir Resultado Final Formatado
print("\n--- DataFrame Tratado e Filtrado ---")
cols_exibicao = [
    'ID_Venda', 'Data_Venda_Clean', 'Valor_Venda', 
    'Nome_Vendedor', 'Nome_Cliente', 'Email_Cliente', 
    'Email_Valido', 'DDD', 'Telefone_Num'
]
print(df[cols_exibicao])

print("\n--- Apenas Vendas Válidas do Vendedor 'Carlos' ---")
print(vendas_carlos[['ID_Venda', 'Data_Venda_Clean', 'Nome_Vendedor', 'Email_Cliente', 'Valor_Venda']])