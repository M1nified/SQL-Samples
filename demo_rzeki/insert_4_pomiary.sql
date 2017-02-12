SET search_path TO rzeki;
INSERT INTO pomiary
SELECT 
  (SELECT COUNT(*) FROM pomiary) + ROW_NUMBER() OVER() AS id_pomiaru,
  id_punktu AS id_punktu,
  NOW() AS czas_pomiaru,
  RANDOM()*stan_alarmowy AS poziom_wody
FROM
  punkty_pomiarowe
  CROSS JOIN (
    SELECT * FROM generate_series(1,20)
  ) as multiply
