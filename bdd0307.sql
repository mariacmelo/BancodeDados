create database google_classroom;

create table aluno(
	aluno_id serial,
	nome varchar(40),
	idade varchar(3),
	cpf char(11)
);

create table professor(
	professor_id serial,
	materia_id int,
	nome_completo varchar(40),
	cpf char(11),
	email varchar(60)
);

create table usuario(
	usuario_id serial,
	nome_completo varchar(40),
	senha char(8),
	email varchar(60)
);

create table sala_de_aula(
	sala_de_aula_id serial,
	descricao text,
	quantidade_alunos varchar(40),
	codigo_convite char(9),
	professor_id int
);

create table atividade(
	atividade_id serial,
	sala_de_aula_id int,
	titulo varchar(30),
	descricao text,
	data_criacao timestamp,
	data_entrega timestamp
);

create table materia(
	materia_id serial,
	nome_materia varchar(15),
	professor_id int,
	atividade_id int
);


alter table aluno add primary key (aluno_id);
alter table professor add primary key (professor_id);
alter table usuario add primary key (usuario_id);
alter table sala_de_aula add primary key (sala_de_aula_id);
alter table atividade add primary key (atividade_id);
alter table materia add primary key (materia_id);

alter table materia 
add constraint professor_id
foreign key (professor_id)
references professor (professor_id);

alter table sala_de_aula 
add constraint professor_id
foreign key (professor_id)
references professor (professor_id);

alter table atividade 
add constraint sala_de_aula_id
foreign key (sala_de_aula_id)
references sala_de_aula  (sala_de_aula_id);

alter table materia 
add constraint atividade_id
foreign key (atividade_id)
references atividade (atividade_id);

