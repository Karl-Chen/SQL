--�s�W���
--insert into
--insert�@���u���@�Ӹ�ƪ�
--���i�H�@���s�W1~N�����
--insert into ��ƪ�(���1, ���2, ���3,......) values(��1, ��2, ��3,....)
--�D������p�G�OIDENTITY�y�����N����key
insert into �f�B���q(�f�B���q�W��, �q��) values('�j�a�f�B', '(07)555-9898')
--�@���b�P�Ӹ�ƪ��s�W�h�����
insert into �f�B���q(�f�B���q�W��, �q��)
values('�j�a�f�B', '(07)555-9898'),
('�j�a�f�B', '(07)555-9898'),
('�j�a�f�B', '(07)555-9898'),
('�j�a�f�B', '(07)555-9898')

--�ڥu�Q�n��f�B���q�W�١A�S���q��
insert into �f�B���q(�f�B���q�W��) values('�p�a�f�B')--�|����
insert into �f�B���q(�f�B���q�W��, �q��) values('�p�a�f�B', '')

--�Ȥ�, �ٲ����W�٪��g�k
--�Ȫ����ǭn�ӭ��ƪ���춶��
--�C����쳣�����n��ȡA���঳��줣����
insert into �Ȥ� values('KPPTR', '���̼�F���p', '�p��', '�d�x�H��', '�������e��ϳͱۥ|��105��', '806', '07-8210171', NULL)
insert into �f�B���q values(21, '�p�a�f�B', '')--�|�����A�]���D������OIDENTITY���y�����A�ҥH����ٲ����W��

-------------------------------------------------------------
--�ڷQ�ƻs�Ȥ��ƪ����t�@�Ӹ�ƪ���x�s�A���D������L�k�]�w
--select .... into.....(�o���O�u��藍�s�b����ƪ��s�W)
--�ƻs���u��ƪ�A�t�s�����u2��ƪ�
select * into ���u2 from ���u

--�ƻs�Ȥ��ƪ�A�t�s���Ȥ�2��ƪ�
select * into �Ȥ�2 from �Ȥ�
select * into �q����2 from �q����

--insert into ..... select.....�����O�u���w�s�b����ƪ��s�W�A�q�`�O�b���դ~�|�o�˷d
insert into ���u2
select * from ���u