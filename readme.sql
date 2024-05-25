-- Count all records 
SELECT count(*) FROM sales.transactions;

-- Lets print some transaction records
SELECT * FROM sales.transactions limit 5;

--  Check where market_code has "Mark001" as their records
SELECT * FROM sales.transactions where market_code = "Mark001";
SELECT count(*) FROM sales.transactions where market_code = "Mark001";

--  Check where currency has "USD" as their records
SELECT * FROM sales.transactions where currency = "USD";
SELECT count(*) FROM sales.transactions where currency = "USD";

-- Lets do INNER JOIN with "Sales.date" and "Sales.transactions" where all years of transcations are 2020
SELECT sales.transactions.*, sales.date.* FROM sales.transactions 
INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date Where sales.date.year="2020";

-- Lets check the revenue in 2020 usning the "sales_amount" column
SELECT SUM(sales.transactions.sales_amount) FROM sales.transactions 
INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date where sales.date.year ="2020";

--  Lets check how much business we did in Chennai(code MARK001)
SELECT SUM(sales.transactions.sales_amount) FROM sales.transactions 
INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date where sales.date.year = 2020 and sales.transactions.market_code = "MARK001";

-- Distinct products we sold to Chennai
SELECT distinct product_code FROM sales.transactions WHERE market_code = "MARK001";

-- Check sales amount which are -1 and 0
SELECT * from sales.transactions where sales_amount = -1;
SELECT * from sales.transactions where sales_amount = 0;

-- I saw some duplications(INR AND USD) appear twice
Select distinct (transactions.currency) from transactions;
-- 'INR'
-- 'INR\r'
-- 'USD'
-- 'USD\r'
select count(*) from transactions where currency = 'INR';
select count(*) from transactions where currency = 'INR\r';
select count(*) from transactions where currency = 'USD';
select count(*) from transactions where currency = 'USD\r';

-- The records are duplicate indeed
select * from transactions where currency = "USD\r" or currency = 'USD';
select * from transactions where currency = "INR\r" or currency = 'INR';

-- Lets check the revenue in 2020 usning the "sales_amount" column in month January
SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date on transactions.order_date = date.date 
where date.year =2020 and date.month_name = "January"
and (currency = 'INR\r' or currency = "USD\r");

