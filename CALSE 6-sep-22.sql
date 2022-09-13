go 
declare @name varchar (100)
select @name = CUS_FNAME from CUSTOMER where CUS_FNAME like '%robert%'
if @name = 'robert' 
begin 
print 'si esta robert'
end
else
begin
print 'no hay ninguno'
end

declare @prom real
set @prom = (select avg(p_price) from PRODUCT)
declare @cantidad int
set @cantidad =(select count(p_price) from PRODUCT where P_PRICE > @prom)
if @cantidad> 10 print'hay mas de 10'
else print 'no hay mas de 10'

