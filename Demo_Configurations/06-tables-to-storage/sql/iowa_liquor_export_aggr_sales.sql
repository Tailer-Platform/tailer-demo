with tmp as (
SELECT date,
  EXTRACT(ISOYEAR FROM date) AS isoyear,
  EXTRACT(ISOWEEK FROM date) AS isoweek,
  sum(sale_dollars) as Total_Sales 
FROM `fd-io-jarvis-demo-dlk.dlk_demo_iowa_liquor_pda.sales_details` 
WHERE date >= "2020-01-01"
group by date, isoyear, isoweek
order by date)
​
select min(date) as Week_date, 
  isoyear, 
  isoweek, 
  sum(Total_Sales) as Total_Sales_dollars
from tmp
group by isoyear,isoweek
order by Week_date;