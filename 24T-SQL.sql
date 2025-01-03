--T-SQL程式設計
--程式=演算法+資料結構

--PL/SQL(甲骨文的SQL)

print 'Hello World'

select 'Hello World!' as 欄位 -------執行完的結果會是一個table

select *
from (select 'Hollo World!' as col1) as tb1

-------------------------------------------------
--變數
--1.純量值變數(是指一個不可再分割的東西，ex int string bool) 2.資料表值變數(可以看成是一個物件)
--純量值變數宣告方式： declare @變數名稱 型別
declare @MyName nvarchar(100) = 'Jack Lee'
print @MyName
select @MyName

--指定運算，將123指給Number
declare @Number int
set @Number = 123
select @Number = 456
print @Number
print @number
--T-SQL不分大小寫
--------------------------
--use 北風
--go
declare @EmpName nvarchar(20)
select @empname=姓名
from 員工
where 員工編號='E0007'

print '員工姓名叫'+@EmpName
---------------------------------------

declare @salary money = 50000
print '您的薪水是' + cast(@salary as varchar)

declare @birthday datetime = '2024/12-11'
print '您的生日是' + convert(nvarchar, @birthday, 111)

declare @date datetime
select @date=要貨日期
from 訂單資料
where 訂單號碼='10259'
declare @str nvarchar(100)='此訂單的要貨日期是'+convert(nvarchar, @date, 111)
print @str
print '此訂單的要貨日期是'+convert(nvarchar, @date, 111)

declare @outdate datetime = NULL
select @outdate=送貨日期
from 訂單資料
where 送貨日期 is null
print '此訂單的送貨日期是'+convert(nvarchar, @outdate, 111)

-----------------------------------------------
--2.資料表值變數(可以看成是一個物件表)
declare @myTable table(
	name nvarchar(20),
	birthday datetime,
	tel nvarchar(20),
	note nvarchar(max)
)
insert into @myTable values('王小明','2024-12-11','07-8220101','長得很可愛')
select *
from @myTable

declare @myTable2 table(
	name nvarchar(20),
	birthday datetime,
	tel nvarchar(20),
	note nvarchar(max)
)
insert into @myTable2 select 姓名, 出生日期, 電話號碼, 附註 from 員工
select *
from @myTable2

declare @mt table (
	訂單號碼 nvarchar(5),
	客戶公司 nvarchar(40),
	負責員工 nvarchar(10)
)
insert into @mt select od.訂單號碼, c.公司名稱, p.姓名 from 訂單資料 as od
inner join 客戶 as c on  od.客戶編號=c.客戶編號
inner join 員工 as p on od.員工編號=p.員工編號

select *
from @mt
