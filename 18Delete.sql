--Delete刪除資料
--Delete
--Delete一次只能對一個資料表做
--但可以一次更新1~N筆資料

delete from 貨運公司
where 貨運公司編號=9

--複雜刪除法
delete from 員工
where 員工編號 in (select 員工編號
from 訂單資料
group by 員工編號
having count(*) >= 100)

--加上合併查詢
delete from 員工
from 訂單資料 as o right join 員工 as e on o.員工編號=e.員工編號
where o.員工編號 is null