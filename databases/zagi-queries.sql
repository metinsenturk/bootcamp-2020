select * from category;
select vendorid, vendorname from vendor;
select customername, customerzip from customer;
select productid, productname, productprice from product where productprice >=100;
select p.productid, p.productname, p.productprice, v.vendorname from product p inner join vendor v on
v.vendorid = p.vendorid order by productid;
select p.productid, p.productname, p.productprice, v.vendorname, c.categoryname from product p
inner join vendor v on v.vendorid = p.vendorid inner join category c on c.categoryid = p.categoryid order
by productid;
select productid, productname, productprice from product inner join category on category.categoryid =
product.categoryid where category.categoryname = 'Camping' order by productid;
select t.tid, c.customername, t.tdate from salestransaction t inner join customer c on c.customerid =
t.customerid inner join soldvia s on s.tid = t.tid where s.productid in (select productid from product
where productname = 'Dura Boot');
select region.regionid, region.regionname, COUNT(store.storeid) as numofstores from region inner join store on
store.regionid = region.regionid group by region.regionid, region.regionname;
select c.categoryid, c.categoryname, AVG(p.productprice) from category c inner join product p on
p.categoryid = c.categoryid group by c.categoryid, c.categoryname;
select c.categoryid, count(p.productid) from category c inner join product p on p.categoryid =
c.categoryid inner join soldvia s on s.productid = p.productid group by c.categoryid;
select t.tid, count(s.productid) from salestransaction t inner join soldvia s on s.tid = t.tid group by t.tid
having count(s.productid) > 5;
select p.productid, p.productname from product p where p.productprice = (select MIN(ProductPrice)
from product);
select p.productid, p.productname, v.vendorname from product p inner join vendor v on v.vendorid =
p.vendorid where p.productprice < (select avg(productprice) from product);
select top 10 * from product pp inner join (select p.productid, p.productname, count(p.productid)
noofproductsold from product p inner join soldvia s on s.productid = p.productid group by p.productid, p.productname)
m on m.productid = pp.productid order by noofproductsold desc;
--select p.productid, p.productname, p.productprice from product p inner join soldvia s on s.productid =
--p.productid group by s.productid having sum(s.noofitems) > 3;
--select p.productid, p.productname, p.productprice from product p inner join soldvia s on s.productid =
--p.productid group by s.productid having count(s.tid) > 1;