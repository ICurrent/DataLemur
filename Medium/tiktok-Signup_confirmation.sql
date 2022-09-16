WITH cte
AS(
    SELECT t.text_id, e.email_id, signup_action
    FROM emails e 
    JOIN texts t ON e.email_id = t.email_id
),

confirm AS(
    SELECT CAST(COUNT(*) AS DECIMAL(3,2)
    FROM cte
    WHERE signup_action = 'Confirmed'
),

total AS(
    SELECT COUNT(*) FROM cte
)

SELECT ROUND((SELECT * FROM confirm)/(SELECT * FROM total), 2);