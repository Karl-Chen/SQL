--子查詢(Sub Query)
--調出某一客戶的所有訂單紀錄

select *
from 訂單資料
where 客戶編號 = (select 客戶編號 from 客戶
where 公司名稱='大華城台北')

select *
from 訂單資料
where 員工編號 = (select 員工編號 from 員工
where 姓名='趙飛燕')

select *
from 訂單資料
where 送貨方式 = (select 貨運公司編號 from 貨運公司
where 貨運公司名稱='白貓宅急便')

select od.*
from 訂單資料 as od inner join
員工 as e on od.員工編號=e.員工編號
where e.姓名='趙飛燕'

---------------------------
--合併查詢的效能比子查詢好
---------------------------
--請查詢哪些商品的單價大於全部商品的平均單價
--子查詢
select *
from 產品資料
where 訂價 > (select avg(訂價)
from 產品資料)
--合併查詢(自身合併)
select p.產品編號, p.產品, p.訂價, avg(p2.訂價)
from 產品資料 as p inner join 產品資料 as p2 on (p.產品編號 != p2.產品編號 or p.產品編號 = p2.產品編號)
group by p.產品編號, p.產品, p.訂價
having p.訂價 > avg(p2.訂價)
--自然合併
select p.產品編號, p.產品, p.訂價, avg(p2.訂價)
from 產品資料 as p, 產品資料 as p2
group by p.產品編號, p.產品, p.訂價
having p.訂價 > avg(p2.訂價)
--cross join(做卡氏積運算)
select p.產品編號, p.產品, p.訂價, avg(p2.訂價)
from 產品資料 as p cross join 產品資料 as p2 
group by p.產品編號, p.產品, p.訂價
having p.訂價 > avg(p2.訂價)

----------------------------------------------------
--哪些客戶買過豬肉
--合併查詢
select distinct c.*, pdata.產品
from 訂單資料 as odata 
inner join 訂單明細 as odetail on odata.訂單號碼 = odetail.訂單號碼
inner join 客戶 as c on odata.客戶編號 = c.客戶編號
inner join 產品資料 as pdata on odetail.產品編號 = pdata.產品編號
where pdata.產品='豬肉'
--子查詢 只要有可能會查出多筆資料，就都用in，比較保險
select *
from 客戶
where 客戶編號 in (select 客戶編號 from 訂單資料
where 訂單號碼 in (select 訂單號碼 from 訂單明細
where 產品編號 in (select 產品編號 from 產品資料
where 產品 = '豬肉')))

--哪些員工處理過客戶名稱「正人資源」的訂單
--合併查詢
select distinct e.*
from 員工 as e
inner join 訂單資料 as odata on e.員工編號 = odata.員工編號
inner join 客戶 as c on c.客戶編號 = odata.客戶編號
where c.公司名稱 = '正人資源'
--子查詢
select *
from 員工
where 員工編號 in (select distinct 員工編號 from 訂單資料
where 客戶編號 in (select 客戶編號 from 客戶
where 公司名稱 = '正人資源'))


--查有下過單的客戶
--in運算子
select *
from 客戶
where 客戶編號 in (select distinct 客戶編號 from 訂單資料)

--exists運算子
select *
from 客戶 as c
where exists(select * from 訂單資料 as o where c.客戶編號 = o.客戶編號)

--相當於把條件拉到最後去寫
select *
from 員工 as e
where exists (select * from 訂單資料 as odata
where exists (select * from 客戶 as c
where e.員工編號 = odata.員工編號 and c.客戶編號 = odata.客戶編號 and c.公司名稱='正人資源'))

select *
from 客戶
where 客戶編號 in (select 客戶編號 from 訂單資料
where 訂單號碼 in (select 訂單號碼 from 訂單明細
where 產品編號 in (select 產品編號 from 產品資料
where 產品 = '豬肉')))

select *
from 客戶 as c
where exists(select * from 訂單資料 as odata
where exists(select * from 訂單明細 as odetail
where exists(select * from 產品資料 as pdata
where pdata.產品 = '豬肉' and pdata.產品編號 = odetail.產品編號 and odetail.訂單號碼 = odata.訂單號碼 and odata.客戶編號 = c.客戶編號)))