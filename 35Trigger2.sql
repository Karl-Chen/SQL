--如果訂單商品訂購數量大於該商品的庫存量或售價大於訂單，則訂購失敗
--若訂購成功，則扣除訂購的庫存量
--客戶在下單時，會動用到三張資料表-訂單資料、訂單明細、產品資料
select * from 產品資料


--新增一張訂購單
--insert 兩個資料表-訂單資料、訂單明細

alter trigger checkOrderQtyPrice on 訂單明細
after insert
as
begin
	--如果訂單商品訂購數量大於該商品的庫存量或售價大於訂單，則訂購失敗
	--若訂購成功，則扣除訂購的庫存量
	declare @ProductPice money, @ProductQty int, @ProductID int, @OrderPrice money,
	@OrderQty int
	select @OrderPrice = 單價, @OrderQty = 數量, @ProductID = 產品編號 from inserted

	select @ProductPice = 訂價, @ProductQty = 庫存量 from 產品資料
	where 產品資料.產品編號=@ProductID

	if @OrderPrice > @ProductPice
		rollback
	else if @OrderQty >= @ProductQty
		rollback
	else
	begin
		update 產品資料
		set 庫存量=庫存量 - @OrderQty
		where 產品編號=@ProductID
	end
end

select * from 訂單明細 where 訂單號碼='10263'

insert into 訂單明細 values('10263', 1, 18, 38, 0)