--�l�y
------------�D�ԭz
--select
--from
-----------�l�ԭz -----�r���ǫȤ�U�L�q��A�@�ӫȤ�i�H�U0~n���q��A�@�i�q��u�|�Q�@��Ȥ�U��
--�ҥH�n�Τl�ydistinct�������ж�
--���涶��from -> where -> group by-> select->order by
select distinct �Ȥ�s�� from �q����
-----------���ǲ��~���Q�R�L
select distinct ���~�s��
from �q�����
--------------------------------------------------
select distinct ���u�s��
from �q����
---------------------------------------------------
--------------top�l�y---���eN�����----���eN%������� �t�Xwith ties�A�P�ƧǪ��]�|�Q�C�X
select top 10 *
from �q�����
select top 10 percent *
from �q�����
-----TOP�t�X�Ƨ�(order by)�ϥΡA���W�ƧǡA�n����N�O�᭱�[desc�A��̫�
select top 15 with ties *
from �q�����
order by ��� desc

select top 10 with ties *
from �q�����
order by �ƶq desc

--�D��X�ӫ~�P�⪺�e�Q�W�A�ҥH�n�������ЭȡA�g�k�O���g�����A�gtop�A�o�̼g�X�ӬO�u���������~�s���μƶq�����Ъ��~�|����
select distinct top 10 with ties ���~�s��, �ƶq
from �q�����
order by �ƶq desc
---------------------------------------------------

select *
from �q����
