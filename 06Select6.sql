--group by ���s�դ���
--distinct ��������
--���涶��from -> where -> group by -> having -> select -> order by
select distinct ¾��
from ���u

select ¾��
from ���u
group by ¾��

select distinct �s���H¾��
from �Ȥ�

select �s���H¾��
from �Ȥ�
group by �s���H¾��

--�έp���u���C�@��¾�٦U���h�֤H
select ¾��, count(¾��)as �H��
from ���u
group by ¾��

select �s���H¾��, count(*) as �H��
from �Ȥ�
Group by �s���H¾��

--�C�i�q��q�ʤF�X�ذӫ~
--�q��s���B�X�ذӫ~

select �q�渹�X, count(���~�s��) as �X�ذӫ~
from �q�����
group by �q�渹�X

--�C�i�q��q�ʪ��ӫ~�`�q
select �q�渹�X, sum(�ƶq) as �`�q
from �q�����
group by �q�渹�X

--�C�i�q���`�B
select �q�渹�X, ���~�s��, round(���*�ƶq*(1-�馩), 2) as �p�p
from �q�����

select �q�渹�X, round(sum(���*�ƶq*(1-�馩)),2) as �q���`�B
from �q�����
group by �q�渹�X

--�C�X�q���`�B�̰��e10����� 

select top 10 with ties �q�渹�X, round(sum(���*�ƶq*(1-�馩)),2) as �q���`�B
from �q�����
group by �q�渹�X
order by �q���`�B desc

-------------------�C�ӫȤ�U�榸��
select �Ȥ�s��, count(*) as �U�榸��
from �q����
group by �Ȥ�s��
order by �U�榸�� desc

------------------���ǫȤ�U��W�L10��
select �Ȥ�s��, count(*) as �U�榸��
from �q����
group by �Ȥ�s��
having count(*) > 10
order by �U�榸�� desc
--having��where�\�Τ@�ˡA�ӥBhaving �i�H����E�X�禡�Ahaving�Ogroup by�l�y�A�ҥHhaving depand�bgroup by�Awhere���涶�Ǥ�group by��having�u��

---------�έp�C�ӭ��u�B�z�q�檺����
select ���u�s��, count(*) as �B�z�q�榸��
from �q����
group by ���u�s��
order by �B�z�q�榸�� desc

--�έp�C����u�B�z�C��Ȥ�q�檺����
--
select ���u�s��, �Ȥ�s��, count(*) as �A�Ȧ���
from �q����
group by ���u�s��, �Ȥ�s��
order by ���u�s��
-------------------------------------------
--��X�e10�W�P������ӫ~(�q�̦h)
select top 10 with ties ���~�s��, sum(�ƶq) as �`�q
from �q�����
group by ���~�s��
order by �`�q desc

-----------------------------------------
--��X�e10�W�P������ӫ~(��~�B�̦h)
select top 10 with ties ���~�s��, round(sum(���*�ƶq*(1-�馩)), 0) as �`�p
from �q�����
group by ���~�s��
order by �`�p desc


--���g���� select -> from -> where -> group by -> having -> order by
--���涶�� from -> where - > group by -> having -> select -> order by