--�p�G�q��ӫ~�q�ʼƶq�j��Ӱӫ~���w�s�q�ΰ���j��q��A�h�q�ʥ���
--�Y�q�ʦ��\�A�h�����q�ʪ��w�s�q
--�Ȥ�b�U��ɡA�|�ʥΨ�T�i��ƪ�-�q���ơB�q����ӡB���~���
select * from ���~���


--�s�W�@�i�q�ʳ�
--insert ��Ӹ�ƪ�-�q���ơB�q�����

alter trigger checkOrderQtyPrice on �q�����
after insert
as
begin
	--�p�G�q��ӫ~�q�ʼƶq�j��Ӱӫ~���w�s�q�ΰ���j��q��A�h�q�ʥ���
	--�Y�q�ʦ��\�A�h�����q�ʪ��w�s�q
	declare @ProductPice money, @ProductQty int, @ProductID int, @OrderPrice money,
	@OrderQty int
	select @OrderPrice = ���, @OrderQty = �ƶq, @ProductID = ���~�s�� from inserted

	select @ProductPice = �q��, @ProductQty = �w�s�q from ���~���
	where ���~���.���~�s��=@ProductID

	if @OrderPrice > @ProductPice
		rollback
	else if @OrderQty >= @ProductQty
		rollback
	else
	begin
		update ���~���
		set �w�s�q=�w�s�q - @OrderQty
		where ���~�s��=@ProductID
	end
end

select * from �q����� where �q�渹�X='10263'

insert into �q����� values('10263', 1, 18, 38, 0)