--SQL_DML
--select
--insert
--update
--delete
-------------------------------------------------------
-- use 後面接資料庫名稱，就是使用這個資料庫
use 北風
go
-------------------------from 後面接資料表，select接欄位 下列是從客戶資料表裡面選所有欄位
--執行順序from -> where -> group by-> select->order by
select * from 客戶
select 客戶編號,公司名稱,連絡人,連絡人職稱 from 客戶
-----------------------------------------------------------
--取別名as，原本的欄位名稱 as 新的欄位名稱，也可以用空格
select 客戶編號,公司名稱 as 客戶名稱, 連絡人職稱 + 連絡人 as 窗口, 郵遞區號+地址 as 地址
from 客戶

--------------------------------------------------
-- 數值運算
select 訂單號碼, 產品編號, 單價 as 售價, 數量 as 購買量, 單價 * 數量  * (1 - 折扣) as 小計
from 訂單明細

-------------------------------------
--日期時間
select 員工編號, 姓名, 出生日期, datediff(year, 出生日期, GETDATE()) as 年齡
--, DATEDIFF(MONTH, 出生日期, GETDATE()), DATEDIFF(DAY, 出生日期, GETDATE())
from 員工
--datediff( 換算單位(year/month/day), 出生日期, getdate() ) 日期區間，
----------------------------------------------------------------
select 員工編號, 姓名, datediff(year, 出生日期, GETDATE()) as 年齡
, DATEDIFF(year, 雇用日期, GETDATE()) as 年資
, DATEDIFF(year, 出生日期, 雇用日期) as 入職年紀
from 員工
