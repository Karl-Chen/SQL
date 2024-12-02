--資料篩選
--執行順序from -> where -> group by-> select->order by
select *
from 客戶
where 連絡人職稱 = '董事長'

select *
from 客戶
where 公司名稱 = '路福村'

select *
from 客戶
where 客戶編號 = 'DUMON'

select *
from 客戶
where 地址 like '新竹市*'
-- 查1994年到職的員工
select *
from 員工
where 雇用日期>='1994-1-1'
--只取年
--where year(雇用日期)>='1994'
--where 雇用日期 >= '1994'

--查詢產品庫存量為0且未下架的資料
select *
from 產品資料
where 庫存量=0 and 已下架=0

--查詢產品安全存量〈10的產品
select *
from 產品資料
where 安全存量 < 10

--查詢哪些商品產品安全存量>庫存量的產品
select *
from 產品資料
where 安全存量 > 庫存量 + 已訂購量

--找出尚未出貨的訂單
select *
from 訂單資料
where 送貨日期 is NULL