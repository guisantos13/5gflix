
  1- Quantidade de filmes por plataforma
  CREATE OR REPLACE TABLE `gflix-131313.5glix_insights.qnt_filmes` AS (
  SELECT company, COUNT(title) AS qnt_filmes
  FROM `gflix-131313.5gflix.5gflix-big`
  GROUP BY company )

  2 - Dos filmes disponíveis na Amazon, quantos % estão disponíveis na Netflix?
  # 13196/394541*100 = 3,34%
  CREATE OR REPLACE TABLE `gflix-131313.5glix_insights.percent_filmes` AS (
  SELECT COUNT(*) AS qnt_netflix_amazon
  FROM (SELECT * FROM `gflix-131313.5gflix.net_movies`) AS netflix
  INNER JOIN `gflix-131313.5gflix.amazon_movies` AS amazon
  ON netflix.title = amazon.title )

  3 - O quão perto a médias das notas dos filmes disponíveis na Amazon está dos filmes disponíveis na Netflix?
  # netflix 2.06
  # amazon 4.08
  # A média de avaliações da Amazon é quase o dobro que a Netflix.  
  SELECT company, ROUND(AVG(rating),2) AS media_geral
  FROM `gflix-131313.5gflix.5gflix-big`
  GROUP BY company
 
  4 - Qual ano de lançamento possui mais filmes?
  # 2015 amazon 137359
  # 2004 netflix 5096
  CREATE OR REPLACE TABLE `gflix-131313.5glix_insights.lanc_anual` AS(
  SELECT launch,company,COUNT(title)AS lanc_movie
  FROM `gflix-131313.5gflix.5gflix-big` GROUP BY company,launch
  ORDER BY lanc_movie DESC)

  5 - Quais filmes que não estão disponíveis no catálogo da Netflix foram melhor avaliados (notas 4 e 5)?
  CREATE OR REPLACE TABLE `gflix-131313.5glix_insights.melhores_amazon`AS(
  SELECT amazon.title, amazon.rating
  FROM ( SELECT * FROM `gflix-131313.5gflix.5gflix-big`
  WHERE company = 'amazon') AS amazon
  LEFT JOIN ( SELECT * FROM `gflix-131313.5gflix.5gflix-big`
  WHERE company = 'netflix') AS netflix
  ON amazon.title = netflix.title WHERE mazon.rating >=4
  AND netflix.title IS NULL ORDER BY rating DESC)

  6 - Quais filmes que não estão disponíveis no catálogo da Amazon foram melhor avaliados (notas 4 e 5)?
  # Todos os filmes avaliados com notas acima de 4 na netflix estão presentes no catálogo na amazon
  SELECT amazon.title,amazon.rating
  FROM ( SELECT * FROM `gflix-131313.5gflix.5gflix-big`
  WHERE company = 'amazon') AS amazon
  LEFT JOIN (SELECT * FROM `gflix-131313.5gflix.5gflix-big`
  WHERE company = 'netflix') AS netflix
  ON amazon.title = netflix.title
  WHERE netflix.rating >=4 AND amazon.title IS NULL
  ORDER BY rating DESC



