SELECT transaction_date, COUNT(DISTINCT user_id), 
COUNT(DISTINCT product_id)
FROM(
    SELECT 
    transaction_date, 
    user_id, 
    product_id, 
    RANK() OVER (PARTITION BY user_id 
      ORDER BY transaction_date DESC
    ) AS days_rank 
  FROM 
    user_transactions) tab
WHERE days_rank = 1
GROUP BY 1
ORDER BY 1;