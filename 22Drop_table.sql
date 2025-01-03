--drop 刪除資料庫
drop database MyStore
--drop 刪除table 有關聯的話會發生關聯錯誤 ，要先把關聯刪掉
drop table [Member]

--刪除Member與Order之間的關聯(解除 foreign key)
alter table [Order]
	drop Constraint FK__Order__MemberID__3E52440B

drop table[Member]