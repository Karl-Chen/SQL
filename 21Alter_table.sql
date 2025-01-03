--alter 修改資料內容，增加欄位是修改定義而非create

--在product資料表中增加一個cateID的欄位
alter table [product]
	add CateID nchar(2) not null
--在product資料表中建立Categroy關聯
alter table[Product]
	add foreign key(CateID) references Category(CateID)

alter table[OrderDetail]
	add foreign key(ProductID) references [Product](ProductID)
