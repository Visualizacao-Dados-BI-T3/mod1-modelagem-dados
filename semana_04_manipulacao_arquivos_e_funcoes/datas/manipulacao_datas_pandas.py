import pandas

datas = ['2026-07-22','2026-07-23']
vendas = [10,20]

df = pandas.DataFrame(
    {"Data": datas,
     "Vendas": vendas 
     })

print(df.info()) # Data era str


df["Data"] = pandas.to_datetime(df["Data"])
print(df.info())