--���ҡG�b�W�q��ɡA�ϥΪ̤���ۤv��J�q��s���A�]�������Ѩt�Φۤv���ӽs���W�h���ͤ@�ӭq��s��
--�ڭ̨M�w�b��Ʈw���إߤ@�Ө�ơA�ϥΦb�s�W�q���Ʈɯ�z�L��Ƨ��@�ӭq��s��

--�إߤ@�ӦW���ugetOrderID�v�����
--��\�ର�s�W�q��ɥi�I�s����Ʀ۰ʨ��o�@�ӷs���q��s��
--�q��s�����s�X�W�h���q���Ѥ���褸�~���(8�X)+4�X�y����
--(�Ҧp202412122015��2024/12/12����2015�i�q�檺�s��)

alter function fnGetOrderID()
returns nchar(12)
as
begin
--���o��ѳW�h

--�|�X�y�����W�h
declare @icount int=0, @date datetime = getdate(), @strdate nchar(8)
set @strdate = convert(char, @date, 112)
--�p�G���ѨS������q��A�h��0001
--set @strdate+='0001'
--�_�h���̫�@�i�q�渹�X+1
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
--���o��Ѥ���褸�~���]8�X�^
	declare @today char(8) = convert(varchar, getdate(), 112)
	--print @today
	--�|���y�����W�h
	--�p�G���ѨS���q��h��0001
	declare @lastID char(12), @newID char(12)
	--������ѳ̫�@�i�q�渹�X
	select top 1 @lastID = OrderID
	from [Order]
	where convert(varchar, OrderDate, 112) = convert(varchar, getdate(), 112)
	order by orderDate desc

	if @lastID is null 
		set @newID = @today + '0001'		--���Ѫ��Ĥ@�i�q��s��
	else
		set @newID = cast(cast(@lastID as bigint) + 1 as varchar)			--�_�h�����ѳ̫�@�i�s��+1

	return @newID
end

print dbo.getOrderID2()

insert into[order] values (dbo.getOrderID2(), GETDATE(), 'M00001', '�E�T�w', '��������w��100��')