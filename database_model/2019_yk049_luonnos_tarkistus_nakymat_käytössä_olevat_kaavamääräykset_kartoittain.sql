
DROP VIEW IF EXISTS yk_tarkistus.tarkistus_kartta1_kaavamaaraykset;
CREATE VIEW yk_tarkistus.tarkistus_kartta1_kaavamaaraykset AS
SELECT
	row_number() OVER () as rnum, k.* FROM (
	SELECT DISTINCT
		k.* FROM (
			SELECT DISTINCT
				kaavamaarays.kaavamaarays_otsikko, kaavamaarays.maaraysteksti, kaavamaarays.kuvaus_teksti, teema.kuvaus
			FROM
				yk_yleiskaava.kaavamaarays AS kaavamaarays,
				yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys AS kaavaobjekti_kaavamaarays_yhteys,
				yk_yleiskaava.kaavaobjekti_alue AS kaavaobjekti_alue,
				yk_kuvaustekniikka.teema AS teema,
				yk_kuvaustekniikka.kaavaobjekti_teema_yhteys AS kaavaobjekti_teema_yhteys
			WHERE
				teema.kuvaus = 'Kartta 1' AND
				kaavaobjekti_teema_yhteys.id_teema = teema.id AND
				kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue = kaavaobjekti_alue.id AND
				kaavaobjekti_alue.version_loppumispvm IS NULL AND
				kaavaobjekti_alue.id_yleiskaava IS NOT NULL AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue = kaavaobjekti_alue.id AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id
			UNION
			SELECT 
				kaavamaarays.kaavamaarays_otsikko, kaavamaarays.maaraysteksti, kaavamaarays.kuvaus_teksti, teema.kuvaus
			FROM
				yk_yleiskaava.kaavamaarays AS kaavamaarays,
				yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys AS kaavaobjekti_kaavamaarays_yhteys,
				yk_yleiskaava.kaavaobjekti_alue_taydentava AS kaavaobjekti_alue_taydentava,
				yk_kuvaustekniikka.teema AS teema,
				yk_kuvaustekniikka.kaavaobjekti_teema_yhteys AS kaavaobjekti_teema_yhteys
			WHERE
				teema.kuvaus = 'Kartta 1' AND
				kaavaobjekti_teema_yhteys.id_teema = teema.id AND
				kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue_taydentava = kaavaobjekti_alue_taydentava.id AND
				kaavaobjekti_alue_taydentava.version_loppumispvm IS NULL AND
				kaavaobjekti_alue_taydentava.id_yleiskaava IS NOT NULL AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue_taydentava = kaavaobjekti_alue_taydentava.id AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id
			UNION
			SELECT 
				kaavamaarays.kaavamaarays_otsikko, kaavamaarays.maaraysteksti, kaavamaarays.kuvaus_teksti, teema.kuvaus
			FROM
				yk_yleiskaava.kaavamaarays AS kaavamaarays,
				yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys AS kaavaobjekti_kaavamaarays_yhteys,
				yk_yleiskaava.kaavaobjekti_viiva AS kaavaobjekti_viiva,
				yk_kuvaustekniikka.teema AS teema,
				yk_kuvaustekniikka.kaavaobjekti_teema_yhteys AS kaavaobjekti_teema_yhteys
			WHERE
				teema.kuvaus = 'Kartta 1' AND
				kaavaobjekti_teema_yhteys.id_teema = teema.id AND
				kaavaobjekti_teema_yhteys.id_kaavaobjekti_viiva = kaavaobjekti_viiva.id AND
				kaavaobjekti_viiva.version_loppumispvm IS NULL AND
				kaavaobjekti_viiva.id_yleiskaava IS NOT NULL AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_viiva = kaavaobjekti_viiva.id AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id
			UNION
			SELECT 
				kaavamaarays.kaavamaarays_otsikko, kaavamaarays.maaraysteksti, kaavamaarays.kuvaus_teksti, teema.kuvaus
			FROM
				yk_yleiskaava.kaavamaarays AS kaavamaarays,
				yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys AS kaavaobjekti_kaavamaarays_yhteys,
				yk_yleiskaava.kaavaobjekti_piste AS kaavaobjekti_piste,
				yk_kuvaustekniikka.teema AS teema,
				yk_kuvaustekniikka.kaavaobjekti_teema_yhteys AS kaavaobjekti_teema_yhteys
			WHERE
				teema.kuvaus = 'Kartta 1' AND
				kaavaobjekti_teema_yhteys.id_teema = teema.id AND
				kaavaobjekti_teema_yhteys.id_kaavaobjekti_piste = kaavaobjekti_piste.id AND
				kaavaobjekti_piste.version_loppumispvm IS NULL AND
				kaavaobjekti_piste.id_yleiskaava IS NOT NULL AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_piste = kaavaobjekti_piste.id AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id
			) k
		ORDER BY kaavamaarays_otsikko
	) k;

------------------

DROP VIEW IF EXISTS yk_tarkistus.tarkistus_kartta2_kaavamaaraykset;
CREATE VIEW yk_tarkistus.tarkistus_kartta2_kaavamaaraykset AS
SELECT
	row_number() OVER () as rnum, k.* FROM (
	SELECT DISTINCT
		k.* FROM (
			SELECT DISTINCT
				kaavamaarays.kaavamaarays_otsikko, kaavamaarays.maaraysteksti, kaavamaarays.kuvaus_teksti, teema.kuvaus
			FROM
				yk_yleiskaava.kaavamaarays AS kaavamaarays,
				yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys AS kaavaobjekti_kaavamaarays_yhteys,
				yk_yleiskaava.kaavaobjekti_alue AS kaavaobjekti_alue,
				yk_kuvaustekniikka.teema AS teema,
				yk_kuvaustekniikka.kaavaobjekti_teema_yhteys AS kaavaobjekti_teema_yhteys
			WHERE
				teema.kuvaus = 'Kartta 2' AND
				kaavaobjekti_teema_yhteys.id_teema = teema.id AND
				kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue = kaavaobjekti_alue.id AND
				kaavaobjekti_alue.version_loppumispvm IS NULL AND
				kaavaobjekti_alue.id_yleiskaava IS NOT NULL AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue = kaavaobjekti_alue.id AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id
			UNION
			SELECT 
				kaavamaarays.kaavamaarays_otsikko, kaavamaarays.maaraysteksti, kaavamaarays.kuvaus_teksti, teema.kuvaus
			FROM
				yk_yleiskaava.kaavamaarays AS kaavamaarays,
				yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys AS kaavaobjekti_kaavamaarays_yhteys,
				yk_yleiskaava.kaavaobjekti_alue_taydentava AS kaavaobjekti_alue_taydentava,
				yk_kuvaustekniikka.teema AS teema,
				yk_kuvaustekniikka.kaavaobjekti_teema_yhteys AS kaavaobjekti_teema_yhteys
			WHERE
				teema.kuvaus = 'Kartta 2' AND
				kaavaobjekti_teema_yhteys.id_teema = teema.id AND
				kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue_taydentava = kaavaobjekti_alue_taydentava.id AND
				kaavaobjekti_alue_taydentava.version_loppumispvm IS NULL AND
				kaavaobjekti_alue_taydentava.id_yleiskaava IS NOT NULL AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue_taydentava = kaavaobjekti_alue_taydentava.id AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id
			UNION
			SELECT 
				kaavamaarays.kaavamaarays_otsikko, kaavamaarays.maaraysteksti, kaavamaarays.kuvaus_teksti, teema.kuvaus
			FROM
				yk_yleiskaava.kaavamaarays AS kaavamaarays,
				yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys AS kaavaobjekti_kaavamaarays_yhteys,
				yk_yleiskaava.kaavaobjekti_viiva AS kaavaobjekti_viiva,
				yk_kuvaustekniikka.teema AS teema,
				yk_kuvaustekniikka.kaavaobjekti_teema_yhteys AS kaavaobjekti_teema_yhteys
			WHERE
				teema.kuvaus = 'Kartta 2' AND
				kaavaobjekti_teema_yhteys.id_teema = teema.id AND
				kaavaobjekti_teema_yhteys.id_kaavaobjekti_viiva = kaavaobjekti_viiva.id AND
				kaavaobjekti_viiva.version_loppumispvm IS NULL AND
				kaavaobjekti_viiva.id_yleiskaava IS NOT NULL AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_viiva = kaavaobjekti_viiva.id AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id
			UNION
			SELECT 
				kaavamaarays.kaavamaarays_otsikko, kaavamaarays.maaraysteksti, kaavamaarays.kuvaus_teksti, teema.kuvaus
			FROM
				yk_yleiskaava.kaavamaarays AS kaavamaarays,
				yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys AS kaavaobjekti_kaavamaarays_yhteys,
				yk_yleiskaava.kaavaobjekti_piste AS kaavaobjekti_piste,
				yk_kuvaustekniikka.teema AS teema,
				yk_kuvaustekniikka.kaavaobjekti_teema_yhteys AS kaavaobjekti_teema_yhteys
			WHERE
				teema.kuvaus = 'Kartta 2' AND
				kaavaobjekti_teema_yhteys.id_teema = teema.id AND
				kaavaobjekti_teema_yhteys.id_kaavaobjekti_piste = kaavaobjekti_piste.id AND
				kaavaobjekti_piste.version_loppumispvm IS NULL AND
				kaavaobjekti_piste.id_yleiskaava IS NOT NULL AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_piste = kaavaobjekti_piste.id AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id
			) k
		ORDER BY kaavamaarays_otsikko
	) k;

------------------

DROP VIEW IF EXISTS yk_tarkistus.tarkistus_kartta3_kaavamaaraykset;
CREATE VIEW yk_tarkistus.tarkistus_kartta3_kaavamaaraykset AS
SELECT
	row_number() OVER () as rnum, k.* FROM (
	SELECT DISTINCT
		k.* FROM (
			SELECT DISTINCT
				kaavamaarays.kaavamaarays_otsikko, kaavamaarays.maaraysteksti, kaavamaarays.kuvaus_teksti, teema.kuvaus
			FROM
				yk_yleiskaava.kaavamaarays AS kaavamaarays,
				yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys AS kaavaobjekti_kaavamaarays_yhteys,
				yk_yleiskaava.kaavaobjekti_alue AS kaavaobjekti_alue,
				yk_kuvaustekniikka.teema AS teema,
				yk_kuvaustekniikka.kaavaobjekti_teema_yhteys AS kaavaobjekti_teema_yhteys
			WHERE
				teema.kuvaus = 'Kartta 3' AND
				kaavaobjekti_teema_yhteys.id_teema = teema.id AND
				kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue = kaavaobjekti_alue.id AND
				kaavaobjekti_alue.version_loppumispvm IS NULL AND
				kaavaobjekti_alue.id_yleiskaava IS NOT NULL AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue = kaavaobjekti_alue.id AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id
			UNION
			SELECT 
				kaavamaarays.kaavamaarays_otsikko, kaavamaarays.maaraysteksti, kaavamaarays.kuvaus_teksti, teema.kuvaus
			FROM
				yk_yleiskaava.kaavamaarays AS kaavamaarays,
				yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys AS kaavaobjekti_kaavamaarays_yhteys,
				yk_yleiskaava.kaavaobjekti_alue_taydentava AS kaavaobjekti_alue_taydentava,
				yk_kuvaustekniikka.teema AS teema,
				yk_kuvaustekniikka.kaavaobjekti_teema_yhteys AS kaavaobjekti_teema_yhteys
			WHERE
				teema.kuvaus = 'Kartta 3' AND
				kaavaobjekti_teema_yhteys.id_teema = teema.id AND
				kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue_taydentava = kaavaobjekti_alue_taydentava.id AND
				kaavaobjekti_alue_taydentava.version_loppumispvm IS NULL AND
				kaavaobjekti_alue_taydentava.id_yleiskaava IS NOT NULL AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue_taydentava = kaavaobjekti_alue_taydentava.id AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id
			UNION
			SELECT 
				kaavamaarays.kaavamaarays_otsikko, kaavamaarays.maaraysteksti, kaavamaarays.kuvaus_teksti, teema.kuvaus
			FROM
				yk_yleiskaava.kaavamaarays AS kaavamaarays,
				yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys AS kaavaobjekti_kaavamaarays_yhteys,
				yk_yleiskaava.kaavaobjekti_viiva AS kaavaobjekti_viiva,
				yk_kuvaustekniikka.teema AS teema,
				yk_kuvaustekniikka.kaavaobjekti_teema_yhteys AS kaavaobjekti_teema_yhteys
			WHERE
				teema.kuvaus = 'Kartta 3' AND
				kaavaobjekti_teema_yhteys.id_teema = teema.id AND
				kaavaobjekti_teema_yhteys.id_kaavaobjekti_viiva = kaavaobjekti_viiva.id AND
				kaavaobjekti_viiva.version_loppumispvm IS NULL AND
				kaavaobjekti_viiva.id_yleiskaava IS NOT NULL AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_viiva = kaavaobjekti_viiva.id AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id
			UNION
			SELECT 
				kaavamaarays.kaavamaarays_otsikko, kaavamaarays.maaraysteksti, kaavamaarays.kuvaus_teksti, teema.kuvaus
			FROM
				yk_yleiskaava.kaavamaarays AS kaavamaarays,
				yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys AS kaavaobjekti_kaavamaarays_yhteys,
				yk_yleiskaava.kaavaobjekti_piste AS kaavaobjekti_piste,
				yk_kuvaustekniikka.teema AS teema,
				yk_kuvaustekniikka.kaavaobjekti_teema_yhteys AS kaavaobjekti_teema_yhteys
			WHERE
				teema.kuvaus = 'Kartta 3' AND
				kaavaobjekti_teema_yhteys.id_teema = teema.id AND
				kaavaobjekti_teema_yhteys.id_kaavaobjekti_piste = kaavaobjekti_piste.id AND
				kaavaobjekti_piste.version_loppumispvm IS NULL AND
				kaavaobjekti_piste.id_yleiskaava IS NOT NULL AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_piste = kaavaobjekti_piste.id AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id
			) k
		ORDER BY kaavamaarays_otsikko
	) k;
	
------------------

DROP VIEW IF EXISTS yk_tarkistus.tarkistus_kartta4_kaavamaaraykset;
CREATE VIEW yk_tarkistus.tarkistus_kartta4_kaavamaaraykset AS
SELECT
	row_number() OVER () as rnum, k.* FROM (
	SELECT DISTINCT
		k.* FROM (
			SELECT DISTINCT
				kaavamaarays.kaavamaarays_otsikko, kaavamaarays.maaraysteksti, kaavamaarays.kuvaus_teksti, teema.kuvaus
			FROM
				yk_yleiskaava.kaavamaarays AS kaavamaarays,
				yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys AS kaavaobjekti_kaavamaarays_yhteys,
				yk_yleiskaava.kaavaobjekti_alue AS kaavaobjekti_alue,
				yk_kuvaustekniikka.teema AS teema,
				yk_kuvaustekniikka.kaavaobjekti_teema_yhteys AS kaavaobjekti_teema_yhteys
			WHERE
				teema.kuvaus = 'Kartta 4' AND
				kaavaobjekti_teema_yhteys.id_teema = teema.id AND
				kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue = kaavaobjekti_alue.id AND
				kaavaobjekti_alue.version_loppumispvm IS NULL AND
				kaavaobjekti_alue.id_yleiskaava IS NOT NULL AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue = kaavaobjekti_alue.id AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id
			UNION
			SELECT 
				kaavamaarays.kaavamaarays_otsikko, kaavamaarays.maaraysteksti, kaavamaarays.kuvaus_teksti, teema.kuvaus
			FROM
				yk_yleiskaava.kaavamaarays AS kaavamaarays,
				yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys AS kaavaobjekti_kaavamaarays_yhteys,
				yk_yleiskaava.kaavaobjekti_alue_taydentava AS kaavaobjekti_alue_taydentava,
				yk_kuvaustekniikka.teema AS teema,
				yk_kuvaustekniikka.kaavaobjekti_teema_yhteys AS kaavaobjekti_teema_yhteys
			WHERE
				teema.kuvaus = 'Kartta 4' AND
				kaavaobjekti_teema_yhteys.id_teema = teema.id AND
				kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue_taydentava = kaavaobjekti_alue_taydentava.id AND
				kaavaobjekti_alue_taydentava.version_loppumispvm IS NULL AND
				kaavaobjekti_alue_taydentava.id_yleiskaava IS NOT NULL AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue_taydentava = kaavaobjekti_alue_taydentava.id AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id
			UNION
			SELECT 
				kaavamaarays.kaavamaarays_otsikko, kaavamaarays.maaraysteksti, kaavamaarays.kuvaus_teksti, teema.kuvaus
			FROM
				yk_yleiskaava.kaavamaarays AS kaavamaarays,
				yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys AS kaavaobjekti_kaavamaarays_yhteys,
				yk_yleiskaava.kaavaobjekti_viiva AS kaavaobjekti_viiva,
				yk_kuvaustekniikka.teema AS teema,
				yk_kuvaustekniikka.kaavaobjekti_teema_yhteys AS kaavaobjekti_teema_yhteys
			WHERE
				teema.kuvaus = 'Kartta 4' AND
				kaavaobjekti_teema_yhteys.id_teema = teema.id AND
				kaavaobjekti_teema_yhteys.id_kaavaobjekti_viiva = kaavaobjekti_viiva.id AND
				kaavaobjekti_viiva.version_loppumispvm IS NULL AND
				kaavaobjekti_viiva.id_yleiskaava IS NOT NULL AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_viiva = kaavaobjekti_viiva.id AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id
			UNION
			SELECT 
				kaavamaarays.kaavamaarays_otsikko, kaavamaarays.maaraysteksti, kaavamaarays.kuvaus_teksti, teema.kuvaus
			FROM
				yk_yleiskaava.kaavamaarays AS kaavamaarays,
				yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys AS kaavaobjekti_kaavamaarays_yhteys,
				yk_yleiskaava.kaavaobjekti_piste AS kaavaobjekti_piste,
				yk_kuvaustekniikka.teema AS teema,
				yk_kuvaustekniikka.kaavaobjekti_teema_yhteys AS kaavaobjekti_teema_yhteys
			WHERE
				teema.kuvaus = 'Kartta 4' AND
				kaavaobjekti_teema_yhteys.id_teema = teema.id AND
				kaavaobjekti_teema_yhteys.id_kaavaobjekti_piste = kaavaobjekti_piste.id AND
				kaavaobjekti_piste.version_loppumispvm IS NULL AND
				kaavaobjekti_piste.id_yleiskaava IS NOT NULL AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_piste = kaavaobjekti_piste.id AND
				kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id
			) k
		ORDER BY kaavamaarays_otsikko
	) k;
	
------------------

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA yk_tarkistus, yk_yleiskaava, yk_koodiluettelot, yk_kuvaustekniikka, yk_suunnitteluparametrit, yk_prosessi, yk_mitoitus_varanto, yk_metatiedot, yk_inspire, yk_geoserver TO avoin_yleiskaava;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA yk_tarkistus, yk_yleiskaava, yk_koodiluettelot, yk_kuvaustekniikka, yk_suunnitteluparametrit, yk_prosessi, yk_mitoitus_varanto, yk_metatiedot, yk_inspire, yk_geoserver TO avoin_yleiskaava;


