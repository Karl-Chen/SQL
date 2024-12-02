--修改資料
--update
--update一次只能對一個資料表做
--但可以一次更新1~N筆資料
update 貨運公司
set 貨運公司名稱='中榮貨運', 電話='(08)998-8777'
where 貨運公司編號=11

update 貨運公司
set 貨運公司名稱='不榮貨運', 電話='(08)998-8787'
where 貨運公司名稱='大榮貨運'

update 客戶
set 連絡人='小英', 連絡人職稱='業務助理'
where 客戶編號='KPPTR'

--把處理過100張(含)以上訂單的員工，附註欄位加上「勤奮」兩字
select 員工編號, count(*) as 處理張數
from 訂單資料
group by 員工編號
having count(*) >= 100


update 員工
set 附註=附註 + ', 勤奮'
where 員工編號 in (select 員工編號
from 訂單資料
group by 員工編號
having count(*) >= 100)

--把從未處理過訂單的員工, 附誰欄位加上米蟲兩字
select e.*
from 訂單資料 as o right join 員工 as e on o.員工編號=e.員工編號 
where o.員工編號 is null

update 員工
set 附註=附註 + ', 米蟲'
from 訂單資料 as o right join 員工 as e on o.員工編號=e.員工編號 
where o.員工編號 is null


update 員工
set 附註=附註 + ', 來交朋友的'
from 訂單資料 as o right join 員工 as e on o.員工編號=e.員工編號
where o.員工編號 is null