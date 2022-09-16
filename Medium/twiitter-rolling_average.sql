WITH cte
AS(
    SELECT user_id, tweet_date, COUNT(*) ROW_NUMBER
    FROM tweets
    GROUP BY 1, 2
    ORDER BY 1, 2
)

SELECT user_id, tweet_date,
ROUND(AVG(num) OVER(PARTITION BY user_id ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) Average
FROM cte;
