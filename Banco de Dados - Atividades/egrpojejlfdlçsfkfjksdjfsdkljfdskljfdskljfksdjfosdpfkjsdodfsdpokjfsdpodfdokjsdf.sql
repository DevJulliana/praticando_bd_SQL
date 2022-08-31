drop database if exists biblioteca;
create database biblioteca; 
use biblioteca;
create table autores(
id_autor int(11) not null auto_increment,
nome_autor varchar(255),
primary key (id_autor));

create table livro(
id_livro int not null auto_increment,
nome_livro varchar(255),
pais_livro varchar(150),
id_autor int(11) not null,
id_editora int not null,
primary key (id_livro));

create table editora(
id_editora int not null auto_increment,
nome_editora varchar(255),
primary key (id_editora));

alter table livro add constraint fk_autor
		foreign key(id_livro)
			references editora(id_editora)
				on delete no action 
                on update no action;

alter table livro add constraint fk_editora
		foreign key(id_editora)
			references editora(id_editora)
				on delete no action 
                on update no action; 
insert into autores(nome_autor)VALUES
('suzanne collins'),
('lisa williamson'),
('thich nhat hanh '),
('tony diterlizzi e holly black '),
('licia troisi'),
('brandon mull'),
('danielle paige ');
describe autores;
insert into editora(nome_editora)VALUES
('Rocco'),
('Saraiva');

SET FOREIGN_KEY_CHECKS=1;
insert into livro(nome_livro, pais_livro,id_autor, id_editora)VALUES
('A arte de ser normal','BRA',2,1),
('A Arte do Poder','BRA',3,1),
('A Árvore de Ferro','BRA',4,1),
('A Árvore de Idhunn','BRA',5,1),
('A Ascensão da Estrela Vespertina','BRA',6,1),
('A ascensão do mal','BRA',7,1);

select * from livro;

SELECT nome_livro,pais_livro,editora.nome_editora FROM livro INNER JOIN editora ON editora.id_editora = livro.id_editora;
SELECT livro.nome_livro FROM livro INNER JOIN editora ON editora.nome_editora = "Saraiva";
