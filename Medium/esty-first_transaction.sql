SELECT COUNT(DISTINCT user_id)
FROM (
    SELECT user_id, spend, transaction_date,
    RANK() OVER(PARTITION BY user_id ORDER BY transaction_date) rk
    FROM user_transactions
    ORDER BY 1, 3
) tab
WHERE spend >= 50 AND rk = 1;