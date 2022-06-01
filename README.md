# 5gflix - Engenharia de Dados

O principal objetivo desse trabalho é fornecer uma solução para a equipe de B.I que irá realizar um estudo do mercado das suas principais concorrentes:
Amazon e Netflix.
O projeto apresenta todo o fluxo de ETL realizando na estrutura GCP, onde utilizamos ferramentas como o Dataproc para processamento ,Dataflow para fluxos 
trabalhos e Bigquery como nosso Datawarehouse.

<p align=center>
  <img src="https://github.com/guisantos13/5gflix/blob/main/workflow/Infra.png" height=400/>
  </p>
<p align=center>


Os dados para este trabalho foram disponibilizados publicamente através dos endereços abaixo :
- Netflix - https://www.kaggle.com/netflix-inc/netflix-prize-data
- Amazon -  https://s3.amazonaws.com/amazon-reviews-pds/readme.html

## Extração :
Para realizar a extração dos dados foi realizado um scrap que pode ser consultado [aqui](https://github.com/guisantos13/5gflix/blob/main/extra%C3%A7%C3%A3o/Scrap_dataproc.ipynb)
Os dados foram extraidos e armazenados em um datalake no cloud storage.

## Tratamento : 
O processamento dos dados foi realizado em um cluster SPARK no google Dataproc , todo o tratamento foi realizado com [Pyspark](https://github.com/guisantos13/5gflix/blob/main/transforma%C3%A7%C3%A3o_carregamento/Transforma%C3%A7%C3%A3o.ipynb).
alguns dos tratamentos foram:
- Exclusão de colunas irrelevantes
- Tratamento da coluna de títulos, removendo espaços,caracters inválidos.
- Junção dos datasets
- Transformação para o formato Parket, o que aumentou notavelmente o poder de processamento dos dados.

<p align=center>
  <img src="https://github.com/guisantos13/5gflix/blob/main/workflow/5gflix_diagrama_logico.png" height=600/>
  </p>
<p align=center>
  
 ## Carregamento :
  Os dados tratados foram disponibilizados para o time de B.I no [Bigquery](https://github.com/guisantos13/5gflix/tree/main/arquivos_finais_parquet)
  
 ## Insights : 
 Ao final do trabalhos foram [respondidas](https://github.com/guisantos13/5gflix/tree/main/insights) as perguntas iniciais : 
- Quantos filmes estão disponíveis na Amazon?
- Quantos filmes estão disponíveis na Netflix?
- Dos filmes disponíveis na Amazon, quantos % estão disponíveis na Netflix?
- O quão perto a médias das notas dos filmes disponíveis na Amazon está dos filmes
disponíveis na Netflix?
- Qual ano de lançamento possui mais filmes na Amazon?
- Qual ano de lançamento possui mais filmes na Netflix?
- Quais filmes que não estão disponíveis no catálogo da Netflix foram melhor avaliados
(notas 4 e 5)?
- Quais filmes que não estão disponíveis no catálogo da Amazon foram melhor avaliados
(notas 4 e 5)?
  
  As consultas realizadas foram disponibilizadas neste [repositório](https://github.com/guisantos13/5gflix/tree/main/sql-bigquery).
  
  Por fim os [custos](https://github.com/guisantos13/5gflix/blob/main/Relat%C3%B3rios%20%E2%80%93%20Faturamento%20%E2%80%93%205gflix%20%E2%80%93%20Google%20Cloud%20Platform.pdf) de infra para desenvolver toda a solução.
  
  ## Data - Visualization
  
  Dashboard [Data-Studio](https://datastudio.google.com/s/iqTN61tNV7c) 
  
  <div style="display: inline_block">
  <img align="center" alt="Data-studio" height="600" width="800" src=""https://github.com/guisantos13/5gflix/blob/main/Dashboard-5gflix-1.png">
  </div>
  <div style="display: inline_block">
  <img align="center" alt="Data-studio" height="600" width="800" src=""https://github.com/guisantos13/5gflix/blob/main/Dashboard-5gflix-2.png">
  </div>

