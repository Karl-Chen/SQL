print getdate()

declare @t datetime = getdate()
set @t+=30
select @t

-------------------------------
--自訂函數(function) create function fnFunctionName() returns Type
--呼叫函數時可以顯示客戶所有資料

select * from 客戶

create function fnGetList()
	returns Table
return
(select * from 客戶)
go
--------------------------------------------
select * from dbo.fnGetList()
--------------------------------------------


--用客戶名稱進行關鍵字查詢
create function fnGetListByKeyword(@keyword nvarchar(20))
	returns table
return
(select * from 客戶 where 公司名稱 like '%'+@keyword+'%')
--------------------------------------------------------------
select * from dbo.fnGetListByKeyword('中')
--------------------------------------------------------------

--用客戶編號查詢公司名稱
create function fnGetNameByID(@id nchar(5))
returns nvarchar(40)
as
begin
	declare @name nvarchar(40)
	select @name =  公司名稱 from 客戶 where 客戶編號=@id
	if @name is null
		return '查無客戶資料'
	return @name
end

print dbo.fnGetNameByID('BOTtM')

