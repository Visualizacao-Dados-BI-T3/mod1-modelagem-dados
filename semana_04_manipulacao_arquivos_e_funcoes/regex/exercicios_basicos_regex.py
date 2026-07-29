import re

# . qualquer coisa
# re.I ou re.IGNORECASE vai ignorar case sensitive = diferenciar maiusculos de minusculos

texto = "Joao e joao e joão e JOÃO ama ler hqs"

padrao = r"jo[ãa]o" # [] representam 1 letra
matches = re.findall(padrao, texto, flags=re.IGNORECASE)

# print(len(matches))
# print(matches)

print(re.sub(padrao, "João", texto, flags=re.IGNORECASE))



string = "A história do PLN começou na década de 1950, quando Alan Turing publicou o artigo Computing Machinery and Intelligence, que propunha o que agora é chamado de teste de Turing como critério de inteligência. Em 1954, a experiência de Georgetown envolveu a tradução automática de mais de sessenta frases russas para o inglês. Os autores afirmaram que dentro de três ou cinco anos a tradução automática seria um problema resolvido.[2] No entanto, os avanços reais foram muito mais lentos do que o previsto e, após o relatório ALPAC em 1966-2, que constatou que a pesquisa de dez anos não conseguiu satisfazer as expectativas, o financiamento para este estudo em tradução automática foi reduzido drasticamente. Poucas pesquisas em tradução automática foram conduzidas até o final dos anos 80, quando os primeiros sistemas estatísticos de tradução foram desenvolvidos."

resultado = re.search(r'(\d+)-(\d)', string)

print(f"{resultado.group(2)}/{resultado.group(1)}")

