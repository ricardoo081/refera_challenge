-- Seleciona o mês em que cada cliente iniciou seus aluguéis e conta quantos clientes novos foram adquiridos nesse mês
SELECT 
    DATE_TRUNC('month', MIN(r.rental_date)) AS "mês_entrada_cliente", -- extrai o primeiro dia do mês em que cada cliente fez seu primeiro aluguel e renomeia a coluna como "mês_entrada_cliente"
    
    COUNT(DISTINCT r.customer_id) AS "quantidade_de_clientes" -- conta quantos clientes distintos alugaram filmes nesse mês e renomeia a coluna como "quantidade_de_clientes"
    
-- Seleciona as tabelas "rental" e "customer", usando seus campos relacionais
FROM 
    rental r 
    JOIN customer c ON r.customer_id = c.customer_id
    
-- Agrupa os resultados pelo mês de entrada do cliente
GROUP BY 
    DATE_TRUNC('month', r.rental_date)
    
-- Ordena os resultados em ordem crescente do mês de entrada
ORDER BY 
    "mês_entrada_cliente" ASC
	
LIMIT 3;


/* Para responder à terceira pergunta, eu comecei selecionando a data de início de cada cliente, que é considerada como a data do primeiro filme que o cliente alugou. 

Depois disso, eu contei quantos clientes novos foram adquiridos em cada mês, agrupando os resultados pelo mês de entrada do cliente. Eu usei as tabelas "rental" e "customer", juntando-as pelo campo relacionado "customer_id". 

Por fim, ordenei os resultados em ordem crescente do mês de entrada e limitei a saída para três linhas. A saída esperada tem duas colunas, "mês_entrada_cliente" e "quantidade_de_clientes", e três linhas.*/
