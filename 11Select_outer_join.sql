--合併查詢
--外部份併 

-- right跟left是決定以哪張資料表為主
--找出從未處理過訂單的員工(員工表為主)
select *
from 訂單資料 as o right outer join 員工 as e on o.員工編號=e.員工編號
where o.訂單號碼 is null

--找出從未下過訂單的客戶(客戶表為主)
select *
from 客戶 as c left outer join 訂單資料 as o on o.客戶編號=c.客戶編號
where o.訂單號碼 is null

--從未被買過的商品資料
select *
from 訂單明細 as od right outer join 產品資料 as p on od.產品編號=p.產品編號
where od.訂單號碼 is null