--Delete�R�����
--Delete
--Delete�@���u���@�Ӹ�ƪ�
--���i�H�@����s1~N�����

delete from �f�B���q
where �f�B���q�s��=9

--�����R���k
delete from ���u
where ���u�s�� in (select ���u�s��
from �q����
group by ���u�s��
having count(*) >= 100)

--�[�W�X�֬d��
delete from ���u
from �q���� as o right join ���u as e on o.���u�s��=e.���u�s��
where o.���u�s�� is null