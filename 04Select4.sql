--like�B��l�]�ҽk�d�ߡ^
--%:�N��0~n�ӥ��N�r��
--_:�N������@�Ӧr��
--[]:��b�����̪������@�Ӧr�N��
--�䦬�f�H�O�m����
--���涶��from -> where -> group by-> select->order by
select *
from �q����
where ���f�H like '��%'

select *
from �q����
where ���f�H like '��___'

select *
from �q����
where ���f�H like '[�������L��]%'

--like '[^�������L��]%' �ư��������L���}�Y���H�A^�u���}�Y

select *
from �q����
where ���f�H like '[^�������L��]%'

--between and
select *
from ���~���
--where �q�� >= 10 and �q��<= 20
where �q�� between 10 and 20
-- �]�i�H�g��where �q�� between 10 and 20

--in
select *
from �Ȥ�
--where �s���H¾�� = '���ƪ�' or �s���H¾��= '��o�H��' or �s���H¾��='�~��'
--�]�i�H�g��
where �s���H¾�� in ('���ƪ�','��o�H�s','�~��')