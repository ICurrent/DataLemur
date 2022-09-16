WITH cte 
AS(
    SELECT artist_id, s.song_id, g.rank
    FROM song s
    JOIN global_song_rank g ON s.song_id = g.song_id
    WHERE g.rank <= 10
)

SELECT *
FROM (
    SELECT a.artist_name, DENSE_RANK() OVER(ORDER BY num DESC) ordering
    FROM(
        SELECT cte.artist_id, COUNT(*) num
        FROM cte
        GROUP BY 1
    ) tab
    JOIN artist a ON tab.artist_id = a.artist_id
)tab1
WHERE tab1.ordering <= 5
ORDER BY 2, 1;