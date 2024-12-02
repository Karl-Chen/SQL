SELECT          訂單資料.訂單號碼, 客戶.公司名稱, 客戶.連絡人, 訂單資料.訂單日期, 訂單資料.要貨日期, 訂單資料.送貨日期, 
                            產品資料.產品, 產品類別.類別名稱, round(sum(訂單明細.單價*訂單明細.數量*(1-訂單明細.折扣)),0) as 小計
FROM              訂單資料 INNER JOIN
                            客戶 ON 訂單資料.客戶編號 = 客戶.客戶編號 INNER JOIN
                            訂單明細 ON 訂單資料.訂單號碼 = 訂單明細.訂單號碼 INNER JOIN
                            員工 ON 訂單資料.員工編號 = 員工.員工編號 INNER JOIN
                            產品資料 ON 訂單明細.產品編號 = 產品資料.產品編號 INNER JOIN
                            供應商 ON 產品資料.供應商編號 = 供應商.供應商編號 INNER JOIN
                            產品類別 ON 產品資料.類別編號 = 產品類別.類別編號 INNER JOIN
                            貨運公司 ON 訂單資料.送貨方式 = 貨運公司.貨運公司編號
group by		訂單資料.訂單號碼, 客戶.公司名稱, 客戶.連絡人, 訂單資料.訂單日期, 訂單資料.要貨日期, 訂單資料.送貨日期, 
                            產品資料.產品, 產品類別.類別名稱
-------------------------------------------------------------
select 客戶.*
from	客戶
-------------------------------------------------------------


SELECT          pdata.產品編號, pdata.產品, pdata.圖片, pdata.供應商編號, e.員工編號, e.姓名, e.英文名, sup.供應商編號 AS Expr1, 
                            sup.供應商, sup.連絡人, sup.連絡人職稱, odata.訂單號碼, odata.客戶編號, odata.員工編號 AS Expr2, 
                            odata.訂單日期, od.產品編號 AS Expr3, od.單價, od.數量
FROM              訂單明細 AS od INNER JOIN
                            訂單資料 AS odata ON od.訂單號碼 = odata.訂單號碼 INNER JOIN
                            產品資料 AS pdata ON od.產品編號 = pdata.產品編號 INNER JOIN
                            供應商 AS sup ON pdata.供應商編號 = sup.供應商編號 INNER JOIN
                            產品類別 AS ptype ON pdata.類別編號 = ptype.類別編號 INNER JOIN
                            員工 AS e ON odata.員工編號 = e.員工編號

