----���涶��from -> where -> group by -> having -> select -> order by
select *, ���*�ƶq*(1 - �馩) as �p�p
from �q�����

select �q�渹�X, round(sum(���*�ƶq*(1-�馩)), 2) as �`�p
from �q�����
group by �q�渹�X

select �q�渹�X, sum(���*�ƶq*(1-�馩)) as �`�p
from �q�����
group by �q�渹�X

---------------------------------
--�E�X���
--count
select count(*) as ���u�H��
from ���u
select count(�q�渹�X) as �q�浧��
from �q����
--�|�ۤv����NULL���
select count(�e�f���) as �w�X�f�q�浧��
from �q����

select count(���f�H) as ���X�f�q�浧��
from �q����
where �e�f��� is NULL

--sum()
select sum(�q��)
from ���~���
select sum(���*�ƶq*(1-�馩)) as �p�p
from �q�����

--avage����avg()
select avg(�q��)
from ���~���

--max() min()
select max(�q��)
from ���~���

select min(�q��)
from ���~���

select sum(�q��) as ����`�M, avg(�q��) as �������, max(�q��) as �̰����, min(�q��) as �̧C���, count(*) as ���~����
from ���~���

select ���O�s��, sum(�q��) as ����`�M, avg(�q��) as �������, max(�q��) as �̰����, min(�q��) as �̧C���, count(*) as ���~����
from ���~���
group by ���O�s��