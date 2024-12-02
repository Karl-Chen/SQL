--inner join第二種寫法
--將join完的資料表當一個新資料表，然後再將新表放前面
select *
from 供應商 as s inner join
(產品類別 as pt inner join
(產品資料 as p inner join
(貨運公司 as d inner join
(員工 as e inner join
(客戶 as c inner join
(訂單明細 as od inner join
訂單資料 as o
on od.訂單號碼=o.訂單號碼)
on c.客戶編號=o.客戶編號)
on e.員工編號=o.員工編號)
on d.貨運公司編號=o.送貨方式)
on p.產品編號=od.產品編號)
on pt.類別編號=p.類別編號)
on s.供應商編號=p.供應商編號

select *
from 供應商 as sup inner join
(產品類別 as ptype inner join
(產品資料 as pdata inner join
(貨運公司 as sendC inner join
(員工 as p inner join
(客戶 as cusm inner join
(訂單資料 as odata inner join
訂單明細 as odetail
on odata.訂單號碼=odetail.訂單號碼)
on cusm.客戶編號=odata.客戶編號)
on p.員工編號=odata.員工編號)
on sendC.貨運公司編號=odata.送貨方式)
on pdata.產品編號=odetail.產品編號)
on ptype.類別編號 = pdata.類別編號)
on sup.供應商編號 = pdata.供應商編號


--inner join 第三種寫法
--自然合併法、隱含合併法

select *
from 供應商 as sup, 產品類別 as ptype, 產品資料 as pdata, 貨運公司 as sendC, 員工 as p, 客戶 as cusm,
訂單資料 as odata, 訂單明細 as odetail
where odata.訂單號碼=odetail.訂單號碼 and cusm.客戶編號=odata.客戶編號 and p.員工編號=odata.員工編號
and sendC.貨運公司編號=odata.送貨方式 and pdata.產品編號=odetail.產品編號 and ptype.類別編號 = pdata.類別編號
and sup.供應商編號 = pdata.供應商編號

select *
from 供應商 as sup, 產品類別 as ptype, 產品資料 as pdata, 貨運公司 as sendC, 員工 as p, 客戶 as cusm,
訂單資料 as odata, 訂單明細 as odetail
where odata.訂單號碼=odetail.訂單號碼 and cusm.客戶編號=odata.客戶編號 and p.員工編號=odata.員工編號 and
sendC.貨運公司編號=odata.送貨方式 and pdata.產品編號=odetail.產品編號 and ptype.類別編號 = pdata.類別編號 and
sup.供應商編號 = pdata.供應商編號