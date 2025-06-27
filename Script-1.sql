--- exercício Senai 27/06
--1) Quantos filmes há em português?
select
	count(*)
from
	film f
inner join "language" l on
	f.language_id = l.language_id
where
	l."name" = 'português';

--2) quantos clientes alugaram o filme de id= 7?
select
	count(*)
from
	customer c
inner join rental r on
	c.customer_id = r.customer_id
inner join inventory i on
	r.inventory_id = i.inventory_id
inner join film f on
	i.film_id = f.film_id
where
	i.film_id = 7;

--3) Quantos aluguguéis foram feitos no total?
select
	count(*)
from
	rental;

--4) qual foi o custo do filme de id= 600?
select
	f.replacement_cost
from
	film f
where
	film_id = 600;

--5) qual funcionario alugou mais filmes?
select
	s.first_name,
	s.last_name,
	count(r.rental_id)
from
	staff s
inner join rental r on
	s.staff_id = r.staff_id
group by
	s.first_name,
	s.last_name
order by
	count(r.rental_id) desc
limit 1;


--6)quantos funcionarios tem em cada loja?
select
	a.address_id,
	count(*)
from
	staff s
inner join store st on
	s.store_id = st.store_id
inner join address a on
	a.address_id = st.address_id
group by
	a.address_id; 

--7) liste as seguintes colunas titulo do filme,idioma, custo, data do ultimo aluguel,
-- nome do cliente do ultimo aluguel,funcionario que alugou, loja do aluguel e preço do aluguel.


--8)quantos atores que participaram do filme de id =1?
select
	count(*)
from
	film_actor fa
where
	fa.film_id = 1
group by
	fa.actor_id;


