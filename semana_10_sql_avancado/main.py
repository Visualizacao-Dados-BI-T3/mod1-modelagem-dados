import sqlite3
con = sqlite3.connect("teste.db") # criar o arquivo .db

cur = con.cursor() # criando um cursor onde vao rodar queries

# DDL - DATA DEFINITION LANGUAGE (CREATE, ALTER, DROP)
cur.execute("CREATE TABLE if not exists funcionarios(id_funcionario , nome_funcionario, cidade,estado,telefone)") # criacao de nova table

# DML - DATA MANIPULATION LANGUAGE (INSERT, UPDATE, DELETE)

cur.execute("INSERT INTO funcionarios VALUES(1, 'Ana', 'Teresina', 'PI', '86000000000')") # inserir uma linha na tabela

con.commit()

# Fecha a conexão após terminar
con.close()