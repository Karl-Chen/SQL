--DDL Trigger
--insert update delete ==>DML
--Create  alter  drop ==> DDL


--�ڭn��o�Ӹ�Ʈw�̩Ҧ��� table ���]�w����Ū

create trigger readOnlyTable on database
for drop_table, alter_table
as
begin

	rollback

end


drop table �Ȥ�2

-------------------------------
--���θ�Ʈw�h�Ū�Trigger
disable trigger readOnlyTable on database

--�ҥθ�Ʈw�h�Ū�Trigger
enable trigger readOnlyTable on database


--�ҥθ�ƪ�W��Trigger
enable trigger getUpdateDataTable on �Ȥ�

--���θ�ƪ�W��Trigger
disable trigger getUpdateDataTable on �Ȥ�
