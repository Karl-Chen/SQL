--情境：在增訂單時，使用者不能自己鍵入訂單編號，因此必須由系統自己按照編號規則產生一個訂單編號
--我們決定在資料庫產建立一個函數，使用在新增訂單資料時能透過函數抓到一個訂單編號

--建立一個名為「getOrderID」的函數
--其功能為新增訂單時可呼叫此函數自動取得一個新的訂單編號
--訂單編號的編碼規則為訂單當天日期西元年月日(8碼)+4碼流水號
--(例如202412122015為2024/12/12的第2015張訂單的編號)

alter function fnGetOrderID()
returns nchar(12)
as
begin
--取得當天規則

--四碼流水號規則
declare @icount int=0, @date datetime = getdate(), @strdate nchar(8)
set @strdate = convert(char, @date, 112)
--如果今天沒有任何訂單，則為0001
--set @strdate+='0001'
--否則為最後一張訂單號碼+1
--set @strdate+=(lastID+1)

select @icount = count(OrderID) from [Order] where datediff(day,OrderDate, @date) = 0
set @icount+=1
declare @newN nchar(12)
set @newN = @strdate + RIGHT(REPLICATE('0', 4) + CAST(@icount as varchar), 4)
return @newN

end


create function getOrderID2()
	returns nchar(12)
as
begin
--取得當天日期西元年月日（8碼）
	declare @today char(8) = convert(varchar, getdate(), 112)
	--print @today
	--四風流水號規則
	--如果今天沒有訂單則為0001
	declare @lastID char(12), @newID char(12)
	--抓取今天最後一張訂單號碼
	select top 1 @lastID = OrderID
	from [Order]
	where convert(varchar, OrderDate, 112) = convert(varchar, getdate(), 112)
	order by orderDate desc

	if @lastID is null 
		set @newID = @today + '0001'		--今天的第一張訂單編號
	else
		set @newID = cast(cast(@lastID as bigint) + 1 as varchar)			--否則為今天最後一張編號+1

	return @newID
end

print dbo.getOrderID2()

insert into[order] values (dbo.getOrderID2(), GETDATE(), 'M00001', '余俊德', '高雄市後德路100號')