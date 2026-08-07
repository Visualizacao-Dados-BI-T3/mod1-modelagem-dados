# 📊 Curso Dataviz e BI - Módulo 1: Modelagem de Dados

Este repositório contém meus materiais de estudo, anotações e exercícios práticos desenvolvidos durante o primeiro módulo do curso de Visualização de Dados e Business Intelligence.

O objetivo principal deste módulo foi estabelecer uma base sólida em programação, manipulação de dados e versionamento de código, ferramentas essenciais para a área de dados.

## 🗂️ Estrutura do Repositório

O conteúdo está organizado cronologicamente pelas semanas do curso:

### [📁 Semana 02: Lógica de Programação com Python](./semana_02_logica_de_programacao)
- Introdução e utilização do Google Colab.
- Tipos de dados, variáveis e lógica booleana.
- Operadores (aritméticos, lógicos e relacionais).
- Estruturas de controle de fluxo: condicionais (`if`, `elif`, `else`) e repetição (`for`, `while`).

### [📁 Semana 03: Versionamento com GitHub e Iniciando com Python](./semana_03_versionamento_e_python)
- Conceitos de Git e GitHub (branchs, GitFlow).
- Configuração de ambiente local (VS Code, Git Bash, GitHub Desktop).
- Sintaxe básica do Python.
- Estruturas de dados nativas: Listas, Tuplas e Dicionários.

### [📁 Semana 04: Manipulação de Dados e Modularização](./semana_04_manipulacao_arquivos_e_funcoes)
- Criação e uso de funções (`def`, `lambda`, parâmetros e retorno).
- Importação e criação de módulos.
- Leitura e gravação de arquivos (TXT, CSV, JSON, Excel).
- Manipulação de datas com o módulo `datetime`.
- Limpeza de dados básica usando expressões regulares (Regex).

### [📁 Semana 05: Introdução ao Pandas e Numpy](./semana_05_pandas_e_numpy)
- Computação numérica com arrays do NumPy (operações vetorizadas e broadcasting).
- Estruturas de dados do Pandas: `Series` e `DataFrames`.
- Filtros, seleções e leitura de dados de múltiplas fontes.
- Operações de agrupamento e combinação de dados (`groupby`, `merge`, `pivot`).

### [📁 Semana 06: Limpeza e Transformação de Dados](./semana_06_limpeza_e_transformacao)
- **Limpeza de Dados (`teoria_limpeza_de_dados.ipynb` e `atividade_limpeza_de_dados.ipynb`):**
  - Diagnóstico de qualidade de dados (tipos de dados, contagens de não-nulos, estatísticas descritivas e cardinalidade).
  - Tratamento de dados ausentes (`dropna`, imputação estatística simples com média/mediana/moda, imputação por grupo e em séries temporais).
  - Remoção de duplicatas (duplicatas exatas, duplicatas lógicas por chave de negócio e *fuzzy matching*).
  - Detecção e tratamento de outliers (análise visual com Boxplot e Scatter plot, limites IQR, Z-Score e Winsorização).
  - Padronização de formatos/categorias e normalização estatística (Min-Max Scaling, Z-Score manual/PyNative/Scikit-Learn).
- **Transformação de Dados (`teoria_transformacao_de_dados.ipynb` e `atividade_transformacao_de_dados.pdf`):**
  - Aplicação de funções em colunas e DataFrames (`.map()`, `.apply()`, `.applymap()` / `DataFrame.map()`).
  - Transformações condicionais e binning (`np.where()`, `np.select()`, `pd.cut()` para intervalos fixos e `pd.qcut()` para quantis).
  - Junção e concatenação de tabelas (`pd.concat()`, `pd.merge()` com *inner/left/right/outer* e `.join()` por índice).
  - Atividade prática de aplicação com dados reais do e-commerce Olist.

## 🛠️ Tecnologias Utilizadas
- **Linguagem:** Python 3
- **Ambientes:** Google Colab, VS Code
- **Bibliotecas principais:** Pandas, NumPy, Matplotlib, Seaborn, SciPy, Scikit-Learn, re, datetime
- **Versionamento:** Git e GitHub

---
*Repositório criado para fins de estudo e registro de progresso no curso de Dataviz e BI.*
