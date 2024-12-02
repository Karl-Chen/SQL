--子句
------------主敘述
--select
--from
-----------子敘述 -----〉哪些客戶下過訂單，一個客戶可以下0~n筆訂單，一張訂單只會被一位客戶下單
--所以要用子句distinct移除重覆項
--執行順序from -> where -> group by-> select->order by
select distinct 客戶編號 from 訂單資料
-----------哪些產品有被買過
select distinct 產品編號
from 訂單明細
--------------------------------------------------
select distinct 員工編號
from 訂單資料
---------------------------------------------------
--------------top子句---取前N筆資料----取前N%筆的資料 配合with ties，同排序的也會被列出
select top 10 *
from 訂單明細
select top 10 percent *
from 訂單明細
-----TOP配合排序(order by)使用，遞增排序，要遞減就是後面加desc，放最後
select top 15 with ties *
from 訂單明細
order by 單價 desc

select top 10 with ties *
from 訂單明細
order by 數量 desc

--挑選出商品銷售的前十名，所以要移除重覆值，寫法是先寫移除再寫top，這裡寫出來是只有移除產品編號及數量都重覆的才會移除
select distinct top 10 with ties 產品編號, 數量
from 訂單明細
order by 數量 desc
---------------------------------------------------

select *
from 訂單資料
