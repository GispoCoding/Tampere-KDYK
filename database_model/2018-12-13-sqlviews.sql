-- v2018-12-13
-- Tampereen avoimen yleiskaavan SQL-näkymät

-- yk_yleiskaava.kaavaobjekti_<tyyppi>_kooste

CREATE VIEW yk_yleiskaava.kaavaobjekti_piste_kooste AS
SELECT kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_piste, kaavamaarays.kaavamaarays_otsikko, teema.nimi
FROM yk_yleiskaava.kaavamaarays, yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys, yk_kuvaustekniikka.kaavaobjekti_teema_yhteys, yk_kuvaustekniikka.teema
WHERE kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays
AND (kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_piste = kaavaobjekti_teema_yhteys.id_kaavaobjekti_piste)
AND kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_piste IS NOT NULL
AND teema.id = kaavaobjekti_teema_yhteys.id_teema;

CREATE VIEW yk_yleiskaava.kaavaobjekti_viiva_kooste AS
SELECT kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_viiva, kaavamaarays.kaavamaarays_otsikko, teema.nimi
FROM yk_yleiskaava.kaavamaarays, yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys, yk_kuvaustekniikka.kaavaobjekti_teema_yhteys, yk_kuvaustekniikka.teema
WHERE kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays
AND (kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_viiva = kaavaobjekti_teema_yhteys.id_kaavaobjekti_viiva)
AND kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_viiva IS NOT NULL
AND teema.id = kaavaobjekti_teema_yhteys.id_teema;

CREATE VIEW yk_yleiskaava.kaavaobjekti_alue_kooste AS
SELECT kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue, kaavamaarays.kaavamaarays_otsikko, teema.nimi
FROM yk_yleiskaava.kaavamaarays, yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys, yk_kuvaustekniikka.kaavaobjekti_teema_yhteys, yk_kuvaustekniikka.teema
WHERE kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays
AND (kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue = kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue)
AND kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue IS NOT NULL
AND teema.id = kaavaobjekti_teema_yhteys.id_teema;

CREATE VIEW yk_yleiskaava.kaavaobjekti_alue_taydentava_kooste AS
SELECT kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue_taydentava, kaavamaarays.kaavamaarays_otsikko, teema.nimi
FROM yk_yleiskaava.kaavamaarays, yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys, yk_kuvaustekniikka.kaavaobjekti_teema_yhteys, yk_kuvaustekniikka.teema
WHERE kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays
AND (kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue_taydentava = kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue_taydentava)
AND kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue_taydentava IS NOT NULL
AND teema.id = kaavaobjekti_teema_yhteys.id_teema;

-- yk_yleiskaava.kaavamaaraykset_<tyyppi>

CREATE VIEW yk_yleiskaava.kaavamaaraykset_piste AS
SELECT row_number() OVER () as rnum, a.*, b.id_kaavaobjekti_piste, b.id_kaavaobjekti_viiva,
b.id_kaavaobjekti_alue, b.id_kaavaobjekti_alue_taydentava
FROM yk_yleiskaava.kaavamaarays a, yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys b
WHERE a.id IN (
SELECT id_kaavamaarays
FROM yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys
WHERE id_kaavaobjekti_piste IS NOT NULL)
AND a.id = b.id_kaavamaarays;

CREATE VIEW yk_yleiskaava.kaavamaaraykset_viiva AS
SELECT row_number() OVER () as rnum, a.*, b.id_kaavaobjekti_piste, b.id_kaavaobjekti_viiva,
b.id_kaavaobjekti_alue, b.id_kaavaobjekti_alue_taydentava
FROM yk_yleiskaava.kaavamaarays a, yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys b
WHERE a.id IN (
SELECT id_kaavamaarays
FROM yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys
WHERE id_kaavaobjekti_viiva IS NOT NULL)
AND a.id = b.id_kaavamaarays;

CREATE VIEW yk_yleiskaava.kaavamaaraykset_alue AS
SELECT row_number() OVER () as rnum, a.*, b.id_kaavaobjekti_piste, b.id_kaavaobjekti_viiva,
b.id_kaavaobjekti_alue, b.id_kaavaobjekti_alue_taydentava
FROM yk_yleiskaava.kaavamaarays a, yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys b
WHERE a.id IN (
SELECT id_kaavamaarays
FROM yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys
WHERE id_kaavaobjekti_alue IS NOT NULL)
AND a.id = b.id_kaavamaarays;

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

CREATE VIEW yk_yleiskaava.kaavaobjekti_piste_teema AS
SELECT a.*, b.id AS "teeman_id", b.nimi AS "teeman_nimi", b.kuvaus AS "teeman_kuvaus", b.sld_url
FROM yk_yleiskaava.kaavaobjekti_piste a
INNER JOIN yk_kuvaustekniikka.kaavaobjekti_teema_yhteys c ON c.id_kaavaobjekti_piste = a.id
INNER JOIN yk_kuvaustekniikka.teema b ON c.id_teema = b.id;

CREATE VIEW yk_yleiskaava.kaavaobjekti_viiva_teema AS
SELECT a.*, b.id AS "teeman_id", b.nimi AS "teeman_nimi", b.kuvaus AS "teeman_kuvaus", b.sld_url
FROM yk_yleiskaava.kaavaobjekti_viiva a
INNER JOIN yk_kuvaustekniikka.kaavaobjekti_teema_yhteys c ON c.id_kaavaobjekti_viiva = a.id
INNER JOIN yk_kuvaustekniikka.teema b ON c.id_teema = b.id;

CREATE VIEW yk_yleiskaava.kaavaobjekti_alue_teema AS
SELECT a.*, b.id AS "teeman_id", b.nimi AS "teeman_nimi", b.kuvaus AS "teeman_kuvaus", b.sld_url
FROM yk_yleiskaava.kaavaobjekti_alue a
INNER JOIN yk_kuvaustekniikka.kaavaobjekti_teema_yhteys c ON c.id_kaavaobjekti_alue = a.id
INNER JOIN yk_kuvaustekniikka.teema b ON c.id_teema = b.id;

CREATE VIEW yk_yleiskaava.kaavaobjekti_alue_taydentava_teema AS
SELECT a.*, b.id AS "teeman_id", b.nimi AS "teeman_nimi", b.kuvaus AS "teeman_kuvaus", b.sld_url
FROM yk_yleiskaava.kaavaobjekti_alue_taydentava a
INNER JOIN yk_kuvaustekniikka.kaavaobjekti_teema_yhteys c ON c.id_kaavaobjekti_alue_taydentava = a.id
INNER JOIN yk_kuvaustekniikka.teema b ON c.id_teema = b.id;
