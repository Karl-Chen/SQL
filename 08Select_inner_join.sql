

select *
from �q�����

select *
from ���~���

--�ⲣ�~��ƨ֤J�q����ӥ�inner join�A�H�q����Ӫ����~�s���۷�󲣫~��ƪ����~�s�������p
select �q�����.�q�渹�X, �q�����.���~�s��, ���~���.���~, �q�����.���, �q�����.�ƶq,�q�����.�馩
from �q����� inner join ���~��� on �q�����.���~�s��=���~���.���~�s��

--�Q�ΧO�W�Y�uDML as
select od.�q�渹�X, od.���~�s��, p.���~, od.���, od.�ƶq,od.�馩
from �q����� as od inner join ���~��� as p on od.���~�s��=p.���~�s��

select od.�q�渹�X, od.���~�s��, p.���~, od.���, p.�q��, p.�q�� - od.��� as ����Q,
(p.�q�� - od.���)*od.�ƶq as ��Q, od.�ƶq,od.�馩, (p.�q�� - od.���)*od.�ƶq*(1-od.�馩) as �b�Q
from �q����� as od inner join ���~��� as p on od.���~�s��=p.���~�s��

--�[�W��i�� inner join �ĤG�i�� on ������ inner join �ĤT�i�� on ������
select od.�q�渹�X, p.���O�s��, pt.���O�W��, od.���~�s��, p.���~, od.���, p.�q��, p.�q�� - od.��� as ����Q,
(p.�q�� - od.���)*od.�ƶq as ��Q, od.�ƶq,od.�馩, (p.�q�� - od.���)*od.�ƶq*(1-od.�馩) as �b�Q
from �q����� as od inner join ���~��� as p on od.���~�s��=p.���~�s��
inner join ���~���O as pt on pt.���O�s��=p.���O�s��

select ot.�q�渹�X, cus.���q�W��, cus.�s���H, cus.�s���H¾��, ot.�q����, ot.�n�f���, ot.�e�f���, q.�m�W
from �q���� as ot inner join �Ȥ� as cus on ot.�Ȥ�s��=cus.�Ȥ�s��
inner join ���u as q on ot.���u�s��=q.���u�s��

------------------------------------------------------------------------------------------
select *
from �q����� as od
inner join �q���� as odata on od.�q�渹�X=odata.�q�渹�X
inner join ���~��� as pdata on od.���~�s��=pdata.���~�s��
inner join ���~���O as pt on pdata.���O�s��=pt.���O�s��
inner join ������ as sp on pdata.�����ӽs��=sp.�����ӽs��
inner join �Ȥ� as cus on odata.�Ȥ�s��=cus.�Ȥ�s��
inner join ���u as q on odata.���u�s��=q.���u�s��
inner join �f�B���q as trans on odata.�e�f�覡=trans.�f�B���q�s��
-----------------------------------------------------------------------------------------
-------�C��Ȥ�U�榸��
--�ЦC�X �Ȥ�s��, �Ȥ�W��, �p���H, �p���H¾��, �U�榸��
select cus.�Ȥ�s��, cus.���q�W��, cus.�s���H, cus.�s���H¾��, count(*) as �U�榸��
from �q����� as od
inner join �q���� as odata on od.�q�渹�X=odata.�q�渹�X
inner join ���~��� as pdata on od.���~�s��=pdata.���~�s��
inner join ���~���O as pt on pdata.���O�s��=pt.���O�s��
inner join ������ as sp on pdata.�����ӽs��=sp.�����ӽs��
inner join �Ȥ� as cus on odata.�Ȥ�s��=cus.�Ȥ�s��
inner join ���u as q on odata.���u�s��=q.���u�s��
inner join �f�B���q as trans on odata.�e�f�覡=trans.�f�B���q�s��
group by cus.�Ȥ�s��, cus.���q�W��, cus.�s���H, cus.�s���H¾��
order by �U�榸�� desc

-----------------------------------------------------------------------------------------
-------�C��Ȥ�U�榸��
--�ЦC�X �Ȥ�s��, �Ȥ�W��, �p���H, �p���H¾��, �U�榸��
select cus.�Ȥ�s��, cus.���q�W�� as �Ȥ�W��, cus.�s���H, cus.�s���H¾��, count(*) as �U�榸��
from �q���� as odata
inner join �Ȥ� as cus on odata.�Ȥ�s��=cus.�Ȥ�s��
group by cus.�Ȥ�s��, cus.���q�W��, cus.�s���H, cus.�s���H¾��
order by �U�榸�� desc

--------------------------------------------
--��X���O�`�B>=3�U�����Ȥ�
--�C�X �Ȥ�s��, �Ȥ�W��, �p���H, �p���H¾��, �U�榸��, ���O�`�B, �������O�B
--�åH���O�`�B����ƧǡA�䦸�ΤU�榸�ƱƧ�
select cus.�Ȥ�s��, cus.���q�W�� as �Ȥ�W��, cus.�s���H, cus.�s���H¾��, count(*) as �U�榸��,
round(sum((od.���*od.�ƶq)*(1-od.�馩)), 0) as ���O�`�B,
round(sum((od.���*od.�ƶq)*(1-od.�馩)) / count(*), 0) as �������O�B
from �q���� as odata
inner join �q����� as od on odata.�q�渹�X=od.�q�渹�X
inner join �Ȥ� as cus on odata.�Ȥ�s��=cus.�Ȥ�s��
group by cus.�Ȥ�s��, cus.���q�W��, cus.�s���H, cus.�s���H¾��
having sum((od.���*od.�ƶq)*(1-od.�馩)) >= 30000
order by ���O�`�B desc, �U�榸��  desc

-----------------------------------------------------------------
--���u�B�z�X�i�q�� group by�u�n�g�쥻��檺���A�ҥHdatediff�̭��u���Ψ��U�Τ���A�u�g���Τ��
--datediff�O�����϶��A�e����year�O�H�~�����A getdate()�O���o�{�b������ɶ�
select odata.���u�s��, e.�m�W, DATEDIFF(year, e.���Τ��, GETDATE()) as �~��, count(*) as �B�z�q���,
count(*) / DATEDIFF(year, e.���Τ��, GETDATE()) as �C�~�����B�z�q���
from �q���� as odata
inner join ���u as e on odata.���u�s��=e.���u�s��
group by odata.���u�s��, e.�m�W, e.���Τ��
order by �B�z�q��� desc, �~��

select odata.���u�s��, e.�m�W, DATEDIFF(year, e.�X�ͤ��, GETDATE()) as �~��, count(*) as �B�z�q���,
count(*) / DATEDIFF(year, e.���Τ��, GETDATE()) as �C�~�����B�z�q���
from �q���� as odata
inner join ���u as e on odata.���u�s��=e.���u�s��
group by odata.���u�s��, e.�m�W, e.�X�ͤ��, e.���Τ��
order by �B�z�q��� desc, �~��