SET search_path TO rzeki;
INSERT INTO punkty_pomiarowe 
SELECT
  (SELECT COUNT(*) FROM punkty_pomiarowe) + ROW_NUMBER() OVER() as id_punktu,
  si.i,
  (SELECT ROUND(RANDOM()*MAX(identyfikator)) FROM gminy),
  rz.id_rzeki,
  RANDOM()*180 as dlugosc_geogr,
  RANDOM()*90 as szerokosc_geogr,
  si.stan_ostrz as stan_ostrzegawczy,
  si.stan_ostrz+ROUND(RANDOM()*10) as stan_alarmowy
FROM
  rzeki as rz
  CROSS JOIN (
    SELECT
      i as i,
      ROUND(RANDOM()*30) as stan_ostrz
    FROM
      generate_series(1,100) as l(i)
  ) as si;
  