--�˵��� --����ǰѼ�
--�]���o��@�i��A�`�P�d�ߦ@��
--�˵�������إ߮ɤ���begin end�]�_��
--select *
--from sys.databases


create view v_GetOrderListWithOtherData
as

select o.�q�渹�X, c.���q�W��, c.�s���H, c.�q��, o.�q����, o.�e�f���, e.�m�W, d.�f�B���q�W��,
o.���f�H, o.�e�f�覡 
from �q���� as o inner join �Ȥ� as c on o.�Ȥ�s��=c.�Ȥ�s��
inner join ���u as e on o.���u�s��=e.���u�s��
inner join �f�B���q as d on o.�e�f�覡 = d.�f�B���q�s��

select ���q�W��, �s���H from v_GetOrderListWithOtherData

select *
from v_GetOrderListWithOtherData inner join �q����� on v_GetOrderListWithOtherData.�q�渹�X=�q�����.�q�渹�X
where v_GetOrderListWithOtherData.�q�渹�X='120123'