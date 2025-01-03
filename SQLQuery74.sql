 select o.訂單號碼, o.訂單日期, p.產品編號, p.產品, od.數量, od.單價, od.單價*od.數量*(1-od.折扣) as 小計
 from 訂單明細 as od 
 inner join 產品資料 as p on od.產品編號 = p.產品編號
 inner join 訂單資料 as o on od.訂單號碼 = o.訂單號碼

