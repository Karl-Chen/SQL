--inner join�ĤG�ؼg�k
--�Njoin������ƪ��@�ӷs��ƪ�A�M��A�N�s���e��
select *
from ������ as s inner join
(���~���O as pt inner join
(���~��� as p inner join
(�f�B���q as d inner join
(���u as e inner join
(�Ȥ� as c inner join
(�q����� as od inner join
�q���� as o
on od.�q�渹�X=o.�q�渹�X)
on c.�Ȥ�s��=o.�Ȥ�s��)
on e.���u�s��=o.���u�s��)
on d.�f�B���q�s��=o.�e�f�覡)
on p.���~�s��=od.���~�s��)
on pt.���O�s��=p.���O�s��)
on s.�����ӽs��=p.�����ӽs��

select *
from ������ as sup inner join
(���~���O as ptype inner join
(���~��� as pdata inner join
(�f�B���q as sendC inner join
(���u as p inner join
(�Ȥ� as cusm inner join
(�q���� as odata inner join
�q����� as odetail
on odata.�q�渹�X=odetail.�q�渹�X)
on cusm.�Ȥ�s��=odata.�Ȥ�s��)
on p.���u�s��=odata.���u�s��)
on sendC.�f�B���q�s��=odata.�e�f�覡)
on pdata.���~�s��=odetail.���~�s��)
on ptype.���O�s�� = pdata.���O�s��)
on sup.�����ӽs�� = pdata.�����ӽs��


--inner join �ĤT�ؼg�k
--�۵M�X�֪k�B���t�X�֪k

select *
from ������ as sup, ���~���O as ptype, ���~��� as pdata, �f�B���q as sendC, ���u as p, �Ȥ� as cusm,
�q���� as odata, �q����� as odetail
where odata.�q�渹�X=odetail.�q�渹�X and cusm.�Ȥ�s��=odata.�Ȥ�s�� and p.���u�s��=odata.���u�s��
and sendC.�f�B���q�s��=odata.�e�f�覡 and pdata.���~�s��=odetail.���~�s�� and ptype.���O�s�� = pdata.���O�s��
and sup.�����ӽs�� = pdata.�����ӽs��

select *
from ������ as sup, ���~���O as ptype, ���~��� as pdata, �f�B���q as sendC, ���u as p, �Ȥ� as cusm,
�q���� as odata, �q����� as odetail
where odata.�q�渹�X=odetail.�q�渹�X and cusm.�Ȥ�s��=odata.�Ȥ�s�� and p.���u�s��=odata.���u�s�� and
sendC.�f�B���q�s��=odata.�e�f�覡 and pdata.���~�s��=odetail.���~�s�� and ptype.���O�s�� = pdata.���O�s�� and
sup.�����ӽs�� = pdata.�����ӽs��