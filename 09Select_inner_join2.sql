SELECT          �q����.�q�渹�X, �Ȥ�.���q�W��, �Ȥ�.�s���H, �q����.�q����, �q����.�n�f���, �q����.�e�f���, 
                            ���~���.���~, ���~���O.���O�W��, round(sum(�q�����.���*�q�����.�ƶq*(1-�q�����.�馩)),0) as �p�p
FROM              �q���� INNER JOIN
                            �Ȥ� ON �q����.�Ȥ�s�� = �Ȥ�.�Ȥ�s�� INNER JOIN
                            �q����� ON �q����.�q�渹�X = �q�����.�q�渹�X INNER JOIN
                            ���u ON �q����.���u�s�� = ���u.���u�s�� INNER JOIN
                            ���~��� ON �q�����.���~�s�� = ���~���.���~�s�� INNER JOIN
                            ������ ON ���~���.�����ӽs�� = ������.�����ӽs�� INNER JOIN
                            ���~���O ON ���~���.���O�s�� = ���~���O.���O�s�� INNER JOIN
                            �f�B���q ON �q����.�e�f�覡 = �f�B���q.�f�B���q�s��
group by		�q����.�q�渹�X, �Ȥ�.���q�W��, �Ȥ�.�s���H, �q����.�q����, �q����.�n�f���, �q����.�e�f���, 
                            ���~���.���~, ���~���O.���O�W��
-------------------------------------------------------------
select �Ȥ�.*
from	�Ȥ�
-------------------------------------------------------------


SELECT          pdata.���~�s��, pdata.���~, pdata.�Ϥ�, pdata.�����ӽs��, e.���u�s��, e.�m�W, e.�^��W, sup.�����ӽs�� AS Expr1, 
                            sup.������, sup.�s���H, sup.�s���H¾��, odata.�q�渹�X, odata.�Ȥ�s��, odata.���u�s�� AS Expr2, 
                            odata.�q����, od.���~�s�� AS Expr3, od.���, od.�ƶq
FROM              �q����� AS od INNER JOIN
                            �q���� AS odata ON od.�q�渹�X = odata.�q�渹�X INNER JOIN
                            ���~��� AS pdata ON od.���~�s�� = pdata.���~�s�� INNER JOIN
                            ������ AS sup ON pdata.�����ӽs�� = sup.�����ӽs�� INNER JOIN
                            ���~���O AS ptype ON pdata.���O�s�� = ptype.���O�s�� INNER JOIN
                            ���u AS e ON odata.���u�s�� = e.���u�s��

