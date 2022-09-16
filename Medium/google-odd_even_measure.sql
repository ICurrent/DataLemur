WITH cte
AS(
    SELECT measurement_time, measurement_value,
    ROW_NUMBER() OVER(PARTITION BY CAST(measurement_time AS DATE) ORDER BY measurement_time) adds
    FROM  measurements
    ORDER BY 1
)

SELECT CAST(measurement_time AS DATE),
SUM(CASE WHEN adds % 2 = 1 THEN measurement_value ELSE 0 END) odd_sum,
SUM(CASE WHEN adds % 2 = 0 THEN measurement_value ELSE 0 END) even_sum
FROM cte
GROUP BY 1
ORDER BY 1;