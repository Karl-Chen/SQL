--�w�s�{�� Stroed Procedure
--�N�q�G�w���g�n���@�q�{���A�����n�ɦA����A�D�`�������
--��Ƴq�`�ϥΦb�n���o�@�Ӧ^�ǭȡA�w�s�{�ǳq�`�u�O����@�{��

--�إߤ@�ӹw�s�{�Ǫ���create procedure 
create procedure getOrderListWithOtherData
as
begin
select o.�q�渹�X, c.���q�W��, c.�s���H, c.�q��, o.�q����, o.�e�f���, e.�m�W, d.�f�B���q�W��,
o.���f�H, o.�e�f�覡 
from �q���� as o inner join �Ȥ� as c on o.�Ȥ�s��=c.�Ȥ�s��
inner join ���u as e on o.���u�s��=e.���u�s��
inner join �f�B���q as d on o.�e�f�覡 = d.�f�B���q�s��
end


---------------------------------------
--�w�s�{�Ǫ�����
execute getOrderListWithOtherData
---------------------------------------

--�إߤ@�Ӧ��Ѽƪ��w�s����
--�ǤJ�@�ӭq�渹�X�A�Y�i�o��ӭq�檺���
create proc getOrderListWithOtherDataByOrderID
	@orderId char(5)
as
begin
select o.�q�渹�X, c.���q�W��, c.�s���H, c.�q��, o.�q����, o.�e�f���, e.�m�W, d.�f�B���q�W��,
o.���f�H, o.�e�f�覡 
from �q���� as o inner join �Ȥ� as c on o.�Ȥ�s��=c.�Ȥ�s��
inner join ���u as e on o.���u�s��=e.���u�s��
inner join �f�B���q as d on o.�e�f�覡 = d.�f�B���q�s��
where o.�q�渹�X=@orderId
end

exec getOrderListWithOtherDataByOrderID '10248'
--exec�Oexecute���Y�g
--execute�`�Ϊ��a��
exec('select * from ���~���')
create proc getTabList
	@tableName nvarchar(30)
as
begin
exec('select * from ' + @tableName)
end

exec getTabList '���u'

create proc getTableLisst2
	@tableName nvarchar(20), @colName nvarchar(20)
as
begin
exec('select ' + @colName + ' from ' + @tableName)
end

exec getTableLisst2 '�Ȥ�', '�s���H'