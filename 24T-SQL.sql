--T-SQL�{���]�p
--�{��=�t��k+��Ƶ��c

--PL/SQL(�Ұ��媺SQL)

print 'Hello World'

select 'Hello World!' as ��� -------���槹�����G�|�O�@��table

select *
from (select 'Hollo World!' as col1) as tb1

-------------------------------------------------
--�ܼ�
--1.�¶q���ܼ�(�O���@�Ӥ��i�A���Ϊ��F��Aex int string bool) 2.��ƪ���ܼ�(�i�H�ݦ��O�@�Ӫ���)
--�¶q���ܼƫŧi�覡�G declare @�ܼƦW�� ���O
declare @MyName nvarchar(100) = 'Jack Lee'
print @MyName
select @MyName

--���w�B��A�N123����Number
declare @Number int
set @Number = 123
select @Number = 456
print @Number
print @number
--T-SQL�����j�p�g
--------------------------
--use �_��
--go
declare @EmpName nvarchar(20)
select @empname=�m�W
from ���u
where ���u�s��='E0007'

print '���u�m�W�s'+@EmpName
---------------------------------------

declare @salary money = 50000
print '�z���~���O' + cast(@salary as varchar)

declare @birthday datetime = '2024/12-11'
print '�z���ͤ�O' + convert(nvarchar, @birthday, 111)

declare @date datetime
select @date=�n�f���
from �q����
where �q�渹�X='10259'
declare @str nvarchar(100)='���q�檺�n�f����O'+convert(nvarchar, @date, 111)
print @str
print '���q�檺�n�f����O'+convert(nvarchar, @date, 111)

declare @outdate datetime = NULL
select @outdate=�e�f���
from �q����
where �e�f��� is null
print '���q�檺�e�f����O'+convert(nvarchar, @outdate, 111)

-----------------------------------------------
--2.��ƪ���ܼ�(�i�H�ݦ��O�@�Ӫ����)
declare @myTable table(
	name nvarchar(20),
	birthday datetime,
	tel nvarchar(20),
	note nvarchar(max)
)
insert into @myTable values('���p��','2024-12-11','07-8220101','���o�ܥi�R')
select *
from @myTable

declare @myTable2 table(
	name nvarchar(20),
	birthday datetime,
	tel nvarchar(20),
	note nvarchar(max)
)
insert into @myTable2 select �m�W, �X�ͤ��, �q�ܸ��X, ���� from ���u
select *
from @myTable2

declare @mt table (
	�q�渹�X nvarchar(5),
	�Ȥ᤽�q nvarchar(40),
	�t�d���u nvarchar(10)
)
insert into @mt select od.�q�渹�X, c.���q�W��, p.�m�W from �q���� as od
inner join �Ȥ� as c on  od.�Ȥ�s��=c.�Ȥ�s��
inner join ���u as p on od.���u�s��=p.���u�s��

select *
from @mt
