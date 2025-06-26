---seleciona todos os registros da tabela filme
select * from film;

---conta quantos filmes existem na tabela filme
select count(*) from film;

select * from film f where f.title like 'G%';---quando usamos o like, temos três opções:
---'G%' quando começa com G
---'%a' qualque um que termina com a
---'%e%' qualquer um que tem e em qualquer lugar do titulo.

select * from film f where f.description like '%a';---selecionar os filmes que a descrição termina com a.

select * from film f where f.title like '%j%';---selecionar os filmes que o titulo te j em qualquer lugar(que não é o primeiro nem o último).

select * from film f where f.film_id= 561;---seleciona o filme com o id 561.

---listar o nome de todos os atores que aparecem no filme de id 561
select * from film f
inner join film_actor fa on fa.film_id= f.film_id--- 'inner join' e o 'on' é para fazer uma junção entre as tabelas
inner join actor a on fa.actor_id = a.actor_id
where f.film_id = 561;---where é para mostrar onde é para ele procurar.

---mostrar apenas o primeiro e ultimo nome dos atores
select a.first_name, a.last_name from film f
inner join film_actor fa on fa.film_id= f.film_id
inner join actor a on fa.actor_id= a.actor_id 
where f.film_id= 561;



