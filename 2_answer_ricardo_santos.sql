-- Seleciona o nome e sobrenome do ator e a contagem de aparições em filmes
SELECT a.first_name || ' ' || a.last_name AS actor_name, COUNT(*) AS count

-- Junta a tabela actor com a tabela film_actor para obter informações dos filmes em que cada ator aparece
FROM actor a
JOIN film_actor fa ON fa.actor_id = a.actor_id

-- Cria uma subconsulta que seleciona os 16 filmes mais alugados
JOIN (
  SELECT i.film_id, COUNT(*) AS count
  FROM inventory i
  JOIN rental r ON r.inventory_id = i.inventory_id
  GROUP BY i.film_id
  ORDER BY count DESC
  LIMIT 16
) AS top_films ON top_films.film_id = fa.film_id

-- Agrupa o resultado por ator
GROUP BY a.actor_id

-- Classifica o resultado por contagem decrescente
ORDER BY count DESC

-- Limita o resultado a uma única linha, que é o ator que aparece em mais filmes alugados
LIMIT 1;


/*Para responder a segunda pergunta, que queria saber o nome completo do ator mais presente entre os top 16 filmes mais alugados, eu comecei selecionando o nome e sobrenome do ator e a contagem de aparições em filmes.

Depois, juntei a tabela "actor" com a tabela "film_actor" para obter informações dos filmes em que cada ator aparece. Em seguida, criei uma subconsulta que selecionava os 16 filmes mais alugados, usando as tabelas "inventory" e "rental".

Em seguida, juntei essa subconsulta com a junção anterior usando o campo "film_id" e agrupei o resultado por ator. Classifiquei o resultado por contagem decrescente e limitei o resultado a uma única linha, que é o ator que aparece em mais filmes alugados. O resultado final foi o nome completo desse ator.*/
