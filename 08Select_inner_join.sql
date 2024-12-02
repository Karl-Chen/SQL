

select *
from 訂單明細

select *
from 產品資料

--把產品資料併入訂單明細用inner join，以訂單明細的產品編號相當於產品資料的產品編號做關聯
select 訂單明細.訂單號碼, 訂單明細.產品編號, 產品資料.產品, 訂單明細.單價, 訂單明細.數量,訂單明細.折扣
from 訂單明細 inner join 產品資料 on 訂單明細.產品編號=產品資料.產品編號

--利用別名縮短DML as
select od.訂單號碼, od.產品編號, p.產品, od.單價, od.數量,od.折扣
from 訂單明細 as od inner join 產品資料 as p on od.產品編號=p.產品編號

select od.訂單號碼, od.產品編號, p.產品, od.單價, p.訂價, p.訂價 - od.單價 as 單位毛利,
(p.訂價 - od.單價)*od.數量 as 毛利, od.數量,od.折扣, (p.訂價 - od.單價)*od.數量*(1-od.折扣) as 淨利
from 訂單明細 as od inner join 產品資料 as p on od.產品編號=p.產品編號

--加上兩張表 inner join 第二張表 on 欄位對應 inner join 第三張表 on 欄位對應
select od.訂單號碼, p.類別編號, pt.類別名稱, od.產品編號, p.產品, od.單價, p.訂價, p.訂價 - od.單價 as 單位毛利,
(p.訂價 - od.單價)*od.數量 as 毛利, od.數量,od.折扣, (p.訂價 - od.單價)*od.數量*(1-od.折扣) as 淨利
from 訂單明細 as od inner join 產品資料 as p on od.產品編號=p.產品編號
inner join 產品類別 as pt on pt.類別編號=p.類別編號

select ot.訂單號碼, cus.公司名稱, cus.連絡人, cus.連絡人職稱, ot.訂單日期, ot.要貨日期, ot.送貨日期, q.姓名
from 訂單資料 as ot inner join 客戶 as cus on ot.客戶編號=cus.客戶編號
inner join 員工 as q on ot.員工編號=q.員工編號

------------------------------------------------------------------------------------------
select *
from 訂單明細 as od
inner join 訂單資料 as odata on od.訂單號碼=odata.訂單號碼
inner join 產品資料 as pdata on od.產品編號=pdata.產品編號
inner join 產品類別 as pt on pdata.類別編號=pt.類別編號
inner join 供應商 as sp on pdata.供應商編號=sp.供應商編號
inner join 客戶 as cus on odata.客戶編號=cus.客戶編號
inner join 員工 as q on odata.員工編號=q.員工編號
inner join 貨運公司 as trans on odata.送貨方式=trans.貨運公司編號
-----------------------------------------------------------------------------------------
-------每位客戶下單次數
--請列出 客戶編號, 客戶名稱, 聯絡人, 聯絡人職稱, 下單次數
select cus.客戶編號, cus.公司名稱, cus.連絡人, cus.連絡人職稱, count(*) as 下單次數
from 訂單明細 as od
inner join 訂單資料 as odata on od.訂單號碼=odata.訂單號碼
inner join 產品資料 as pdata on od.產品編號=pdata.產品編號
inner join 產品類別 as pt on pdata.類別編號=pt.類別編號
inner join 供應商 as sp on pdata.供應商編號=sp.供應商編號
inner join 客戶 as cus on odata.客戶編號=cus.客戶編號
inner join 員工 as q on odata.員工編號=q.員工編號
inner join 貨運公司 as trans on odata.送貨方式=trans.貨運公司編號
group by cus.客戶編號, cus.公司名稱, cus.連絡人, cus.連絡人職稱
order by 下單次數 desc

-----------------------------------------------------------------------------------------
-------每位客戶下單次數
--請列出 客戶編號, 客戶名稱, 聯絡人, 聯絡人職稱, 下單次數
select cus.客戶編號, cus.公司名稱 as 客戶名稱, cus.連絡人, cus.連絡人職稱, count(*) as 下單次數
from 訂單資料 as odata
inner join 客戶 as cus on odata.客戶編號=cus.客戶編號
group by cus.客戶編號, cus.公司名稱, cus.連絡人, cus.連絡人職稱
order by 下單次數 desc

--------------------------------------------
--找出消費總額>=3萬元的客戶
--列出 客戶編號, 客戶名稱, 聯絡人, 聯絡人職稱, 下單次數, 消費總額, 平均消費額
--並以消費總額遞減排序，其次用下單次數排序
select cus.客戶編號, cus.公司名稱 as 客戶名稱, cus.連絡人, cus.連絡人職稱, count(*) as 下單次數,
round(sum((od.單價*od.數量)*(1-od.折扣)), 0) as 消費總額,
round(sum((od.單價*od.數量)*(1-od.折扣)) / count(*), 0) as 平均消費額
from 訂單資料 as odata
inner join 訂單明細 as od on odata.訂單號碼=od.訂單號碼
inner join 客戶 as cus on odata.客戶編號=cus.客戶編號
group by cus.客戶編號, cus.公司名稱, cus.連絡人, cus.連絡人職稱
having sum((od.單價*od.數量)*(1-od.折扣)) >= 30000
order by 消費總額 desc, 下單次數  desc

-----------------------------------------------------------------
--員工處理幾張訂單 group by只要寫原本表格的欄位，所以datediff裡面只有用到顧用日期，只寫雇用日期
--datediff是算日期區間，前面的year是以年為單位， getdate()是取得現在的日期時間
select odata.員工編號, e.姓名, DATEDIFF(year, e.雇用日期, GETDATE()) as 年資, count(*) as 處理訂單數,
count(*) / DATEDIFF(year, e.雇用日期, GETDATE()) as 每年平均處理訂單數
from 訂單資料 as odata
inner join 員工 as e on odata.員工編號=e.員工編號
group by odata.員工編號, e.姓名, e.雇用日期
order by 處理訂單數 desc, 年資

select odata.員工編號, e.姓名, DATEDIFF(year, e.出生日期, GETDATE()) as 年紀, count(*) as 處理訂單數,
count(*) / DATEDIFF(year, e.雇用日期, GETDATE()) as 每年平均處理訂單數
from 訂單資料 as odata
inner join 員工 as e on odata.員工編號=e.員工編號
group by odata.員工編號, e.姓名, e.出生日期, e.雇用日期
order by 處理訂單數 desc, 年紀