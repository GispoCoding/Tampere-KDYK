
DROP VIEW IF EXISTS yk_tarkistus.tarkistus_kayttotarkoitus_kaavaobjekti_alue_lkm;
DROP VIEW IF EXISTS yk_tarkistus.tarkistus_kaavaobjekti_alue_kayttotarkoitus_lkm;
CREATE VIEW yk_tarkistus.tarkistus_kaavaobjekti_alue_kayttotarkoitus_lkm AS
SELECT row_number() OVER () as rnum, kayttotarkoitus_lyhenne, COUNT(kayttotarkoitus_lyhenne) AS kayttotarkoitus_lyhenne_lkm, kaavaobjekti_alue.version_loppumispvm, yleiskaava.nimi AS yleiskaava
FROM yk_yleiskaava.kaavaobjekti_alue, yk_yleiskaava.yleiskaava
WHERE kaavaobjekti_alue.id_yleiskaava = yleiskaava.id
GROUP BY kayttotarkoitus_lyhenne, kaavaobjekti_alue.version_loppumispvm, yleiskaava.nimi
ORDER BY kayttotarkoitus_lyhenne, kaavaobjekti_alue.version_loppumispvm, yleiskaava.nimi;

DROP VIEW IF EXISTS yk_tarkistus.tarkistus_kayttotarkoitus_kaavaobjekti_alue_taydentava_lkm;
DROP VIEW IF EXISTS yk_tarkistus.tarkistus_kaavaobjekti_alue_taydentava_kayttotarkoitus_lkm;
CREATE VIEW yk_tarkistus.tarkistus_kaavaobjekti_alue_taydentava_kayttotarkoitus_lkm AS
SELECT row_number() OVER () as rnum, kayttotarkoitus_lyhenne, COUNT(kayttotarkoitus_lyhenne) AS kayttotarkoitus_lyhenne_lkm, kaavaobjekti_alue_taydentava.version_loppumispvm, yleiskaava.nimi AS yleiskaava
FROM yk_yleiskaava.kaavaobjekti_alue_taydentava, yk_yleiskaava.yleiskaava
WHERE kaavaobjekti_alue_taydentava.id_yleiskaava = yleiskaava.id
GROUP BY kayttotarkoitus_lyhenne, kaavaobjekti_alue_taydentava.version_loppumispvm, yleiskaava.nimi
ORDER BY kayttotarkoitus_lyhenne, kaavaobjekti_alue_taydentava.version_loppumispvm, yleiskaava.nimi;

DROP VIEW IF EXISTS yk_tarkistus.tarkistus_kayttotarkoitus_kaavaobjekti_viiva_lkm;
DROP VIEW IF EXISTS yk_tarkistus.tarkistus_kaavaobjekti_viiva_kayttotarkoitus_lkm;
CREATE VIEW yk_tarkistus.tarkistus_kaavaobjekti_viiva_kayttotarkoitus_lkm AS
SELECT row_number() OVER () as rnum, kayttotarkoitus_lyhenne, COUNT(kayttotarkoitus_lyhenne) AS kayttotarkoitus_lyhenne_lkm, kaavaobjekti_viiva.version_loppumispvm, yleiskaava.nimi AS yleiskaava
FROM yk_yleiskaava.kaavaobjekti_viiva, yk_yleiskaava.yleiskaava
WHERE kaavaobjekti_viiva.id_yleiskaava = yleiskaava.id
GROUP BY kayttotarkoitus_lyhenne, kaavaobjekti_viiva.version_loppumispvm, yleiskaava.nimi
ORDER BY kayttotarkoitus_lyhenne, kaavaobjekti_viiva.version_loppumispvm, yleiskaava.nimi;

DROP VIEW IF EXISTS yk_tarkistus.tarkistus_kayttotarkoitus_kaavaobjekti_piste_lkm;
DROP VIEW IF EXISTS yk_tarkistus.tarkistus_kaavaobjekti_piste_kayttotarkoitus_lkm;
CREATE VIEW yk_tarkistus.tarkistus_kaavaobjekti_piste_kayttotarkoitus_lkm AS
SELECT row_number() OVER () as rnum, kayttotarkoitus_lyhenne, COUNT(kayttotarkoitus_lyhenne) AS kayttotarkoitus_lyhenne_lkm, kaavaobjekti_piste.version_loppumispvm, yleiskaava.nimi AS yleiskaava
FROM yk_yleiskaava.kaavaobjekti_piste, yk_yleiskaava.yleiskaava
WHERE kaavaobjekti_piste.id_yleiskaava = yleiskaava.id
GROUP BY kayttotarkoitus_lyhenne, kaavaobjekti_piste.version_loppumispvm, yleiskaava.nimi
ORDER BY kayttotarkoitus_lyhenne, kaavaobjekti_piste.version_loppumispvm, yleiskaava.nimi;

------------------

DROP VIEW IF EXISTS yk_tarkistus.tarkistus_kehitys_kaavamaarays_lkm;
CREATE VIEW yk_tarkistus.tarkistus_kehitys_kaavamaarays_lkm AS
SELECT
	row_number() OVER () as rnum,
	kaavamaarays_otsikko,
	COUNT(*) AS kaavamaarays_otsikon_kaavamaarays_yhteys_lkm
FROM
	yk_yleiskaava.kaavamaarays,
	yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys
WHERE
	kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays
GROUP BY id_kaavamaarays, kaavamaarays_otsikko;

------------------

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA yk_tarkistus, yk_yleiskaava, yk_koodiluettelot, yk_kuvaustekniikka, yk_suunnitteluparametrit, yk_prosessi, yk_mitoitus_varanto, yk_metatiedot, yk_inspire, yk_geoserver TO avoin_yleiskaava;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA yk_tarkistus, yk_yleiskaava, yk_koodiluettelot, yk_kuvaustekniikka, yk_suunnitteluparametrit, yk_prosessi, yk_mitoitus_varanto, yk_metatiedot, yk_inspire, yk_geoserver TO avoin_yleiskaava;