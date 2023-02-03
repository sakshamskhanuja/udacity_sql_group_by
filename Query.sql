/* Which account (by name) placed the earliest order? Your solution should have the account
name and the date of the order. */
SELECT a.name AS account, o.occurred_at
FROM accounts a
JOIN orders o
ON a.id = o.account_id
ORDER BY o.occurred_at
LIMIT 1;

/* Find the total sales in usd for each account. You should include two columns - the total
sales for each company's orders in usd and the company name. */
SELECT a.name AS account, SUM(total_amt_usd) AS total_sales
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id
GROUP BY account;

/* Via what channel did the most recent (latest) web_event occur, which account was associated
with this web_event? Your query should return only three values - the date, channel, and
account name. */
SELECT w.occurred_at, w.channel, a.name AS account
FROM accounts AS a
JOIN web_events AS w
ON a.id = w.account_id
ORDER BY w.occurred_at DESC
LIMIT 1;

/* Find the total number of times each type of channel from the web_events was used. Your final
table should have two columns - the channel and the number of times the channel was used. */
SELECT channel, COUNT(*) channel_used
FROM web_events
GROUP BY channel;

-- Who was the primary contact associated with the earliest web_event? 
SELECT a.primary_poc, w.occurred_at
FROM accounts AS a
JOIN web_events AS w
ON a.id = w.account_id
ORDER BY w.occurred_at
LIMIT 1;

/* What was the smallest order placed by each account in terms of total usd. Provide only
two columns - the account name and the total usd. Order from smallest dollar amounts to
largest. */
SELECT a.name AS account, MIN(o.total_amt_usd) AS order_amount
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id
GROUP BY account
ORDER BY order_amount;

/* Find the number of sales reps in each region. Your final table should have two columns -
the region and the number of sales_reps. Order from fewest reps to most reps. */
SELECT r.name AS region, COUNT(s.id) AS rep_count
FROM region AS r
JOIN sales_reps AS s
ON r.id = s.region_id
GROUP BY region
ORDER BY rep_count;