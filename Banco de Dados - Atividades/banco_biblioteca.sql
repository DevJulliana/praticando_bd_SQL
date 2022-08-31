create database biblioteca; 
create table autores(
id_autor int not null auto_increment,
nome_autor varchar(255),
pseud_autor varchar(255),
data_nasc date,
pais_autor varchar (150),
id_livro int not null,
id_editora int not null,
primary key (id_autor));

create table livro(
id_livro int not null auto_increment,
nome_livro varchar(255),
pais_livro varchar(150),
id_autor int not null,
id_editora int not null,
data_lanca date,
data_chega date,
primary key (id_livro));

create table editora(
id_editora int not null auto_increment,
nome_editora varchar(255),
pais_editora varchar (150),
id_autor int not null,
id_livro int not null,
primary key (id_editora));


alter table autores add constraint fk_editora_livro
	foreign key(id_livro)
		references livro(id_livro)
			on delete no action 
			on update no action;
 
alter table autores add constraint fk_livro_editora
	foreign key(id_editora)
		references editora(id_editora)
			on delete no action
            on update no action;

alter table livro add constraint fk_editora_autores
		foreign key(id_autor)
			references autores(id_autor)
				on delete no action 
                on update no action;

alter table livro add constraint fk_autores_editora
		foreign key(id_editora)
			references editora(id_editora)
				on delete no action 
                on update no action; 
                
alter table editora add constraint fk_livro_autores
		foreign key(id_autor)
			references autores(id_autor)
				on delete no action
                on update no action;
                
alter table editora add constraint fk_autores_livro
		foreign key(id_livro)
			references livro(id_livro)
				on delete no action
                on update no action;
                
insert into livro(
nome_livro, pais_livro, id_autor, id_editora, data_lanca,
data_chega)
value('Jogos Vorazes','Estados Unidos', 'Suzanne Collins', 'Rocco', '2008-09-14', '2010-04-20'); 

