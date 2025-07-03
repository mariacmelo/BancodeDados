--- exercício Senai 27/06
--1) Quantos filmes há em português?
select
	count(*)                          --toda vez que for quantidade
from
	film f
inner join "language" l on            --o inner join é porque o nome da linguagem não está na tabela filme
	f.language_id = l.language_id     --relaçaõ entre as tabelas
where
	l."name" = 'português';           --ela quer contar onde o nome da linguagem é português

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
	count(*) as "quantidade de aluguéis"
from
	rental;

--4) qual foi o custo do filme de id= 600?
select
    f.title as "título do filme", ---para saber o titulo do filme tambem
	f.replacement_cost as "Custo de reposição"
from
	film f
where
	film_id = 600;

--5) qual funcionario alugou mais filmes?
select
	s.first_name,--nome e sobrenome do funcionario
	s.last_name,
	count(r.rental_id) --contar os alugueis
from
	staff s
inner join rental r on
	s.staff_id = r.staff_id
group by  --concentrar os alugueis(entrarão tudo que estiver no select)
	s.first_name,
	s.last_name
order by
	count(r.rental_id) desc --ordenando pelo funcionario que fez mais alugueis
limit 1;                    --para aparecer só um funcionario


--6)quantos funcionarios tem em cada loja?
select
	a.address_id,--- trazer endereço  da loja
	count(*)  -- para a tabela de funcionarios
from
	staff s
inner join store st on
	s.store_id = st.store_id
inner join address a on
	a.address_id = st.address_id
group by              ---aparecer a loja uma unica vez
	a.address_id; 

--7) liste as seguintes colunas titulo do filme,idioma, custo, data do ultimo aluguel,
-- nome do cliente do ultimo aluguel,funcionario que alugou, loja do aluguel e preço do aluguel.
select
	f.title as "titulo do filme",
	l."name" as "idioma",
	f.replacement_cost as " custo de reposição",
	r.rental_date,
	c.first_name as "nome do cliente",
	s.first_name as " nome do funcionario",
	st.store_id as "id da loja",
	f.rental_rate as "valor do aluguel"
from
	film f
inner join "language" l on
	l.language_id = f.language_id
inner join inventory i on
	i.film_id = f.film_id
inner join rental r on
	i.inventory_id = r.inventory_id
inner join customer c on
	c.customer_id = r.customer_id
inner join staff s on
	s.staff_id = r.staff_id
inner join store st on
	s.store_id = st.store_id
order by
	f.rental_rate desc
limit 1 ;


--8)quantos atores que participaram do filme de id =1?
select
	count(*)
from
	film_actor fa
where
	fa.film_id = 1
group by
	fa.actor_id;

--9)qual loja possui mais inventarios?
select
	st.store_id as "Id da loja",
	count(i.inventory_id) as "quantidade no inventario"
from
	store st
inner join staff s on
	s.store_id = st.store_id
inner join rental r on
	r.staff_id = s.staff_id
inner join inventory i on
	i.inventory_id = r.inventory_id
group by
	st.store_id
order by
	count(i.inventory_id) desc
limit 1;--ordenando pela quantidade do inventario
