print getdate()

declare @t datetime = getdate()
set @t+=30
select @t

-------------------------------
--�ۭq���(function) create function fnFunctionName() returns Type
--�I�s��Ʈɥi�H��ܫȤ�Ҧ����

select * from �Ȥ�

create function fnGetList()
	returns Table
return
(select * from �Ȥ�)
go
--------------------------------------------
select * from dbo.fnGetList()
--------------------------------------------


--�ΫȤ�W�ٶi������r�d��
create function fnGetListByKeyword(@keyword nvarchar(20))
	returns table
return
(select * from �Ȥ� where ���q�W�� like '%'+@keyword+'%')
--------------------------------------------------------------
select * from dbo.fnGetListByKeyword('��')
--------------------------------------------------------------

--�ΫȤ�s���d�ߤ��q�W��
create function fnGetNameByID(@id nchar(5))
returns nvarchar(40)
as
begin
	declare @name nvarchar(40)
	select @name =  ���q�W�� from �Ȥ� where �Ȥ�s��=@id
	if @name is null
		return '�d�L�Ȥ���'
	return @name
end

print dbo.fnGetNameByID('BOTtM')

