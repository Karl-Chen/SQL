--�ק���
--update
--update�@���u���@�Ӹ�ƪ�
--���i�H�@����s1~N�����
update �f�B���q
set �f�B���q�W��='���a�f�B', �q��='(08)998-8777'
where �f�B���q�s��=11

update �f�B���q
set �f�B���q�W��='���a�f�B', �q��='(08)998-8787'
where �f�B���q�W��='�j�a�f�B'

update �Ȥ�
set �s���H='�p�^', �s���H¾��='�~�ȧU�z'
where �Ȥ�s��='KPPTR'

--��B�z�L100�i(�t)�H�W�q�檺���u�A�������[�W�u�Ծġv��r
select ���u�s��, count(*) as �B�z�i��
from �q����
group by ���u�s��
having count(*) >= 100


update ���u
set ����=���� + ', �Ծ�'
where ���u�s�� in (select ���u�s��
from �q����
group by ���u�s��
having count(*) >= 100)

--��q���B�z�L�q�檺���u, �������[�W���Ψ�r
select e.*
from �q���� as o right join ���u as e on o.���u�s��=e.���u�s�� 
where o.���u�s�� is null

update ���u
set ����=���� + ', ����'
from �q���� as o right join ���u as e on o.���u�s��=e.���u�s�� 
where o.���u�s�� is null


update ���u
set ����=���� + ', �ӥ�B�ͪ�'
from �q���� as o right join ���u as e on o.���u�s��=e.���u�s��
where o.���u�s�� is null