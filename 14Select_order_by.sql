--order by的子句 offset
--offset的子句 fetch next
--order by
select *
from 產品資料
order by 產品編號
--跳過前10筆
offset 10 rows

select *
from 產品資料
order by 產品編號
--跳過10筆往下取20筆
offset 10 rows
fetch next 20 rows only

select *
from 產品資料
order by 產品編號
--取前5筆
offset 0 rows
fetch next 5 rows only

select * from 訂單明細
order by 訂單號碼
offset 30 rows
fetch next 10 rows only
