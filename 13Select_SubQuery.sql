--�l�d��(Sub Query)
--�եX�Y�@�Ȥ᪺�Ҧ��q�����

select *
from �q����
where �Ȥ�s�� = (select �Ȥ�s�� from �Ȥ�
where ���q�W��='�j�ث��x�_')

select *
from �q����
where ���u�s�� = (select ���u�s�� from ���u
where �m�W='�����P')

select *
from �q����
where �e�f�覡 = (select �f�B���q�s�� from �f�B���q
where �f�B���q�W��='�տߦv��K')

select od.*
from �q���� as od inner join
���u as e on od.���u�s��=e.���u�s��
where e.�m�W='�����P'

---------------------------
--�X�֬d�ߪ��į��l�d�ߦn
---------------------------
--�Ьd�߭��ǰӫ~������j������ӫ~���������
--�l�d��
select *
from ���~���
where �q�� > (select avg(�q��)
from ���~���)
--�X�֬d��(�ۨ��X��)
select p.���~�s��, p.���~, p.�q��, avg(p2.�q��)
from ���~��� as p inner join ���~��� as p2 on (p.���~�s�� != p2.���~�s�� or p.���~�s�� = p2.���~�s��)
group by p.���~�s��, p.���~, p.�q��
having p.�q�� > avg(p2.�q��)
--�۵M�X��
select p.���~�s��, p.���~, p.�q��, avg(p2.�q��)
from ���~��� as p, ���~��� as p2
group by p.���~�s��, p.���~, p.�q��
having p.�q�� > avg(p2.�q��)
--cross join(���d��n�B��)
select p.���~�s��, p.���~, p.�q��, avg(p2.�q��)
from ���~��� as p cross join ���~��� as p2 
group by p.���~�s��, p.���~, p.�q��
having p.�q�� > avg(p2.�q��)

----------------------------------------------------
--���ǫȤ�R�L�ަ�
--�X�֬d��
select distinct c.*, pdata.���~
from �q���� as odata 
inner join �q����� as odetail on odata.�q�渹�X = odetail.�q�渹�X
inner join �Ȥ� as c on odata.�Ȥ�s�� = c.�Ȥ�s��
inner join ���~��� as pdata on odetail.���~�s�� = pdata.���~�s��
where pdata.���~='�ަ�'
--�l�d�� �u�n���i��|�d�X�h����ơA�N����in�A����O�I
select *
from �Ȥ�
where �Ȥ�s�� in (select �Ȥ�s�� from �q����
where �q�渹�X in (select �q�渹�X from �q�����
where ���~�s�� in (select ���~�s�� from ���~���
where ���~ = '�ަ�')))

--���ǭ��u�B�z�L�Ȥ�W�١u���H�귽�v���q��
--�X�֬d��
select distinct e.*
from ���u as e
inner join �q���� as odata on e.���u�s�� = odata.���u�s��
inner join �Ȥ� as c on c.�Ȥ�s�� = odata.�Ȥ�s��
where c.���q�W�� = '���H�귽'
--�l�d��
select *
from ���u
where ���u�s�� in (select distinct ���u�s�� from �q����
where �Ȥ�s�� in (select �Ȥ�s�� from �Ȥ�
where ���q�W�� = '���H�귽'))


--�d���U�L�檺�Ȥ�
--in�B��l
select *
from �Ȥ�
where �Ȥ�s�� in (select distinct �Ȥ�s�� from �q����)

--exists�B��l
select *
from �Ȥ� as c
where exists(select * from �q���� as o where c.�Ȥ�s�� = o.�Ȥ�s��)

--�۷������Ԩ�̫�h�g
select *
from ���u as e
where exists (select * from �q���� as odata
where exists (select * from �Ȥ� as c
where e.���u�s�� = odata.���u�s�� and c.�Ȥ�s�� = odata.�Ȥ�s�� and c.���q�W��='���H�귽'))

select *
from �Ȥ�
where �Ȥ�s�� in (select �Ȥ�s�� from �q����
where �q�渹�X in (select �q�渹�X from �q�����
where ���~�s�� in (select ���~�s�� from ���~���
where ���~ = '�ަ�')))

select *
from �Ȥ� as c
where exists(select * from �q���� as odata
where exists(select * from �q����� as odetail
where exists(select * from ���~��� as pdata
where pdata.���~ = '�ަ�' and pdata.���~�s�� = odetail.���~�s�� and odetail.�q�渹�X = odata.�q�渹�X and odata.�Ȥ�s�� = c.�Ȥ�s��)))