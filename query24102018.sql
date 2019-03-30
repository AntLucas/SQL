use master

drop database venda

create database venda

use venda

create table tbcliente(
idcliente int primary key identity(1,1) not null,
nmcliente varchar(50)
)

create table tbfuncionario(
idfuncionario int primary key identity(1,1) not null,
nmfuncionario varchar(50)
)

create table tbproduto(
idproduto int primary key identity(1,1) not null,
nmproduto varchar(50) not null,
vlproduto decimal (10,2) not null
)

create table tbvenda(
idvenda int primary key identity(1,1) not null,
idcliente int,
idfuncionario int,
dtvenda datetime not null

)

create table tbvendaitem(
idvendaitem int primary key identity(1,1) not null,
idvenda int not null,
idproduto int not null,
qntd decimal (10,0) not null
)

alter table tbvenda
add constraint fk_idcliente
foreign key (idcliente) 
references tbcliente (idcliente) 

alter table tbvenda
add constraint fk_idfuncionario
foreign key (idfuncionario) 
references tbfuncionario (idfuncionario) 

alter table tbvendaitem
add constraint fk_idVenda
foreign key (idvenda)
references tbvenda (idvenda)

alter table tbvendaitem
add constraint fk_idproduto
foreign key (idproduto) 
references tbproduto (idproduto) 



insert into tbcliente(nmcliente)
values('Antonio')

insert into tbcliente(nmcliente)
values('Bruno')

insert into tbcliente(nmcliente)
values('Douglas')

insert into tbcliente(nmcliente)
values('Gustavo')

insert into tbcliente(nmcliente)
values('Julio')





insert into tbfuncionario(nmfuncionario)
values('Cleber')

insert into tbfuncionario(nmfuncionario)
values('Richard')

insert into tbfuncionario(nmfuncionario)
values('Heberto')

insert into tbfuncionario(nmfuncionario)
values('Rasmos')

insert into tbfuncionario(nmfuncionario)
values('Jouli')



insert into tbproduto (nmproduto,vlproduto)
values('Maçã',10.09)


insert into tbproduto (nmproduto,vlproduto)
values('Goiaba',5.99)


insert into tbproduto (nmproduto,vlproduto)
values('Uva',7.80)


insert into tbproduto (nmproduto,vlproduto)
values('Melão',20.55)


insert into tbproduto (nmproduto,vlproduto)
values('Morango',35.50)


insert into tbproduto (nmproduto,vlproduto)
values('Banana',13.50)


insert into tbproduto (nmproduto,vlproduto)
values('Mamão',12.00)


insert into tbproduto (nmproduto,vlproduto)
values('Abacate',40.00)


insert into tbproduto (nmproduto,vlproduto)
values('Manga',35.00)


insert into tbproduto (nmproduto,vlproduto)
values('Jabuticaba',10.00)

insert into tbvenda(idcliente,idfuncionario,dtvenda)
values(1,2,'20/10/2018 14:20:30')

insert into tbvenda(idcliente,idfuncionario,dtvenda)
values(2,1,'20/10/2018 17:33:25')


insert into tbvenda(idcliente,idfuncionario,dtvenda)
values(3,4,'21/10/2018 08:25:00')


insert into tbvenda(idcliente,idfuncionario,dtvenda)
values(4,5,'22/10/2018 20:20:02')


insert into tbvenda(idcliente,idfuncionario,dtvenda)
values(5,3,'23/10/2018 23:55:52')


insert into tbvendaitem(idvenda,idproduto,qntd)
values(1,1,10)

insert into tbvendaitem(idvenda,idproduto,qntd)
values(1,5,3)

insert into tbvendaitem(idvenda,idproduto,qntd)
values(1,4,3)

insert into tbvendaitem(idvenda,idproduto,qntd)
values(2,9,7)

insert into tbvendaitem(idvenda,idproduto,qntd)
values(2,2,3)

insert into tbvendaitem(idvenda,idproduto,qntd)
values(2,3,3)

insert into tbvendaitem(idvenda,idproduto,qntd)
values(3,4,3)

insert into tbvendaitem(idvenda,idproduto,qntd)
values(3,10,15)

insert into tbvendaitem(idvenda,idproduto,qntd)
values(3,7,3)

insert into tbvendaitem(idvenda,idproduto,qntd)
values(4,8,3)

insert into tbvendaitem(idvenda,idproduto,qntd)
values(4,9,3)

insert into tbvendaitem(idvenda,idproduto,qntd)
values(4,10,3)

insert into tbvendaitem(idvenda,idproduto,qntd)
values(5,1,15)

insert into tbvendaitem(idvenda,idproduto,qntd)
values(5,5,15)

insert into tbvendaitem(idvenda,idproduto,qntd)
values(5,10,15)

select * from tbproduto

select * from tbvenda

select * from tbvendaitem

select
a.idproduto,
b.idvenda,
a.nmproduto,
a.vlproduto,
b.dtvenda,
c.qntd

from tbproduto as a 
inner join tbvendaitem as c
on a.idproduto = c.idproduto
inner join tbvenda as b
on b.idvenda = c.idvenda


select a.idvenda,
d.nmcliente,
e.nmfuncionario,
count(b.idproduto) as qtdeProdutos,
sum(c.vlproduto * b.qntd) as vlrProduto
 from tbvenda a
inner join tbvendaitem b
on b.idvenda = a.idvenda
inner join tbproduto c 
on c.idproduto = b.idproduto
inner join tbcliente d
on d.idcliente = a.idcliente
inner join tbfuncionario e
on e.idfuncionario = a.idfuncionario


group by a.idvenda, d.nmcliente,e.nmfuncionario
