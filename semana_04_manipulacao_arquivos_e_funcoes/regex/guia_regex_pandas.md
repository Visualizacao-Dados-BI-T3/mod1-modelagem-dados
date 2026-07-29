# Guia Definitivo de Expressões Regulares (Regex) e Pandas

Este guia serve como uma referência rápida para o uso de Expressões Regulares (Regex) em Python puro e na manipulação de dados com Pandas.

---

## 1. Quantificadores

Os quantificadores definem a frequência com que um caractere ou grupo deve se repetir no texto.

| Símbolo | Significado | Exemplo de Regex | O que encontra em "casa"? |
| :---: | :--- | :--- | :--- |
| **`?`** | **0 ou 1** vez (opcional) | `casas?` | Encontra "casa" e "casa**s**" |
| **`+`** | **1 ou mais** vezes (obrigatório pelo menos um) | `a+` | Encontra "a", "aa", "aaa", etc. |
| **`*`** | **0 ou mais** vezes (opcional múltiplo) | `a*` | Encontra "", "a", "aa", etc. |
| **`{n,m}`** | De **n** até **m** vezes | `a{2,4}` | Encontra "aa", "aaa" e "aaaa" |

---

## 2. Metacaracteres, Atalhos e Negações

A diferença entre as letras **minúsculas** e **maiúsculas** nos atalhos é direta:
* **Minúscula:** Afirmação (procura o elemento).
* **Maiúscula:** Negação (procura tudo, **EXCETO** o elemento).

| Atalho | Significado | Equivalente | O que busca no texto? |
| :---: | :--- | :--- | :--- |
| **`\d`** | Digit (Dígito) | `[0-9]` | Apenas números de 0 a 9 |
| **`\D`** | **Not** digit | `[^0-9]` | Tudo que **NÃO** é número |
| **`\w`** | Word (Palavra) | `[a-zA-Z0-9_]` | Letras, números e underline |
| **`\W`** | **Not** word | `[^a-zA-Z0-9_]` | Símbolos, pontuações e espaços |
| **`\s`** | Space (Espaço) | `[ \t\n\r]` | Espaços, tabulações e quebras de linha |
| **`\S`** | **Not** space | `[^ \t\n\r]` | Tudo que **NÃO** é espaço |
| **`\b`** | Boundary (Borda) | — | Início ou fim de uma palavra |
| **`\B`** | **Not** boundary | — | Meio de uma palavra (não-fronteira) |
| **`^`** | Início da linha | — | Primeiros caracteres da linha/texto |
| **`$`** | Fim da linha | — | Últimos caracteres da linha/texto |
| **`.`** | Qualquer caractere | — | Qualquer caractere (exceto `\n`) |

---

## 3. Conjuntos (Classes de Caracteres) `[...]`

Definidos por **colchetes `[]`**, os conjuntos buscam **qualquer UM** dos caracteres presentes dentro deles.

### Comportamento dos Caracteres em Conjuntos vs. Fora

| Caractere | Fora do Conjunto `[...]` | Dentro do Conjunto `[...]` |
| :---: | :--- | :--- |
| **`.`** | Qualquer caractere | Ponto literal |
| **`*`** | Quantificador (0 ou mais) | Asterisco literal |
| **`?`** | Quantificador (0 ou 1) | Interrogação literal |
| **`+`** | Quantificador (1 ou mais) | Sinal de mais literal |
| **`^`** | Início de linha | Negação (se estiver no começo: `[^...]`) |
| **`$`** | Fim de linha | Cifrão literal |
| **`-`** | Hífen literal | Intervalo (ex: `a-z`) |
| **`()`** | Grupo de captura | Parênteses literais |

---

## 4. Grupos `(...)` e Métodos de Acesso

Grupos unem caracteres em blocos de captura, aplicam repetições em sequências e isolam trechos específicos.

| Sintaxe | Tipo de Grupo | Descrição |
| :--- | :--- | :--- |
| `(texto)` | **Grupo de Captura** | Agrupa e salva a correspondência na memória. |
| `(?:texto)` | **Grupo de Não-Captura** | Agrupa para aplicar quantificadores sem salvar o valor. |
| `(?P<nome>texto)` | **Grupo Nomeado** | Atribui um nome ao grupo para fácil recuperação. |

### Métodos de Acesso aos Grupos no Python (Objeto `Match`)

Quando o método `re.search()` ou `re.finditer()` encontra uma correspondência, ele retorna um objeto `Match`. Acessamos o conteúdo capturado através do método **`.group()`**:

#### 1. Acesso Por Número (Índice Posicional)

Os grupos de captura simples `()` são numerados a partir do **1** (da esquerda para a direita). O índice **0** sempre representa a correspondência completa.

```python
import re

texto = "Reunião em 15/08/2026"
match = re.search(r"(\d{2})/(\d{2})/(\d{4})", texto)

if match:
    print(match.group(0))  # '15/08/2026' -> O texto completo capturado
    print(match.group(1))  # '15'         -> Primeiro grupo (Dia)
    print(match.group(2))  # '08'         -> Segundo grupo (Mês)
    print(match.group(3))  # '2026'       -> Terceiro grupo (Ano)
```

#### 2. Acesso Por Grupos Nomeados `(?P<nome>)`

Permite usar nomes descritivos em vez de índices numéricos, acessando os dados pelo nome do grupo ou via dicionário com `.groupdict()`.

```python
import re

texto = "Contato: suporte@empresa.com"
padrao = r"(?P<usuario>[\w.-]+)@(?P<dominio>[\w.-]+)"
match = re.search(padrao, texto)

if match:
    print(match.group("usuario"))  # 'suporte'
    print(match.group("dominio"))  # 'empresa.com'
    print(match.groupdict())  # {'usuario': 'suporte', 'dominio': 'empresa.com'}
```

#### 3. Grupo de Não-Captura `(?:)`

Usado quando você precisa agrupar opções com `|` ou aplicar quantificadores, mas não deseja que o valor seja salvo na memória do `.group()` nem vire uma coluna no Pandas `.str.extract()`.

```python
import re

texto = "https://meusite.com"
# Ignora a captura do protocolo 'https://' ou 'http://', capturando apenas o domínio
match = re.search(r"(?:https?://)(\w+\.\w+)", texto)

if match:
    print(match.group(1))  # 'meusite.com' (O protocolo não vira grupo 1)
```

---

## 5. Métodos da Biblioteca Nativa do Python (`re`)

| Método | Retorno | Melhor Caso de Uso |
| :--- | :--- | :--- |
| `re.search()` | Objeto Match (ou `None`) | Quer encontrar a primeira ocorrência no texto. |
| `re.findall()` | Lista de strings | Quer extrair todas as ocorrências do texto. |
| `re.sub()` | Nova string | Quer substituir ou limpar partes do texto. |
| `re.match()` | Objeto Match (ou `None`) | Quer testar se o texto começa com o padrão. |
| `re.split()` | Lista de strings | Quer dividir o texto usando divisores complexos. |
| `re.finditer()` | Iterador de Match | Busca todas as ocorrências trazendo a posição (span). |
| `re.compile()` | Objeto Pattern | Quer reutilizar a mesma regra para melhor performance. |

---

## 6. Métodos de Texto no Pandas (`.str`)

No Pandas, para aplicar métodos de string e Regex em uma Series, é obrigatório usar o acessador `.str` como ponte.

| Método no Pandas | Descrição | Exemplo de Uso |
| :--- | :--- | :--- |
| `.str.contains(pat)` | Verifica a existência do padrão (Retorna True/False) | `df['col'].str.contains(r'cadeira', case=False)` |
| `.str.extract(pat)` | Extrai os grupos `()` para novas colunas | `df['col'].str.extract(r'(\d{2})/(\d{2})')` |
| `.str.replace(pat, repl)` | Substitui padrões Regex por outro texto (`regex=True`) | `df['col'].str.replace(r'\D', '', regex=True)` |
| `.str.findall(pat)` | Retorna uma lista com todas as ocorrências na célula | `df['col'].str.findall(r'\b\w+s\b')` |

---

## 7. Macetes e Pegadinhas Frequentes

### A) Erro de Importação Circular

Nunca salve seu arquivo Python com o nome de `re.py`. O Python importará o seu arquivo local em vez da biblioteca oficial de expressões regulares, gerando o erro:

```
AttributeError: partially initialized module 're' has no attribute...
```

### B) Concatenação Sem Quebra de Linha

Strings divididas com barra invertida `\` no Python viram uma única linha contínua. Para que a flag `re.MULTILINE` funcione corretamente com `^` e `$`, use aspas triplas (`"""` ou `'''`).

```python
# Errado (vira uma linha só):
poema = "linha 1" \
        "linha 2"

# Correto (preserva as quebras de linha reais \n):
poema = """linha 1
linha 2"""
```

### C) Múltiplas Flags no `re.compile`

Para combinar flags no `re.compile`, utilize o operador pipe `|`:

```python
padrao = re.compile(r"^eu", re.MULTILINE | re.IGNORECASE)
```

### D) O "Gulosinho" `.*` vs. Freio de Mão `\w`

O `.*` consome tudo na linha até o último caractere válido (comportamento *greedy*). Para restringir a busca a uma única palavra sem engolir espaços e pontuações, prefira `\w+` ou `\w*`.

### E) Limpeza de Números Decimais com Vírgula no Pandas

Antes de converter colunas com vírgula para número (float), substitua a vírgula por ponto:

```python
df["Preco"] = df["Preco"].str.replace(",", ".").astype(float)
```
