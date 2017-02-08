DO $do$
DECLARE
BEGIN
	FOR i IN 1..100 LOOP
		INSERT INTO rzeki VALUES (
			i,
			CONCAT('nazwa_rzeki_',i)
		);
	END LOOP;
END
$do$