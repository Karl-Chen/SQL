--CTE查詢
--用於遞迴的過程
--集合運算：聯集 union 交集 intersect, 差集except
--union all，將表上下併在一起
--第一層
select e.員工編號, e.姓名, 1 as 階層 from 員工 as e
where e.主管 is null	--這位員工的編號是E0001
union all


--第二層
select e.員工編號, e.姓名, 2 as 階層 from 員工 as e
where e.主管 = 'E0001'	--這位員工的編號是E0001
union all


select e.員工編號, e.姓名, 3 as 階層 from 員工 as e
where e.主管 in ('E0004', 'E0013')	
union all


select e.員工編號, e.姓名, 4 as 階層 from 員工 as e
where e.主管 in ('E0005')	
union all


select e.員工編號, e.姓名, 5 as 階層 from 員工 as e
where e.主管 in ('E0002', 'E0006', 'E0007', 'E0009')	
union all


select e.員工編號, e.姓名, 6 as 階層 from 員工 as e
where e.主管 in ('E0003', 'E0008', 'E0012', 'E0014')	--到第六層就沒任何員工，可以收工了

--------------------------------------------------------------


--子查詢
select 訂單號碼, 公司名稱, 連絡人, 電話, 訂單日期, 送貨日期, 姓名, 貨運公司名稱,
收貨人, 送貨方式 
from
(
select o.訂單號碼, c.公司名稱, c.連絡人, c.電話, o.訂單日期, o.送貨日期, e.姓名, d.貨運公司名稱,
o.收貨人, o.送貨方式 
from 訂單資料 as o inner join 客戶 as c on o.客戶編號=c.客戶編號
inner join 員工 as e on o.員工編號=e.員工編號
inner join 貨運公司 as d on o.送貨方式 = d.貨運公司編號
) as myTable

--CTE語法
with myTable
as
(
	select o.訂單號碼, c.公司名稱, c.連絡人, c.電話, o.訂單日期, o.送貨日期, e.姓名, d.貨運公司名稱,
	o.收貨人, o.送貨方式 
	from 訂單資料 as o inner join 客戶 as c on o.客戶編號=c.客戶編號
	inner join 員工 as e on o.員工編號=e.員工編號
	inner join 貨運公司 as d on o.送貨方式 = d.貨運公司編號
) 


select 訂單號碼, 公司名稱, 連絡人
from myTable



----------------------------------------------------------
--CTE遞迴
with getLevelTable
as
(
	select e.員工編號, e.姓名, e.主管, 1 as 階層
	from 員工 as e
	where e.主管 is null	--這位員工的編號是E0001
	union all
	select e.員工編號, e.姓名, e.主管, 階層+1 as 階層
	from 員工 as e
	inner join getLevelTable on e.主管 = getLevelTable.員工編號
	--where e.主管 = getLevelTable.員工編號
)

select * from getLevelTable

--將上列CTE的查詢式建立成預存程序
alter proc getLevelTable
as
begin

with getLevelTable
as
(
	select e.員工編號, e.姓名, e.主管, 1 as 階層
	from 員工 as e
	where e.主管 is null	--這位員工的編號是E0001
	union all
	select e.員工編號, e.姓名, e.主管, 階層+1 as 階層
	from 員工 as e
	inner join getLevelTable on e.主管 = getLevelTable.員工編號
	--where e.主管 = getLevelTable.員工編號
)

select * from getLevelTable

end

exec getLevelTable

with getLevelTable2
as
(
	select e.員工編號, e.姓名, e.主管, 1 as 階層
	from 員工 as e
	where e.主管 is null
	union all
	select e.員工編號, e.姓名, e.主管, 階層+1 as 階層
	from 員工 as e inner join getLevelTable2 on e.主管 = getLevelTable2.員工編號
)

select * from getLevelTable2