CREATE SCHEMA IF NOT EXISTS rzeki;
SET search_path TO rzeki;
DROP TABLE IF EXISTS
	pomiary,
	ostrzezenia,
	rzeki,
	punkty_pomiarowe,
	gminy,
	powiaty,
	wojewodztwa
;
CREATE TABLE wojewodztwa
(
	identyfikator integer PRIMARY KEY,
	nazwa varchar(30)
);
CREATE TABLE powiaty
(
	identyfikator integer PRIMARY KEY,
	nazwa varchar(30),
	id_wojewodztwa integer REFERENCES wojewodztwa (identyfikator)
);
CREATE TABLE gminy
(
	identyfikator integer PRIMARY KEY,
	nazwa varchar(30),
	id_powiatu integer REFERENCES powiaty (identyfikator)
);
CREATE TABLE rzeki
(
	id_rzeki integer PRIMARY KEY,
	nazwa varchar(30)
);
CREATE TABLE punkty_pomiarowe
(
	id_punktu integer PRIMARY KEY,
	nr_porzadkowy integer,
	id_gminy integer REFERENCES gminy (identyfikator),
	id_rzeki integer REFERENCES rzeki,
	dlugosc_geogr numeric(5,2),
	szerokosc_geogr numeric(5,2),
	stan_ostrzegawczy integer,
	stan_alarmowy integer
);
CREATE TABLE pomiary
(
	id_pomiaru integer PRIMARY KEY,
	id_punktu integer REFERENCES punkty_pomiarowe,
	czas_pomiaru timestamp,
	poziom_wody integer
);
CREATE TABLE ostrzezenia
(
	id_ostrzezenia integer PRIMARY KEY,
	id_punktu integer,
	czas_ostrzezenia timestamp,
	przekroczony_stan_ostrz integer,
	przekroczony_stan_alarm integer,
	zmiana_poziomu numeric(5,2)
);