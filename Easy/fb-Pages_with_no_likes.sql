SELECT p.page_id
FROM pages p
LEFT JOIN page_likes l ON p.page_id = l.page_id
WHERE l.user_id IS NULL
ORDER BY 1;