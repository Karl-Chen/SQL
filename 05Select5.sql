----執行順序from -> where -> group by -> having -> select -> order by
select *, 單價*數量*(1 - 折扣) as 小計
from 訂單明細

select 訂單號碼, round(sum(單價*數量*(1-折扣)), 2) as 總計
from 訂單明細
group by 訂單號碼

select 訂單號碼, sum(單價*數量*(1-折扣)) as 總計
from 訂單明細
group by 訂單號碼

---------------------------------
--聚合函數
--count
select count(*) as 員工人數
from 員工
select count(訂單號碼) as 訂單筆數
from 訂單資料
--會自己扣掉NULL欄位
select count(送貨日期) as 已出貨訂單筆數
from 訂單資料

select count(收貨人) as 未出貨訂單筆數
from 訂單資料
where 送貨日期 is NULL

--sum()
select sum(訂價)
from 產品資料
select sum(單價*數量*(1-折扣)) as 小計
from 訂單明細

--avage平均avg()
select avg(訂價)
from 產品資料

--max() min()
select max(訂價)
from 產品資料

select min(訂價)
from 產品資料

select sum(訂價) as 單價總和, avg(訂價) as 單價平均, max(訂價) as 最高單價, min(訂價) as 最低單價, count(*) as 產品筆數
from 產品資料

select 類別編號, sum(訂價) as 單價總和, avg(訂價) as 單價平均, max(訂價) as 最高單價, min(訂價) as 最低單價, count(*) as 產品筆數
from 產品資料
group by 類別編號