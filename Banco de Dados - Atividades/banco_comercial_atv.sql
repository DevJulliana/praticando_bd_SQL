create database comercial;
create table comclien(
n_numeclien int not null auto_increment,
c_codiclien varchar(10),
c_nomeclien varchar(100),
c_razaclien varchar(100),
d_dataclien date,
c_cnpjclien varchar(20),
c_foneclien varchar(20),
primary key (n_numeclien));

create table comforne(
n_numeforne int not null auto_increment,
c_codiforne varchar(10),
c_nomeforne varchar(100),
c_razaforne varchar(100),
c_foneforne varchar(20),
primary key(n_numeforne));

create table comvende(
n_numevende int not null auto_increment,
c_codivende varchar(10),
c_nomevende varchar(100),
c_razavende varchar(100),
c_fonevende varchar(20),
n_porcvende float(10,2),
primary key (n_numevende));

create table comprodu(
n_numeprodu int not null auto_increment,
c_codiprodu varchar(10),
c_descprodu varchar(100),
n_valoprodu float(10,2),
c_situprodu varchar(1),
n_numefone int,
primary key (n_numeprodu));

create table comvenda(
n_numevenda int not null auto_increment,
c_codivenda varchar(10),
n_numeclien int not null,
n_numeforne int not null,
n_numevende int not null,
n_valovenda float (10,2),
n_descvenda float (10,2),
n_totavenda float (10,2),
d_datavenda date,
primary key (n_numevenda));
create table comvendas(
n_numevendas int not null auto_increment,
c_codivendas varchar(10),
n_numeclien int not null,
n_numeforne int not null,
n_numevende int not null,
n_valovendas float (10,2),
n_descvendas float (10,2),
n_totavendas float (10,2),
d_datavendas date,
primary key (n_numevendas));

create table comivenda(
n_numeivenda int not null auto_increment,
n_numevenda int not null,
n_numeprodu int not null,
n_valoivenda float (10,2),
n_qtdeivenda int,
n_descivenda float (10,2),
primary key(n_numeivenda));

alter table comvenda add constraint fk_comprodu_comforne
foreign key(n_numeforne)
references comforne(_numeforne)
on delete no action 
on update no action;

alter table comvenda add constraint fk_comprodu_comvende
foreign key(n_numevende)
references comvende(_numevende)
on delete no action 
on update no action;

alter table comvenda add constraint fk_comvenda_comclien
foreign key(n_numeclien)
references comclien(_numeclien)
on delete no action 
on update no action;

alter table comivenda add constraint fk_comivenda_comprodu
foreign key(n_numeprodu)
references comprodu(_numeprodu)
on delete no action 
on update no action;

alter table comivenda add constraint fk_comivenda_comvenda
foreign key(n_numevenda)
references comvenda(_numevenda)
on delete no action 
on update no action;

alter table comclien add column c_cidaclien varchar(50);
alter table comclien add column c_estclien varchar(50);
alter table comclien drop column c_estclien;
alter table comclien add column c_estaclien varchar(50);
alter table comclien modify column c_estaclien
varchar(100);
drop table comvendas;

insert into comclien(n_numeclien,

c_codiclien,

c_nomeclien,

c_razaclien,

d_dataclien,

c_cnpjclien,

c_foneclien,

c_cidaclien,

c_estaclien)

values (1,

'0001',

'AARONSON',

'AARONSON FURNITURE LTDA',

'2015-02-17',

'17.807.928/0001-85',

'(21) 8167-6584',

'QUEIMADOS',

'RJ');

update comclien set c_nomeclien= 'AARONSON FURNITURE'
	,c_cidaclien='LONDRINA'
	,c_estaclien='PR'
	where n_numeclien=1;
	commit;

update comclien set c_nomeclien='AARONSON'
	where n_numeclien=1;
	rollback;

delete from comclien
	where n_numeclien=1;
	commit;

