--�s�WMember��ƮɡA���ˬd�|���b��(Account)�O�_�s�b
--�]���N�s�W���覡�����w�s����
create proc InsertMemberData
	@memID nchar(6), @name nvarchar(50),
	@gender bit, @account nvarchar(12), @password nvarchar(20)
as
begin
	--�N��Ƽg�J�e���ˬd�|���b��(Account)�O�_�s�b
	declare @result  nchar(6)
	select @result = MemberID from [Member] where @account = Account
	if @result is null
		insert into [Member] values(@memID, @name, @gender, 0, @account, @password)
	else
		print '�|���b������'
	
end


--�s�W�|����ƮɡA�@�ߨϥιw�s�{��
--insert into [Member] values('M00002','���p��',0,0,'abc','1234567890')
exec InsertMemberData 'M00002','���p��',0,'ABcde123','1234567890'

Alter proc insertToMemberCheck
	@memID nchar(6), @Name nvarchar(50), @gender bit, @Acc nvarchar(12), @Ps nvarchar(20)
as
begin

	declare @tabAcc nvarchar(50)
	select @tabAcc = Account from [Member] where @Name = Account
	if @tabAcc is null
		insert into [Member] values(@memID, @Name, @gender, 0, @Acc, @Ps)
	else
		print '�|���b���w�s�b'

end
exec insertToMemberCheck 'M00003', '���p��', 1, 'ABcde13', '12345567'