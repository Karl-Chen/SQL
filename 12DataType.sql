--��ƫ��A�ഫ
--cast(�Q�઺���e as �ഫ�������A)
select pt.���O�s��, pt.���O�W��, cast(count(*) as nvarchar)+'��' as ���~�ƶq
from ���~��� as p inner join ���~���O as pt on p.���O�s��=pt.���O�s��
group by pt.���O�s��, pt.���O�W��


-------------------------------------------------
--convert(�n�઺��ƫ��A, �n�Q�઺���e, �榡)
--12�O�ন�u�褸���
--112�O�ন�~���(19960702) 111�h�O1996/07/02
--120�O�ন����ɶ�
--select convert(char(10), �q����, 20), count(*) as �q���
select convert(varchar, �q����, 111) as �q����, count(*) as �q���
from �q����
group by �q����

select iif(�e�f��� is null, '�|���X�f', convert(varchar, �e�f���, 111)) as �e�f���, count(*) as �q���
from �q����
group by �e�f���

--isnull
select isnull(convert(varchar, �e�f���, 111), '�|���X�f') as �e�f���, count(*) as �q���
from �q����
group by �e�f���


select cast(�B�O as nvarchar) + '��' as �B�O
from �q����

select convert(char(12), �n�f���, 111) as �n�f���, count(*)
from �q����
group by �n�f���

select iif(�n�f��� is null, '�S�n�f', convert(char(12), �n�f���, 111))as �n�f���, count(*)
from �q����
group by �n�f���

select isnull(convert(varchar, �n�f���, 112), '�٨S�U�q') as �n�f���, count(*)
from �q����
group by �n�f���

select iif(�n�f��� is null, '�S�n�f', convert(char(12), �n�f���, 111))as �n�f���, �q�渹�X
from �q����