


create table mallar(
m_id int primary key not null,
ad varchar(50),
satis_qiymeti int,
alis_qiymeti int,
);


create table sifaris(
id int primary key not null,
mal_id int not null,
miqdar int ,
satis_qiymeti int,
satis_meblegi int,
foreign key(mal_id) references mallar(
m_id) on update cascade);

insert into mallar values( 1, 'water', 10, 9)
insert into sifaris values(100, 1, 3, 10, 20)
insert into mallar values(2, 'cheese', 12, 11)
insert into mallar values(3,'fanta', 13, 12)
insert into sifaris values(101, 3, 2, 13, 1)
insert into mallar values(4,'cola', 14, 13)
insert into sifaris values(102, 4, 3, 14, 2)
insert into mallar values(5, 'tea', 15, 14)

create trigger  trigger1 on dbo.mallar 
after update as 
begin 
update dbo.sifaris 
set satis_qiymeti = ma.satis_qiymeti 
from dbo.sifaris as sif
inner join inserted as ma
on sif.mal_id = ma.m_id 
end
go
