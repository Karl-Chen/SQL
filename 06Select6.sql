--group by 做群組分類
--distinct 移除重覆
--執行順序from -> where -> group by -> having -> select -> order by
select distinct 職稱
from 員工

select 職稱
from 員工
group by 職稱

select distinct 連絡人職稱
from 客戶

select 連絡人職稱
from 客戶
group by 連絡人職稱

--統計員工內每一種職稱各有多少人
select 職稱, count(職稱)as 人數
from 員工
group by 職稱

select 連絡人職稱, count(*) as 人數
from 客戶
Group by 連絡人職稱

--每張訂單訂購了幾種商品
--訂單編號、幾種商品

select 訂單號碼, count(產品編號) as 幾種商品
from 訂單明細
group by 訂單號碼

--每張訂單訂購的商品總量
select 訂單號碼, sum(數量) as 總量
from 訂單明細
group by 訂單號碼

--每張訂單總額
select 訂單號碼, 產品編號, round(單價*數量*(1-折扣), 2) as 小計
from 訂單明細

select 訂單號碼, round(sum(單價*數量*(1-折扣)),2) as 訂單總額
from 訂單明細
group by 訂單號碼

--列出訂單總額最高前10筆資料 

select top 10 with ties 訂單號碼, round(sum(單價*數量*(1-折扣)),2) as 訂單總額
from 訂單明細
group by 訂單號碼
order by 訂單總額 desc

-------------------每個客戶下單次數
select 客戶編號, count(*) as 下單次數
from 訂單資料
group by 客戶編號
order by 下單次數 desc

------------------哪些客戶下單超過10次
select 客戶編號, count(*) as 下單次數
from 訂單資料
group by 客戶編號
having count(*) > 10
order by 下單次數 desc
--having跟where功用一樣，而且having 可以執行聚合函式，having是group by子句，所以having depand在group by，where執行順序比group by及having優先

---------統計每個員工處理訂單的次數
select 員工編號, count(*) as 處理訂單次數
from 訂單資料
group by 員工編號
order by 處理訂單次數 desc

--統計每位員工處理每位客戶訂單的次數
--
select 員工編號, 客戶編號, count(*) as 服務次數
from 訂單資料
group by 員工編號, 客戶編號
order by 員工編號
-------------------------------------------
--找出前10名銷售熱門商品(量最多)
select top 10 with ties 產品編號, sum(數量) as 總量
from 訂單明細
group by 產品編號
order by 總量 desc

-----------------------------------------
--找出前10名銷售熱門商品(營業額最多)
select top 10 with ties 產品編號, round(sum(單價*數量*(1-折扣)), 0) as 總計
from 訂單明細
group by 產品編號
order by 總計 desc


--撰寫順序 select -> from -> where -> group by -> having -> order by
--執行順序 from -> where - > group by -> having -> select -> order by