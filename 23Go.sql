create database MyStore2
go
use MyStore2
go

--建立資料表 定義欄位名稱、資料型態、長度、是否允許NULL、主鍵、備註 

--產品資料表 []是指要創造的名稱而非內建的函數 ProductID nchar length5 not null 主鍵
create table [Product](
	ProductID nchar(5) not null primary key,
	ProductName nvarchar(40) not null,
	Price money not null,
	[Description] nvarchar(200),
	Picture nvarchar(12) not null

)
go
--會員資料表
create table Member(
	MemberID nchar(6) not null primary key,
	[Name] nvarchar(27) not null,
	Gender bit not null,
	Point int not null default 0, --預設值是0
	Account nvarchar(12) not null unique,	--unique是指此欄位為唯一值
	[Password] nvarchar(20) not null			--通常密碼都會用雜湊過
)
go
--訂單資料表
create table [Order](
	OrderID nchar(17) not null primary key,
	OrderDate datetime not null default getDate(),		--預設今天日期
	MemberID nchar(6) not null,							--F.K
	ContactName nvarchar(27) not null,
	ContactAddress nvarchar(60) not null,
	foreign key(MemberID) references [Member](MemberID)	--參考Member Table的MemberID的關聯
)
go
--訂單明細資料表(雙主鍵)
create table OrderDetail(
	OrderID nchar(17) not null,
	ProductID nchar(5) not null,
	Qty int not null default 1,
	Price money not null,
	primary key(OrderID, ProductID),				--雙主鍵的做法
	foreign key(OrderID) references [Order](OrderID)
	--foreign key(ProductID) references [Product](ProductID)
)
go
--產品類別資料表
create table Category(
	CateID nchar(2) not null primary key,
	CateName nvarchar(20) not null
)

go
--alter 修改資料內容，增加欄位是修改定義而非create

--在product資料表中增加一個cateID的欄位
alter table [product]
	add CateID nchar(2) not null
go
--在product資料表中建立Categroy關聯
alter table[Product]
	add foreign key(CateID) references Category(CateID)
go
alter table[OrderDetail]
	add foreign key(ProductID) references [Product](ProductID)
go