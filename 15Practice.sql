--1. �иռg�@�X�֬d�ߡA�d�ߥX�q�ʤ�����b1996�~7��ë��w�e�f���q���u�տߦv��K�v�����q�椧�q�f���Ӹ�ơA
--�æC�X�q�渹�X�B���~���O�W�١B���~�W�١B���~�q�ʳ���B���~�q�ʼƶq�B���~�����p�p�B�Ȥ�s���B�Ȥ�W�١B
--���f�H�W�r�B�q�ʤ���B�B�z�q����u���m�W�B�f�B���q�B�����ӦW�ٵ���ƶ��ءA
--�䤤���~�����p�p�ХH�|�ˤ��J�p��ܾ�Ʀ�C
select odata.�q�渹�X, ptype.���O�W��, pdata.���~, odetail.���, odetail.�ƶq,
round(odetail.���*odetail.�ƶq*(1-(odetail.�馩 / 100)), 0) as �p�p,
cus.�Ȥ�s��, cus.���q�W��, odata.���f�H, odata.�q���� as �q�f���, worker.�m�W, ts.�f�B���q�W��,
supp.������
from �q���� as odata
inner join �q����� as odetail on odata.�q�渹�X=odetail.�q�渹�X
inner join ���~��� as pdata on pdata.���~�s��=odetail.���~�s��
inner join ���~���O as ptype on pdata.���O�s��=ptype.���O�s��
inner join �Ȥ� as cus on cus.�Ȥ�s��=odata.�Ȥ�s��
inner join ���u as worker on worker.���u�s��=odata.���u�s��
inner join �f�B���q as ts on ts.�f�B���q�s��=odata.�e�f�覡
inner join ������ as supp on supp.�����ӽs��=pdata.�����ӽs��
where ts.�f�B���q�W��='�տߦv��K' and odata.�q���� between '1996-07-01' and '1996-08-01'

--2. �иռg�@�X�֬d�ߡA�d�߫Ȥ�u�s�s�Ȧ�v���~�өҭq�ʪ��Ҧ����~�A�òέp�X�U�ز��~���q�ʼƶq
--��X��߬��Ȥ�s���B���q�W�١B�p���H�B���~�W�١B�q�ʼƶq

select cus.�Ȥ�s��, cus.���q�W��, cus.�s���H, pdata.���~, sum(odetail.�ƶq) as �q���`�q
from �q���� as odata
inner join �q����� as odetail on odata.�q�渹�X=odetail.�q�渹�X
inner join �Ȥ� as cus on odata.�Ȥ�s��=cus.�Ȥ�s��
inner join ���~��� as pdata on pdata.���~�s��=odetail.���~�s��
group by cus.�Ȥ�s��, cus.���q�W��, cus.�s���H, pdata.���~, odetail.�ƶq
having cus.���q�W��='�s�s�Ȧ�'


--3. �ЧQ��exists�B��l�t�X�l�d�ߦ��A��X���ǫȤ�q���U�L�q��A�æC�X�Ȥ᪺�Ҧ����C
--(���i�Ψ�in�B��A�礣�i�ΦX�֬d�ߦ�) 
select *
from �Ȥ� as c
where not exists (select * from �q���� as o where o.�Ȥ�s��=c.�Ȥ�s��)


--4. �ЧQ��in�B��l�t�X�l�d�ߦ��A�d�߭��ǭ��u���B�z�L�q��A�æC�X���u�����u�s���B�m�W�B¾�١B�����������X�B
--�������C(���i�Ψ�exists�B��A�礣�i�ΦX�֬d�ߦ�) 

select e.���u�s��, e.�m�W, e.¾��, e.�����������X, e.����
from ���u as e
where e.���u�s�� in (select distinct ���u�s�� from �q����)


--5. �ЦX�֬d�߻P�l�d�ߨ�ؼg�k�A�C�X1998�~�שҦ��Q�q�ʹL�����~��ơA�æC�X���~���Ҧ����A�B�̲��~�s���Ѥp��j�ƧǡC
--(�g�X�֬d�߮ɤ��o�Υ���l�d�ߦ��A�g�l�d�߮ɤ��o�Υ���X�֬d�ߦ�)
select * 
from ���~��� as pdata
inner join �q����� as odetail on pdata.���~�s��=odetail.���~�s��
inner join �q���� as odata on odetail.�q�渹�X=odata.�q�渹�X
where odata.�q���� between '1998-1-1' and '1998-12-31'
order by pdata.���~�s��


select * from ���~��� where ���~�s�� in
(select ���~�s�� from �q����� where �q�渹�X in
(select �q�渹�X from �q���� where year(�q����)=1998))
order by ���~�s��


--�X�֬d��
select distinct p.*
from ���~��� as p inner join �q����� as od on p.���~�s��=od.���~�s��
inner join �q���� as o on o.�q�渹�X=od.�q�渹�X
where o.�q���� between '1998-1-1' and '1998/12/31'
order by p.���~�s��
--where year(o.�q����) = 1998

--�l�d��
select *
from ���~���
where ���~�s�� in
(select ���~�s�� from �q����� where �q�渹�X in (
select �q�渹�X from �q���� where �q���� between '1998-1-1' and '1998-12-31'))
order by ���~�s��

