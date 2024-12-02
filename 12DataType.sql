--資料型態轉換
--cast(被轉的內容 as 轉換成的型態)
select pt.類別編號, pt.類別名稱, cast(count(*) as nvarchar)+'種' as 產品數量
from 產品資料 as p inner join 產品類別 as pt on p.類別編號=pt.類別編號
group by pt.類別編號, pt.類別名稱


-------------------------------------------------
--convert(要轉的資料型態, 要被轉的內容, 格式)
--12是轉成短西元日期
--112是轉成年月日(19960702) 111則是1996/07/02
--120是轉成日期時間
--select convert(char(10), 訂單日期, 20), count(*) as 訂單數
select convert(varchar, 訂單日期, 111) as 訂單日期, count(*) as 訂單數
from 訂單資料
group by 訂單日期

select iif(送貨日期 is null, '尚未出貨', convert(varchar, 送貨日期, 111)) as 送貨日期, count(*) as 訂單數
from 訂單資料
group by 送貨日期

--isnull
select isnull(convert(varchar, 送貨日期, 111), '尚未出貨') as 送貨日期, count(*) as 訂單數
from 訂單資料
group by 送貨日期


select cast(運費 as nvarchar) + '元' as 運費
from 訂單資料

select convert(char(12), 要貨日期, 111) as 要貨日期, count(*)
from 訂單資料
group by 要貨日期

select iif(要貨日期 is null, '沒要貨', convert(char(12), 要貨日期, 111))as 要貨日期, count(*)
from 訂單資料
group by 要貨日期

select isnull(convert(varchar, 要貨日期, 112), '還沒下訂') as 要貨日期, count(*)
from 訂單資料
group by 要貨日期

select iif(要貨日期 is null, '沒要貨', convert(char(12), 要貨日期, 111))as 要貨日期, 訂單號碼
from 訂單資料