--�y�{����
--case
select ���u�s��, �m�W,  iif(�ʧO=0, '�p�j', '����'), �X�ͤ�� from ���u
--²��case
select ���u�s��, �m�W,  
	case �ʧO
		when 0 then '�p�j'
		when 1 then '����'
	end as '�ٿ�'
, �X�ͤ�� from ���u


--�j�Mcase
declare @gender int, @result nvarchar(5) = 'abd'
set @gender = 1
set @result = 
case 
	when @gender=1 and @result='abc' then'����'
	when @gender=0 then '�p�j'
	else '����'
end
print @result

declare @height int = 150
declare @result nvarchar(5)
set @result = 
case
	when @height>=140 then '����'
	when @height>=120 then '�b��'
	else '�K��'
end
print @result



declare @money int
set @money = 101
declare @call nvarchar(100)
set @call = 
case
	when @money > 10000 then '�����H'
	when @money > 5000 then '�p�d'
	when @money > 1000 then '���I�a'
	when @money > 100 then '�a'
	when @money > 0	then '���h'
	else '�Q���쨫�F'
end
print @call

declare @money int = 101
if @money > 10000 begin print '�����H' end
else if @money > 5000 print '�p�d'
else if @money > 1000 begin print '���I�a' end
else if @money > 100 print '�a'
else if @money > 0	begin print '���h' end
else print '�Q���쨫�F'