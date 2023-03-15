SELECT 
    f.title AS "Título do Filme", -- seleciona o título do filme da tabela "film" e renomeia a coluna como "Título do Filme"
    COUNT(*) AS "Quantidade" -- conta o número de registros na tabela "rental" e renomeia a coluna como "Quantidade"

-- Junta as tabelas "rental", "inventory" e "film" usando seus campos relacionais
FROM 
    rental r 
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id

-- Agrupa os resultados por título do filme
GROUP BY 
    f.title

-- Ordena os resultados em ordem decrescente de quantidade de aluguéis
ORDER BY 
    COUNT(*) DESC

-- Limita a busca a 2 resultados (ou seja, os dois filmes mais populares)
LIMIT 2;


/*Então, para responder a primeira pergunta, o objetivo era encontrar os dois filmes mais alugados de todos os tempos. 

Primeiro, foram selecionadas as colunas "title" da tabela "film" e o número de registros da tabela "rental", que foi renomeado como "Título do Filme" e "Quantidade", respectivamente. Depois disso, as tabelas "rental", "inventory" e "film" foram combinadas usando seus campos relacionais. 

Em seguida, os resultados foram agrupados pelo título do filme e ordenados em ordem decrescente de quantidade de aluguéis. Finalmente, a busca foi limitada a 2 resultados, ou seja, os dois filmes mais populares.*/
