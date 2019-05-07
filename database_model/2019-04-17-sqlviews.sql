-- v2018-12-13
-- Tampereen avoimen yleiskaavan SQL-näkymät

-- yk_yleiskaava.kaavaobjekti_<tyyppi>_kooste

DROP VIEW IF EXISTS yk_yleiskaava.kaavaobjekti_piste_kooste;
CREATE VIEW yk_yleiskaava.kaavaobjekti_piste_kooste AS
SELECT row_number() OVER () as rnum, kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_piste, kaavamaarays.kaavamaarays_otsikko, teema.nimi
FROM yk_yleiskaava.kaavamaarays, yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys, yk_kuvaustekniikka.kaavaobjekti_teema_yhteys, yk_kuvaustekniikka.teema
WHERE kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays
AND (kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_piste = kaavaobjekti_teema_yhteys.id_kaavaobjekti_piste)
AND kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_piste IS NOT NULL
AND teema.id = kaavaobjekti_teema_yhteys.id_teema;

DROP VIEW IF EXISTS yk_yleiskaava.kaavaobjekti_viiva_kooste;
CREATE VIEW yk_yleiskaava.kaavaobjekti_viiva_kooste AS
SELECT row_number() OVER () as rnum, kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_viiva, kaavamaarays.kaavamaarays_otsikko, teema.nimi
FROM yk_yleiskaava.kaavamaarays, yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys, yk_kuvaustekniikka.kaavaobjekti_teema_yhteys, yk_kuvaustekniikka.teema
WHERE kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays
AND (kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_viiva = kaavaobjekti_teema_yhteys.id_kaavaobjekti_viiva)
AND kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_viiva IS NOT NULL
AND teema.id = kaavaobjekti_teema_yhteys.id_teema;

DROP VIEW IF EXISTS yk_yleiskaava.kaavaobjekti_alue_kooste;
CREATE VIEW yk_yleiskaava.kaavaobjekti_alue_kooste AS
SELECT row_number() OVER () as rnum, kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue, kaavamaarays.kaavamaarays_otsikko, teema.nimi
FROM yk_yleiskaava.kaavamaarays, yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys, yk_kuvaustekniikka.kaavaobjekti_teema_yhteys, yk_kuvaustekniikka.teema
WHERE kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays
AND (kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue = kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue)
AND kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue IS NOT NULL
AND teema.id = kaavaobjekti_teema_yhteys.id_teema;

DROP VIEW IF EXISTS yk_yleiskaava.kaavaobjekti_alue_taydentava_kooste;
CREATE VIEW yk_yleiskaava.kaavaobjekti_alue_taydentava_kooste AS
SELECT row_number() OVER () as rnum, kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue_taydentava, kaavamaarays.kaavamaarays_otsikko, teema.nimi
FROM yk_yleiskaava.kaavamaarays, yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys, yk_kuvaustekniikka.kaavaobjekti_teema_yhteys, yk_kuvaustekniikka.teema
WHERE kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays
AND (kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue_taydentava = kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue_taydentava)
AND kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue_taydentava IS NOT NULL
AND teema.id = kaavaobjekti_teema_yhteys.id_teema;

-- yk_yleiskaava.kaavamaaraykset_<tyyppi>

DROP VIEW IF EXISTS yk_yleiskaava.kaavamaaraykset_piste;
CREATE VIEW yk_yleiskaava.kaavamaaraykset_piste AS
SELECT row_number() OVER () as rnum, a.*, b.id_kaavaobjekti_piste, b.id_kaavaobjekti_viiva,
b.id_kaavaobjekti_alue, b.id_kaavaobjekti_alue_taydentava
FROM yk_yleiskaava.kaavamaarays a, yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys b
WHERE a.id IN (
SELECT id_kaavamaarays
FROM yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys
WHERE id_kaavaobjekti_piste IS NOT NULL)
AND a.id = b.id_kaavamaarays;

DROP VIEW IF EXISTS yk_yleiskaava.kaavamaaraykset_viiva;
CREATE VIEW yk_yleiskaava.kaavamaaraykset_viiva AS
SELECT row_number() OVER () as rnum, a.*, b.id_kaavaobjekti_piste, b.id_kaavaobjekti_viiva,
b.id_kaavaobjekti_alue, b.id_kaavaobjekti_alue_taydentava
FROM yk_yleiskaava.kaavamaarays a, yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys b
WHERE a.id IN (
SELECT id_kaavamaarays
FROM yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys
WHERE id_kaavaobjekti_viiva IS NOT NULL)
AND a.id = b.id_kaavamaarays;

DROP VIEW IF EXISTS yk_yleiskaava.kaavamaaraykset_alue;
CREATE VIEW yk_yleiskaava.kaavamaaraykset_alue AS
SELECT row_number() OVER () as rnum, a.*, b.id_kaavaobjekti_piste, b.id_kaavaobjekti_viiva,
b.id_kaavaobjekti_alue, b.id_kaavaobjekti_alue_taydentava
FROM yk_yleiskaava.kaavamaarays a, yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys b
WHERE a.id IN (
SELECT id_kaavamaarays
FROM yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys
WHERE id_kaavaobjekti_alue IS NOT NULL)
AND a.id = b.id_kaavamaarays;

DROP VIEW IF EXISTS yk_yleiskaava.kaavamaaraykset_alue_taydentava;
CREATE VIEW yk_yleiskaava.kaavamaaraykset_alue_taydentava AS
SELECT row_number() OVER () as rnum, a.*, b.id_kaavaobjekti_piste, b.id_kaavaobjekti_viiva,
b.id_kaavaobjekti_alue, b.id_kaavaobjekti_alue_taydentava
FROM yk_yleiskaava.kaavamaarays a, yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys b
WHERE a.id IN (
SELECT id_kaavamaarays
FROM yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys
WHERE id_kaavaobjekti_alue_taydentava IS NOT NULL)
AND a.id = b.id_kaavamaarays;

-- yk_yleiskaava.kaavaobjekti_<tyyppi>_teema

DROP VIEW IF EXISTS yk_yleiskaava.kaavaobjekti_piste_teema;
CREATE VIEW yk_yleiskaava.kaavaobjekti_piste_teema AS
SELECT row_number() OVER () as rnum, a.*, b.id AS "teeman_id", b.nimi AS "teeman_nimi", b.kuvaus AS "teeman_kuvaus", b.sld_url
FROM yk_yleiskaava.kaavaobjekti_piste a
INNER JOIN yk_kuvaustekniikka.kaavaobjekti_teema_yhteys c ON c.id_kaavaobjekti_piste = a.id
INNER JOIN yk_kuvaustekniikka.teema b ON c.id_teema = b.id;

DROP VIEW IF EXISTS yk_yleiskaava.kaavaobjekti_viiva_teema;
CREATE VIEW yk_yleiskaava.kaavaobjekti_viiva_teema AS
SELECT row_number() OVER () as rnum, a.*, b.id AS "teeman_id", b.nimi AS "teeman_nimi", b.kuvaus AS "teeman_kuvaus", b.sld_url
FROM yk_yleiskaava.kaavaobjekti_viiva a
INNER JOIN yk_kuvaustekniikka.kaavaobjekti_teema_yhteys c ON c.id_kaavaobjekti_viiva = a.id
INNER JOIN yk_kuvaustekniikka.teema b ON c.id_teema = b.id;

DROP VIEW IF EXISTS yk_yleiskaava.kaavaobjekti_alue_teema;
CREATE VIEW yk_yleiskaava.kaavaobjekti_alue_teema AS
SELECT row_number() OVER () as rnum, a.*, b.id AS "teeman_id", b.nimi AS "teeman_nimi", b.kuvaus AS "teeman_kuvaus", b.sld_url
FROM yk_yleiskaava.kaavaobjekti_alue a
INNER JOIN yk_kuvaustekniikka.kaavaobjekti_teema_yhteys c ON c.id_kaavaobjekti_alue = a.id
INNER JOIN yk_kuvaustekniikka.teema b ON c.id_teema = b.id;

DROP VIEW IF EXISTS yk_yleiskaava.kaavaobjekti_alue_taydentava_teema;
CREATE VIEW yk_yleiskaava.kaavaobjekti_alue_taydentava_teema AS
SELECT row_number() OVER () as rnum, a.*, b.id AS "teeman_id", b.nimi AS "teeman_nimi", b.kuvaus AS "teeman_kuvaus", b.sld_url
FROM yk_yleiskaava.kaavaobjekti_alue_taydentava a
INNER JOIN yk_kuvaustekniikka.kaavaobjekti_teema_yhteys c ON c.id_kaavaobjekti_alue_taydentava = a.id
INNER JOIN yk_kuvaustekniikka.teema b ON c.id_teema = b.id;

----------------------

-- yk_yleiskaava.kaavaobjekti_<tyyppi>_kaavamaarays_otsikko
-- Vain kaavamääräyksien otsikot näkymissä

DROP VIEW IF EXISTS yk_yleiskaava.kaavamaaraykset_piste_kaavamaarays_otsikko;
CREATE VIEW yk_yleiskaava.kaavamaaraykset_piste_kaavamaarays_otsikko AS
SELECT row_number() OVER () as rnum, c.kaavamaarays_otsikko FROM
(SELECT DISTINCT a.kaavamaarays_otsikko FROM yk_yleiskaava.kaavamaarays a, yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys b
WHERE a.id IN (
SELECT DISTINCT id_kaavamaarays
FROM yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys
WHERE id_kaavaobjekti_piste IS NOT NULL)
AND a.id = b.id_kaavamaarays ORDER BY kaavamaarays_otsikko ASC) AS c;

DROP VIEW IF EXISTS yk_yleiskaava.kaavamaaraykset_viiva_kaavamaarays_otsikko;
CREATE VIEW yk_yleiskaava.kaavamaaraykset_viiva_kaavamaarays_otsikko AS
SELECT row_number() OVER () as rnum, c.kaavamaarays_otsikko FROM
(SELECT DISTINCT a.kaavamaarays_otsikko FROM yk_yleiskaava.kaavamaarays a, yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys b
WHERE a.id IN (
SELECT DISTINCT id_kaavamaarays
FROM yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys
WHERE id_kaavaobjekti_viiva IS NOT NULL)
AND a.id = b.id_kaavamaarays ORDER BY kaavamaarays_otsikko ASC) AS c;

DROP VIEW IF EXISTS yk_yleiskaava.kaavamaaraykset_alue_kaavamaarays_otsikko;
CREATE VIEW yk_yleiskaava.kaavamaaraykset_alue_kaavamaarays_otsikko AS
SELECT row_number() OVER () as rnum, c.kaavamaarays_otsikko FROM
(SELECT DISTINCT a.kaavamaarays_otsikko FROM yk_yleiskaava.kaavamaarays a, yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys b
WHERE a.id IN (
SELECT DISTINCT id_kaavamaarays
FROM yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys
WHERE id_kaavaobjekti_alue IS NOT NULL)
AND a.id = b.id_kaavamaarays ORDER BY kaavamaarays_otsikko ASC) AS c;

DROP VIEW IF EXISTS yk_yleiskaava.kaavamaaraykset_alue_taydentava_kaavamaarays_otsikko;
CREATE VIEW yk_yleiskaava.kaavamaaraykset_alue_taydentava_kaavamaarays_otsikko AS
SELECT row_number() OVER () as rnum, c.kaavamaarays_otsikko FROM
(SELECT DISTINCT a.kaavamaarays_otsikko FROM yk_yleiskaava.kaavamaarays a, yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys b
WHERE a.id IN (
SELECT DISTINCT id_kaavamaarays
FROM yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys
WHERE id_kaavaobjekti_alue_taydentava IS NOT NULL)
AND a.id = b.id_kaavamaarays ORDER BY kaavamaarays_otsikko ASC) AS c;

----------------------------

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA yk_yleiskaava, yk_koodiluettelot, yk_kuvaustekniikka, yk_suunnitteluparametrit, yk_prosessi, yk_mitoitus_varanto, yk_metatiedot, yk_inspire, yk_geoserver TO avoin_yleiskaava;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA yk_yleiskaava, yk_koodiluettelot, yk_kuvaustekniikka, yk_suunnitteluparametrit, yk_prosessi, yk_mitoitus_varanto, yk_metatiedot, yk_inspire, yk_geoserver TO avoin_yleiskaava;


