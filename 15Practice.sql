--1. 請試寫一合併查詢，查詢出訂購日期落在1996年7月並指定送貨公司為「白貓宅急便」的有訂單之訂貨明細資料，
--並列出訂單號碼、產品類別名稱、產品名稱、產品訂購單價、產品訂購數量、產品價錢小計、客戶編號、客戶名稱、
--收貨人名字、訂購日期、處理訂單員工的姓名、貨運公司、供應商名稱等資料項目，
--其中產品價錢小計請以四捨五入計算至整數位。
select odata.訂單號碼, ptype.類別名稱, pdata.產品, odetail.單價, odetail.數量,
round(odetail.單價*odetail.數量*(1-(odetail.折扣 / 100)), 0) as 小計,
cus.客戶編號, cus.公司名稱, odata.收貨人, odata.訂單日期 as 訂貨日期, worker.姓名, ts.貨運公司名稱,
supp.供應商
from 訂單資料 as odata
inner join 訂單明細 as odetail on odata.訂單號碼=odetail.訂單號碼
inner join 產品資料 as pdata on pdata.產品編號=odetail.產品編號
inner join 產品類別 as ptype on pdata.類別編號=ptype.類別編號
inner join 客戶 as cus on cus.客戶編號=odata.客戶編號
inner join 員工 as worker on worker.員工編號=odata.員工編號
inner join 貨運公司 as ts on ts.貨運公司編號=odata.送貨方式
inner join 供應商 as supp on supp.供應商編號=pdata.供應商編號
where ts.貨運公司名稱='白貓宅急便' and odata.訂單日期 between '1996-07-01' and '1996-08-01'

--2. 請試寫一合併查詢，查詢客戶「山山銀行」歷年來所訂購的所有產品，並統計出各種產品的訂購數量
--輸出欄立為客戶編號、公司名稱、聯絡人、產品名稱、訂購數量

select cus.客戶編號, cus.公司名稱, cus.連絡人, pdata.產品, sum(odetail.數量) as 訂購總量
from 訂單資料 as odata
inner join 訂單明細 as odetail on odata.訂單號碼=odetail.訂單號碼
inner join 客戶 as cus on odata.客戶編號=cus.客戶編號
inner join 產品資料 as pdata on pdata.產品編號=odetail.產品編號
group by cus.客戶編號, cus.公司名稱, cus.連絡人, pdata.產品, odetail.數量
having cus.公司名稱='山山銀行'


--3. 請利用exists運算子配合子查詢式，找出哪些客戶從未下過訂單，並列出客戶的所有欄位。
--(不可用到in運算，亦不可用合併查詢式) 
select *
from 客戶 as c
where not exists (select * from 訂單資料 as o where o.客戶編號=c.客戶編號)


--4. 請利用in運算子配合子查詢式，查詢哪些員工有處理過訂單，並列出員工的員工編號、姓名、職稱、內部分機號碼、
--附註欄位。(不可用到exists運算，亦不可用合併查詢式) 

select e.員工編號, e.姓名, e.職稱, e.內部分機號碼, e.附註
from 員工 as e
where e.員工編號 in (select distinct 員工編號 from 訂單資料)


--5. 請合併查詢與子查詢兩種寫法，列出1998年度所有被訂購過的產品資料，並列出產品的所有欄位，且依產品編號由小到大排序。
--(寫合併查詢時不得用任何子查詢式，寫子查詢時不得用任何合併查詢式)
select * 
from 產品資料 as pdata
inner join 訂單明細 as odetail on pdata.產品編號=odetail.產品編號
inner join 訂單資料 as odata on odetail.訂單號碼=odata.訂單號碼
where odata.訂單日期 between '1998-1-1' and '1998-12-31'
order by pdata.產品編號


select * from 產品資料 where 產品編號 in
(select 產品編號 from 訂單明細 where 訂單號碼 in
(select 訂單號碼 from 訂單資料 where year(訂單日期)=1998))
order by 產品編號


--合併查詢
select distinct p.*
from 產品資料 as p inner join 訂單明細 as od on p.產品編號=od.產品編號
inner join 訂單資料 as o on o.訂單號碼=od.訂單號碼
where o.訂單日期 between '1998-1-1' and '1998/12/31'
order by p.產品編號
--where year(o.訂單日期) = 1998

--子查詢
select *
from 產品資料
where 產品編號 in
(select 產品編號 from 訂單明細 where 訂單號碼 in (
select 訂單號碼 from 訂單資料 where 訂單日期 between '1998-1-1' and '1998-12-31'))
order by 產品編號

