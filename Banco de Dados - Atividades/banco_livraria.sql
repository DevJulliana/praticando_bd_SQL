create database biblioteca

create table autores(
id int not null auto_increment,
cod_autor varchar(10),
nome varchar(255),
cpf varchar(15),
data_nasc date,
livros_public int,
data_public date,
primary key (id));

update autores set cod_autor= ('10')
	where id=1;

insert into autores 
	values('J.K. Rowling', '12345678910', '31.07.1965', 'Harry Potter', '26.07.1997');
