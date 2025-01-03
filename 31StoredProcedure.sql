--預存程序 Stroed Procedure
--意義：預先寫好的一段程式，有須要時再執行，非常類似函數
--函數通常使用在要取得一個回傳值，預存程序通常只是執行一程式

--建立一個預存程序物件create procedure 
create procedure getOrderListWithOtherData
as
begin
select o.訂單號碼, c.公司名稱, c.連絡人, c.電話, o.訂單日期, o.送貨日期, e.姓名, d.貨運公司名稱,
o.收貨人, o.送貨方式 
from 訂單資料 as o inner join 客戶 as c on o.客戶編號=c.客戶編號
inner join 員工 as e on o.員工編號=e.員工編號
inner join 貨運公司 as d on o.送貨方式 = d.貨運公司編號
end


---------------------------------------
--預存程序的執行
execute getOrderListWithOtherData
---------------------------------------

--建立一個有參數的預存物件
--傳入一個訂單號碼，即可得到該訂單的資料
create proc getOrderListWithOtherDataByOrderID
	@orderId char(5)
as
begin
select o.訂單號碼, c.公司名稱, c.連絡人, c.電話, o.訂單日期, o.送貨日期, e.姓名, d.貨運公司名稱,
o.收貨人, o.送貨方式 
from 訂單資料 as o inner join 客戶 as c on o.客戶編號=c.客戶編號
inner join 員工 as e on o.員工編號=e.員工編號
inner join 貨運公司 as d on o.送貨方式 = d.貨運公司編號
where o.訂單號碼=@orderId
end

exec getOrderListWithOtherDataByOrderID '10248'
--exec是execute的縮寫
--execute常用的地方
exec('select * from 產品資料')
create proc getTabList
	@tableName nvarchar(30)
as
begin
exec('select * from ' + @tableName)
end

exec getTabList '員工'

create proc getTableLisst2
	@tableName nvarchar(20), @colName nvarchar(20)
as
begin
exec('select ' + @colName + ' from ' + @tableName)
end

exec getTableLisst2 '客戶', '連絡人'