from datetime import date, time, datetime, timedelta

# data - ano, mes, dia
data = date(2026, 7, 22)
#print(data)

# datetime - ano, mes, dia, min, segundos..
data_pc = datetime.now()
#print(data_pc)

# timedelta - diferenca entre datas e horas
duracoes = timedelta(1) # se passo apenas um numero, ele entende que é dia 

hora_inicio_intervalo = datetime(year=2026, month=7, day=22, minute=20, second=42) 
tempo_intervalo = timedelta(minutes=15)
hora_fim_intervalo = hora_inicio_intervalo + tempo_intervalo
# print(hora_fim_intervalo)


dia_ontem = data - timedelta(days=1)
# print(dia_ontem)

dia_2_semanas_atras = data - timedelta(weeks=2)
# print(dia_2_semanas_atras)


# datetime - juncao data + time
inicio_filme = datetime(2026, 7, 23, 21, 50)
duracao_filme = timedelta(hours=2, minutes=6)
hora_final_filme = inicio_filme + duracao_filme
# print(hora_final_filme)


data_exemplo = datetime(2026, 7, 22, 12, 0, 0)
result = data_exemplo.strftime("%d/%m/%Y, %H:%M")
print(result)
# "2026-01-01 12:00:00"


