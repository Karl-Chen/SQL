--流程控制
--case
select 員工編號, 姓名,  iif(性別=0, '小姐', '先生'), 出生日期 from 員工
--簡單case
select 員工編號, 姓名,  
	case 性別
		when 0 then '小姐'
		when 1 then '先生'
	end as '稱謂'
, 出生日期 from 員工


--搜尋case
declare @gender int, @result nvarchar(5) = 'abd'
set @gender = 1
set @result = 
case 
	when @gender=1 and @result='abc' then'先生'
	when @gender=0 then '小姐'
	else '未知'
end
print @result

declare @height int = 150
declare @result nvarchar(5)
set @result = 
case
	when @height>=140 then '全票'
	when @height>=120 then '半票'
	else '免票'
end
print @result



declare @money int
set @money = 101
declare @call nvarchar(100)
set @call = 
case
	when @money > 10000 then '有錢人'
	when @money > 5000 then '小康'
	when @money > 1000 then '有點窮'
	when @money > 100 then '窮'
	when @money > 0	then '赤貧'
	else '被鬼抓走了'
end
print @call

declare @money int = 101
if @money > 10000 begin print '有錢人' end
else if @money > 5000 print '小康'
else if @money > 1000 begin print '有點窮' end
else if @money > 100 print '窮'
else if @money > 0	begin print '赤貧' end
else print '被鬼抓走了'