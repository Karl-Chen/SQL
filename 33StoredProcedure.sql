--新增Member資料時，先檢查會員帳號(Account)是否存在
--因此將新增的方式做成預存成序
create proc InsertMemberData
	@memID nchar(6), @name nvarchar(50),
	@gender bit, @account nvarchar(12), @password nvarchar(20)
as
begin
	--將資料寫入前先檢查會員帳號(Account)是否存在
	declare @result  nchar(6)
	select @result = MemberID from [Member] where @account = Account
	if @result is null
		insert into [Member] values(@memID, @name, @gender, 0, @account, @password)
	else
		print '會員帳號重複'
	
end


--新增會員資料時，一律使用預存程序
--insert into [Member] values('M00002','陳小美',0,0,'abc','1234567890')
exec InsertMemberData 'M00002','陳小美',0,'ABcde123','1234567890'

Alter proc insertToMemberCheck
	@memID nchar(6), @Name nvarchar(50), @gender bit, @Acc nvarchar(12), @Ps nvarchar(20)
as
begin

	declare @tabAcc nvarchar(50)
	select @tabAcc = Account from [Member] where @Name = Account
	if @tabAcc is null
		insert into [Member] values(@memID, @Name, @gender, 0, @Acc, @Ps)
	else
		print '會員帳號已存在'

end
exec insertToMemberCheck 'M00003', '葉小文', 1, 'ABcde13', '12345567'