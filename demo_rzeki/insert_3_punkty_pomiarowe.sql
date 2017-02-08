DO $do$
DECLARE
  stan_ostrz integer;
  rzeka RECORD;
BEGIN
  FOR rzeka IN SELECT * FROM rzeki LOOP
	  FOR i IN 1..100 LOOP
      SELECT ROUND(RANDOM()*30) INTO stan_ostrz;
      -- stan_ostrz := ROUND(RANDOM()*30);
      INSERT INTO punkty_pomiarowe VALUES (
        (SELECT COUNT(*) FROM punkty_pomiarowe),
        i,
        (SELECT ROUND(RANDOM()*MAX(identyfikator)) FROM gminy),
        rzeka.id_rzeki,
        RANDOM()*180,
        RANDOM()*90,
        stan_ostrz,
        stan_ostrz+ROUND(RANDOM()*10)
      );
    END LOOP;
  END LOOP;
END
$do$
