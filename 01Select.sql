--SQL_DML
--select
--insert
--update
--delete
-------------------------------------------------------
-- use �᭱����Ʈw�W�١A�N�O�ϥγo�Ӹ�Ʈw
use �_��
go
-------------------------from �᭱����ƪ�Aselect����� �U�C�O�q�Ȥ��ƪ�̭���Ҧ����
--���涶��from -> where -> group by-> select->order by
select * from �Ȥ�
select �Ȥ�s��,���q�W��,�s���H,�s���H¾�� from �Ȥ�
-----------------------------------------------------------
--���O�Was�A�쥻�����W�� as �s�����W�١A�]�i�H�ΪŮ�
select �Ȥ�s��,���q�W�� as �Ȥ�W��, �s���H¾�� + �s���H as ���f, �l���ϸ�+�a�} as �a�}
from �Ȥ�

--------------------------------------------------
-- �ƭȹB��
select �q�渹�X, ���~�s��, ��� as ���, �ƶq as �ʶR�q, ��� * �ƶq  * (1 - �馩) as �p�p
from �q�����

-------------------------------------
--����ɶ�
select ���u�s��, �m�W, �X�ͤ��, datediff(year, �X�ͤ��, GETDATE()) as �~��
--, DATEDIFF(MONTH, �X�ͤ��, GETDATE()), DATEDIFF(DAY, �X�ͤ��, GETDATE())
from ���u
--datediff( ������(year/month/day), �X�ͤ��, getdate() ) ����϶��A
----------------------------------------------------------------
select ���u�s��, �m�W, datediff(year, �X�ͤ��, GETDATE()) as �~��
, DATEDIFF(year, ���Τ��, GETDATE()) as �~��
, DATEDIFF(year, �X�ͤ��, ���Τ��) as �J¾�~��
from ���u
