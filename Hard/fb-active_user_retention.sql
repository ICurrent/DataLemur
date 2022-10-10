SELECT 
  EXTRACT(MONTH FROM curr_mnth.event_date) AS month, 
  COUNT(DISTINCT curr_mnth.user_id) AS monthly_active_users 
FROM user_actions AS curr_mnth
WHERE EXISTS (
  SELECT lst_moth.user_id 
  FROM user_actions AS lst_mnth
  WHERE lat_mnth.user_id = curr_mnth.user_id
    AND EXTRACT(MONTH FROM lst_mnth.event_date) =
    EXTRACT(MONTH FROM curr_mnth.event_date - interval '1 month')
)
  AND EXTRACT(MONTH FROM curr_mnth.event_date) = 7
  AND EXTRACT(YEAR FROM curr_mnth.event_date) = 2022
GROUP BY EXTRACT(MONTH FROM curr_mnth.event_date);