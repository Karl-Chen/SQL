--檢視表 --不能傳參數
--跑完得到一張表，常與查詢共用
--檢視表的物件建立時不用begin end包起來
--select *
--from sys.databases


create view v_GetOrderListWithOtherData
as

select o.訂單號碼, c.公司名稱, c.連絡人, c.電話, o.訂單日期, o.送貨日期, e.姓名, d.貨運公司名稱,
o.收貨人, o.送貨方式 
from 訂單資料 as o inner join 客戶 as c on o.客戶編號=c.客戶編號
inner join 員工 as e on o.員工編號=e.員工編號
inner join 貨運公司 as d on o.送貨方式 = d.貨運公司編號

select 公司名稱, 連絡人 from v_GetOrderListWithOtherData

select *
from v_GetOrderListWithOtherData inner join 訂單明細 on v_GetOrderListWithOtherData.訂單號碼=訂單明細.訂單號碼
where v_GetOrderListWithOtherData.訂單號碼='120123'