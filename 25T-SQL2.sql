--�y�{����
--if/else
--�p�G����120�����H�W����40���q�R�b��
--140�����H�W�R����
--120�����H�U�K��

declare @height int
set @height=130

if @height >= 140
begin
	print '����'
end
else if @height >= 120
begin
	print '�b��'
end
else
	print '�K��'

