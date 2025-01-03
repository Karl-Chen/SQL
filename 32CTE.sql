--CTE�d��
--�Ω󻼰j���L�{
--���X�B��G�p�� union �涰 intersect, �t��except
--union all�A�N��W�U�֦b�@�_
--�Ĥ@�h
select e.���u�s��, e.�m�W, 1 as ���h from ���u as e
where e.�D�� is null	--�o����u���s���OE0001
union all


--�ĤG�h
select e.���u�s��, e.�m�W, 2 as ���h from ���u as e
where e.�D�� = 'E0001'	--�o����u���s���OE0001
union all


select e.���u�s��, e.�m�W, 3 as ���h from ���u as e
where e.�D�� in ('E0004', 'E0013')	
union all


select e.���u�s��, e.�m�W, 4 as ���h from ���u as e
where e.�D�� in ('E0005')	
union all


select e.���u�s��, e.�m�W, 5 as ���h from ���u as e
where e.�D�� in ('E0002', 'E0006', 'E0007', 'E0009')	
union all


select e.���u�s��, e.�m�W, 6 as ���h from ���u as e
where e.�D�� in ('E0003', 'E0008', 'E0012', 'E0014')	--��Ĥ��h�N�S������u�A�i�H���u�F

--------------------------------------------------------------


--�l�d��
select �q�渹�X, ���q�W��, �s���H, �q��, �q����, �e�f���, �m�W, �f�B���q�W��,
���f�H, �e�f�覡 
from
(
select o.�q�渹�X, c.���q�W��, c.�s���H, c.�q��, o.�q����, o.�e�f���, e.�m�W, d.�f�B���q�W��,
o.���f�H, o.�e�f�覡 
from �q���� as o inner join �Ȥ� as c on o.�Ȥ�s��=c.�Ȥ�s��
inner join ���u as e on o.���u�s��=e.���u�s��
inner join �f�B���q as d on o.�e�f�覡 = d.�f�B���q�s��
) as myTable

--CTE�y�k
with myTable
as
(
	select o.�q�渹�X, c.���q�W��, c.�s���H, c.�q��, o.�q����, o.�e�f���, e.�m�W, d.�f�B���q�W��,
	o.���f�H, o.�e�f�覡 
	from �q���� as o inner join �Ȥ� as c on o.�Ȥ�s��=c.�Ȥ�s��
	inner join ���u as e on o.���u�s��=e.���u�s��
	inner join �f�B���q as d on o.�e�f�覡 = d.�f�B���q�s��
) 


select �q�渹�X, ���q�W��, �s���H
from myTable



----------------------------------------------------------
--CTE���j
with getLevelTable
as
(
	select e.���u�s��, e.�m�W, e.�D��, 1 as ���h
	from ���u as e
	where e.�D�� is null	--�o����u���s���OE0001
	union all
	select e.���u�s��, e.�m�W, e.�D��, ���h+1 as ���h
	from ���u as e
	inner join getLevelTable on e.�D�� = getLevelTable.���u�s��
	--where e.�D�� = getLevelTable.���u�s��
)

select * from getLevelTable

--�N�W�CCTE���d�ߦ��إߦ��w�s�{��
alter proc getLevelTable
as
begin

with getLevelTable
as
(
	select e.���u�s��, e.�m�W, e.�D��, 1 as ���h
	from ���u as e
	where e.�D�� is null	--�o����u���s���OE0001
	union all
	select e.���u�s��, e.�m�W, e.�D��, ���h+1 as ���h
	from ���u as e
	inner join getLevelTable on e.�D�� = getLevelTable.���u�s��
	--where e.�D�� = getLevelTable.���u�s��
)

select * from getLevelTable

end

exec getLevelTable

with getLevelTable2
as
(
	select e.���u�s��, e.�m�W, e.�D��, 1 as ���h
	from ���u as e
	where e.�D�� is null
	union all
	select e.���u�s��, e.�m�W, e.�D��, ���h+1 as ���h
	from ���u as e inner join getLevelTable2 on e.�D�� = getLevelTable2.���u�s��
)

select * from getLevelTable2