--alter �ק��Ƥ��e�A�W�[���O�ק�w�q�ӫDcreate

--�bproduct��ƪ��W�[�@��cateID�����
alter table [product]
	add CateID nchar(2) not null
--�bproduct��ƪ��إ�Categroy���p
alter table[Product]
	add foreign key(CateID) references Category(CateID)

alter table[OrderDetail]
	add foreign key(ProductID) references [Product](ProductID)
