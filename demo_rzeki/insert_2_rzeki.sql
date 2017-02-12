SET search_path TO rzeki;
INSERT INTO rzeki 
SELECT
	i as id_rzeki,
	CONCAT('nazwa_rzeki_',i) as nazwa
FROM
	generate_series(1,100) as l(i);