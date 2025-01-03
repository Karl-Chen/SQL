--流程控制
--while
--做1加到100

declare @i int = 1, @sum int = 0
while @i <= 100
begin
	set @sum+=@i
	set @i+=1
end
print @sum

go
--*
--**
--***
--****
--*****

declare @i int =0, @star nvarchar(max) = ''
while @i < 10
begin
	set @star = @star + '*'
	set @i += 1
	print @star
end

