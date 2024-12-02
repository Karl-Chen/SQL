--like運算子（模糊查詢）
--%:代表0~n個任意字元
--_:代表任神一個字元
--[]:放在中刮號裡的有任一個字就算
--找收貨人是姓陳的
--執行順序from -> where -> group by-> select->order by
select *
from 訂單資料
where 收貨人 like '陳%'

select *
from 訂單資料
where 收貨人 like '陳___'

select *
from 訂單資料
where 收貨人 like '[陳王李林趙]%'

--like '[^陳王李林趙]%' 排除陳王李林趙開頭的人，^只能放開頭

select *
from 訂單資料
where 收貨人 like '[^陳王李林趙]%'

--between and
select *
from 產品資料
--where 訂價 >= 10 and 訂價<= 20
where 訂價 between 10 and 20
-- 也可以寫成where 訂價 between 10 and 20

--in
select *
from 客戶
--where 連絡人職稱 = '董事長' or 連絡人職稱= '研發人員' or 連絡人職稱='業務'
--也可以寫成
where 連絡人職稱 in ('董事長','研發人貞','業務')