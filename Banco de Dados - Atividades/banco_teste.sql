create database banco_teste;
use banco_teste;
create table cad_funcionario(
nome varchar(50),
cpf varchar(15)unique,
data_nasc date,
 funcao varchar(20),
 primary key(cpf));
 select * from cad_funcionario;