/*                                     Module 1 - Baisc SQL                                 */


/*
Best practice:
*/

SELECT account_id
FROM orders;



/* Limit in MS SQL Server: fetch next 15 rows only;      */

SELECT occurred_at, account_id, channel
FROM web_events 
limit 15;


/*
return the 10 earliest orders in the orders table. */
SELECT id, occurred_at, total_amt_usd
FROM orders 
ORDER BY occurred_at
LIMIT 10;

/*
return the top 5 orders in terms of largest total_amt_usd.
*/
SELECT id, occurred_at, total_amt_usd
FROM orders 
ORDER BY total_amt_usd Desc
LIMIT 5;

/*
 return the lowest 20 orders in terms of smallest total_amt_usd.
 */
SELECT id, occurred_at, total_amt_usd
FROM orders 
ORDER BY total_amt_usd
LIMIT 20;




/*
displays the order {ID}, {account ID}, and {total dollar amount} for all the {orders}, 
sorted first by the account ID (in ascending order), and then by the total dollar amount (in descending order).
*/
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY account_id ASC, total_amt_usd DESC;



/*
displays order ID, account ID, and total dollar amount for each order, but this time 
sorted first by total dollar amount (in descending order), and then by account ID (in ascending order).
*/
SELECT id, total_amt_usd AS total_amt_usd_desc, account_id AS account_id_asc
FROM orders
ORDER BY total_amt_usd DESC, account_id ASC;


/*
Pulls the first 5 rows and all columns from the orders table that have 
a dollar amount of gloss_amt_usd greater than or equal to 1000.
*/

SELECT *
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;


/*
Pulls the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500.
*/
SELECT *
FROM orders
WHERE total_amt_usd < 500
LIMIT 10;



/*
Filter the accounts table to include the company name, website, and the primary point of contact (primary_poc) 
just for the Exxon Mobil company in the accounts table.
*/

SELECT name, website, primary_poc
FROM accounts 
WHERE name = 'Exxon Mobil';



/*
Create a column that divides the standard_amt_usd by the standard_qty to find the unit price for standard paper 
for each order. Limit the results to the first 10 orders, and include the id and account_id fields.
*/
SELECT id,account_id, standard_amt_usd / standard_qty As standard_paper_unit_price
FROM orders
Limit 10;

/*
finds the percentage of revenue that comes from {poster paper} for each order. You will need to use only the columns that end with _usd. (Try to do this without using the total column.) Display the id and account_id
*/
SELECT id,account_id, (poster_amt_usd / total)* 100 As poster_paper_rev_perc
FROM orders
Limit 10;


/*
finds the percentage of revenue for each type of paper for each order. You will need to 
use only the columns that end with _usd. (Try to do this without using the total column.) Display the id and account_id
*/

SELECT id,account_id, 
(standard_amt_usd / total_amt_usd)* 100 As standard_paper_rev_perc,
(gloss_amt_usd / total_amt_usd)* 100 As gloss_paper_rev_perc,
(poster_amt_usd / total_amt_usd)* 100 As poster_paper_rev_perc
FROM orders
Limit 10;


/*
All the companies whose names start with 'C'.
*/
select name 
from accounts 
where name like 'C%';


/*
All companies whose names contain the string 
'one' somewhere in the name
*/
SELECT name
FROM accounts
WHERE name LIKE '%one%';

/*
All companies whose names end with 's'.
*/
SELECT name
FROM accounts
WHERE name LIKE '%s';


/*
Use the accounts table to find the account name, primary_poc, 
and sales_rep_id for Walmart, Target, and Nordstrom
*/
SELECT name, primary_poc, sales_rep_id
FROM accounts 
WHERE name IN ('Walmart', 'Target', 'Nordstrom');

/*
Use the web_events table to find all information regarding individuals 
who were contacted via the channel of organic or adwords.
*/
SELECT *
FROM web_events 
WHERE channel IN ('organic' , 'adwords');


/*
Use the accounts table to find the account name, primary poc, and sales rep id for all stores except Walmart, Target, and Nordstrom.
*/
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom');

/*
Use the web_events table to find all information regarding individuals who were contacted via any method except using organic or adwords methods
*/
SELECT *
FROM web_events
WHERE channel NOT IN ('organic', 'adwords');


/*
Use the accounts table to find:

	All the companies whose names do not start with 'C'.

	All companies whose names do not contain the string 'one' somewhere in the name.

	All companies whose names do not end with 's'
*/
SELECT name
FROM accounts
WHERE name NOT LIKE 'C%';

SELECT name
FROM accounts
WHERE name NOT LIKE '%one%';


SELECT name
FROM accounts
WHERE name NOT LIKE '%s';





/*
Return all the orders where the standard_qty is over 1000, the poster_qty is 0, and the gloss_qty is 0
*/
SELECT *
FROM orders
WHERE standard_qty > 1000 AND poster_qty = 0 AND 
gloss_qty = 0;


/*
Using the accounts table, find all the companies whose names do not start with 'C' and end with 's'.
*/
SELECT *
FROM accounts
WHERE name NOT LIKE 'C%' AND name LIKE '%s';



/*
displays the order date and gloss_qty data for all orders where gloss_qty is between 24 and 29..
*/
SELECT occurred_at, gloss_qty
FROM orders
WHERE gloss_qty BETWEEN 24 AND 29 ;



/*
Use the web_events table to find all information regarding individuals who were contacted via 
the organic or adwords channels, and started their account at any point in 2016, sorted from newest to oldest.
*/
SELECT channel, occurred_at
FROM web_events 
WHERE channel IN ('organic','adwords') AND 
occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY occurred_at DESC;






SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%') 
           AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') 
           AND primary_poc NOT LIKE '%eana%');
           
           
/*
Find list of orders ids where either gloss_qty or poster_qty is greater than 4000. Only include the id field in the resulting table.
*/
SELECT id
FROM orders
WHERE gloss_qty > 4000 or poster_qty > 4000;

SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%') 
           AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') 
           AND primary_poc NOT LIKE '%eana%');
           
           
/*
Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000.
*/
SELECT id
FROM orders
WHERE standard_qty = 0 
	AND (gloss_qty > 1000 or poster_qty > 1000);
    
    
/*
Find all the company names that start with a 'C' or 'W', and the primary contact contains 'ana' or 'Ana', but it doesn't contain 'eana'.
*/
SELECT name, primary_poc
FROM accounts
WHERE (name LIKE 'C%' or name LIKE 'W%')
	AND (
      (primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%')
    AND (primary_poc not LIKE '%eana%')
      );   





/*                                     Module 2 - SQL Joins                                 */

