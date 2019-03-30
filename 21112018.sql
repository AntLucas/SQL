use master

drop database promocao

create database promocao

use promocao 

create table tbproduto(
idproduto int identity (1,1) primary key,
nmproduto varchar(50),
vlproduto decimal(10,2)
)

create table tbpromocao(
idpromocao int identity (1,1) primary key,
idproduto int,
dtinicial datetime,
dtfinal datetime,
nmpromocao varchar(50),
vlproduto decimal(10,2)
)

alter table tbpromocao
add constraint fk_idproduto
foreign key (idproduto)
references tbproduto (idproduto)

insert into tbproduto(nmproduto,vlproduto)
values('macarrão',7.00)

insert into tbproduto(nmproduto,vlproduto)
values('arroz',10.00)

insert into tbproduto(nmproduto,vlproduto)
values('feijão',6.00)


insert into tbpromocao(idproduto,dtinicial,dtfinal,nmpromocao,vlproduto)
values(3,'20/11/2018 10:00:00','21/11/2018 23:00:00','Consciência negra',4.00)

insert into tbpromocao(idproduto,dtinicial,dtfinal,nmpromocao,vlproduto)
values(2,'20/11/2018 06:00:00','24/11/2018 06:00:00','black friday',7.00)

select * from tbproduto

select * from tbpromocao

create procedure retornarpromocao
@dtinicial datetime
as select * from tbpromocao
where @dtinicial is null or dtinicial like '%'+ @dtinicial +'%'

retornarpromocao  '23:00:00'

create procedure retornarproduto
@nmproduto varchar(100) = null
as select * from tbproduto
where @nmproduto is null or nmproduto like '%'+ @nmproduto +'%'

retornarproduto 'Arro'

select A.idproduto, A.nmproduto, 
ISNULL((SELECT top 1 B.vlproduto from 
	   tbpromocao B
	   where B.idproduto = A.idproduto 
	   and B.dtinicial <= GETDATE() and B.dtfinal >= GETDATE()), A.vlproduto) from tbproduto A
	   