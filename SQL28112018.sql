use master
drop database teste
create database teste
use teste

create table caixa(
data datetime,
saldoinicial decimal(10,2),
saldofinal decimal(10,2),
);

create table venda(
idvenda int identity (1,1) primary key,
data datetime,
codigo int,
valor decimal(10,2),
);



insert into caixa(data,saldoinicial,saldofinal)
values('27/11/2018 23:35:00',100,100)
insert into caixa(data,saldoinicial,saldofinal)
values('28/11/2018 23:40:00',100,100)

insert into venda(data,codigo,valor)
values('28/11/2018 23:40:00',1,20.30)

create trigger trgvenda_ui
on venda 
for insert
as
begin
declare
@valor decimal(10,2),
@data datetime

select @data = data, @valor = valor from inserted
update caixa set saldofinal=saldofinal + @valor 
where data = @data
end



select * from caixa
select * from venda

create view fechamento_caixa
 as

select 
b.data,
SUM(a.valor) as saldo_vendas,(b.saldoinicial+b.saldofinal) as saldo_total
from venda a
inner join caixa b
on b.data = a.data

group by b.data,(b.saldoinicial + b.saldofinal)


select * from fechamento_caixa