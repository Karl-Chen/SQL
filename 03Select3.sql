--��ƿz��
--���涶��from -> where -> group by-> select->order by
select *
from �Ȥ�
where �s���H¾�� = '���ƪ�'

select *
from �Ȥ�
where ���q�W�� = '���֧�'

select *
from �Ȥ�
where �Ȥ�s�� = 'DUMON'

select *
from �Ȥ�
where �a�} like '�s�˥�*'
-- �d1994�~��¾�����u
select *
from ���u
where ���Τ��>='1994-1-1'
--�u���~
--where year(���Τ��)>='1994'
--where ���Τ�� >= '1994'

--�d�߲��~�w�s�q��0�B���U�[�����
select *
from ���~���
where �w�s�q=0 and �w�U�[=0

--�d�߲��~�w���s�q�q10�����~
select *
from ���~���
where �w���s�q < 10

--�d�߭��ǰӫ~���~�w���s�q>�w�s�q�����~
select *
from ���~���
where �w���s�q > �w�s�q + �w�q�ʶq

--��X�|���X�f���q��
select *
from �q����
where �e�f��� is NULL