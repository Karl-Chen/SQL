--drop �R����Ʈw
drop database MyStore
--drop �R��table �����p���ܷ|�o�����p���~ �A�n�������p�R��
drop table [Member]

--�R��Member�POrder���������p(�Ѱ� foreign key)
alter table [Order]
	drop Constraint FK__Order__MemberID__3E52440B

drop table[Member]