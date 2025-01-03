create database MyStore2
go
use MyStore2
go

--�إ߸�ƪ� �w�q���W�١B��ƫ��A�B���סB�O�_���\NULL�B�D��B�Ƶ� 

--���~��ƪ� []�O���n�гy���W�٦ӫD���ت���� ProductID nchar length5 not null �D��
create table [Product](
	ProductID nchar(5) not null primary key,
	ProductName nvarchar(40) not null,
	Price money not null,
	[Description] nvarchar(200),
	Picture nvarchar(12) not null

)
go
--�|����ƪ�
create table Member(
	MemberID nchar(6) not null primary key,
	[Name] nvarchar(27) not null,
	Gender bit not null,
	Point int not null default 0, --�w�]�ȬO0
	Account nvarchar(12) not null unique,	--unique�O������쬰�ߤ@��
	[Password] nvarchar(20) not null			--�q�`�K�X���|������L
)
go
--�q���ƪ�
create table [Order](
	OrderID nchar(17) not null primary key,
	OrderDate datetime not null default getDate(),		--�w�]���Ѥ��
	MemberID nchar(6) not null,							--F.K
	ContactName nvarchar(27) not null,
	ContactAddress nvarchar(60) not null,
	foreign key(MemberID) references [Member](MemberID)	--�Ѧ�Member Table��MemberID�����p
)
go
--�q����Ӹ�ƪ�(���D��)
create table OrderDetail(
	OrderID nchar(17) not null,
	ProductID nchar(5) not null,
	Qty int not null default 1,
	Price money not null,
	primary key(OrderID, ProductID),				--���D�䪺���k
	foreign key(OrderID) references [Order](OrderID)
	--foreign key(ProductID) references [Product](ProductID)
)
go
--���~���O��ƪ�
create table Category(
	CateID nchar(2) not null primary key,
	CateName nvarchar(20) not null
)

go
--alter �ק��Ƥ��e�A�W�[���O�ק�w�q�ӫDcreate

--�bproduct��ƪ��W�[�@��cateID�����
alter table [product]
	add CateID nchar(2) not null
go
--�bproduct��ƪ��إ�Categroy���p
alter table[Product]
	add foreign key(CateID) references Category(CateID)
go
alter table[OrderDetail]
	add foreign key(ProductID) references [Product](ProductID)
go