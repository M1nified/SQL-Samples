DO $do$
BEGIN
  FOR i IN 1..10 LOOP
    INSERT INTO pomiary
    SELECT 
      (SELECT COUNT(*) FROM pomiary) + ROW_NUMBER() OVER() AS id_pomiaru,
      id_punktu AS id_punktu,
      NOW() AS czas_pomiaru,
      RANDOM()*stan_alarmowy AS poziom_wody
    FROM
      punkty_pomiarowe;
  END LOOP;
END
$do$
