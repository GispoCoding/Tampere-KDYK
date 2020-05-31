DROP VIEW IF EXISTS yk_tarkistus.tarkistus_kaavaobjekti_alue_teemat_lkm;
DROP VIEW IF EXISTS yk_tarkistus.tarkistus_kaavaobjekti_alue_teemat_yhdessa;
CREATE VIEW yk_tarkistus.tarkistus_kaavaobjekti_alue_teemat_yhdessa AS
SELECT
	row_number() OVER () as rnum,
	geom,
	kaavaobjekti_alue.id,
	kayttotarkoitus_lyhenne,
	COUNT(*) teemat_lkm,
	string_agg(teema.nimi, '; ') AS teemat,
	string_agg(teema.kuvaus, '; ') AS teema_kuvaukset,
	kaavaobjekti_alue.version_loppumispvm,
	yleiskaava.nimi AS yleiskaava
FROM
	yk_yleiskaava.kaavaobjekti_alue,
	yk_kuvaustekniikka.teema AS teema,
	yk_kuvaustekniikka.kaavaobjekti_teema_yhteys AS kaavaobjekti_teema_yhteys,
	yk_yleiskaava.yleiskaava
WHERE
	teema.id = kaavaobjekti_teema_yhteys.id_teema AND
	kaavaobjekti_alue.id = kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue AND
	kaavaobjekti_alue.id_yleiskaava = yleiskaava.id
GROUP BY
	kaavaobjekti_alue.id, kayttotarkoitus_lyhenne, kaavaobjekti_alue.version_loppumispvm, geom, yleiskaava.nimi;
	
	
DROP VIEW IF EXISTS yk_tarkistus.tarkistus_kaavaobjekti_alue_taydentava_teemat_lkm;
DROP VIEW IF EXISTS yk_tarkistus.tarkistus_kaavaobjekti_alue_taydentava_teemat_yhdessa;
CREATE VIEW yk_tarkistus.tarkistus_kaavaobjekti_alue_taydentava_teemat_yhdessa AS
SELECT
	row_number() OVER () as rnum,
	geom,
	kaavaobjekti_alue_taydentava.id,
	kayttotarkoitus_lyhenne,
	COUNT(*) teemat_lkm,
	string_agg(teema.nimi, '; ') AS teemat,
	string_agg(teema.kuvaus, '; ') AS teema_kuvaukset,
	kaavaobjekti_alue_taydentava.version_loppumispvm,
	yleiskaava.nimi AS yleiskaava
FROM
	yk_yleiskaava.kaavaobjekti_alue_taydentava,
	yk_kuvaustekniikka.teema AS teema,
	yk_kuvaustekniikka.kaavaobjekti_teema_yhteys AS kaavaobjekti_teema_yhteys,
	yk_yleiskaava.yleiskaava
WHERE
	teema.id = kaavaobjekti_teema_yhteys.id_teema AND
	kaavaobjekti_alue_taydentava.id = kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue_taydentava AND
	kaavaobjekti_alue_taydentava.id_yleiskaava = yleiskaava.id
GROUP BY
	kaavaobjekti_alue_taydentava.id, kayttotarkoitus_lyhenne, kaavaobjekti_alue_taydentava.version_loppumispvm, geom, yleiskaava.nimi;
	

DROP VIEW IF EXISTS yk_tarkistus.tarkistus_kaavaobjekti_viiva_teemat_lkm;
DROP VIEW IF EXISTS yk_tarkistus.tarkistus_kaavaobjekti_viiva_teemat_yhdessa;
CREATE VIEW yk_tarkistus.tarkistus_kaavaobjekti_viiva_teemat_yhdessa AS
SELECT
	row_number() OVER () as rnum,
	geom,
	kaavaobjekti_viiva.id,
	kayttotarkoitus_lyhenne,
	COUNT(*) teemat_lkm,
	string_agg(teema.nimi, '; ') AS teemat,
	string_agg(teema.kuvaus, '; ') AS teema_kuvaukset,
	kaavaobjekti_viiva.version_loppumispvm,
	yleiskaava.nimi AS yleiskaava
FROM
	yk_yleiskaava.kaavaobjekti_viiva,
	yk_kuvaustekniikka.teema AS teema,
	yk_kuvaustekniikka.kaavaobjekti_teema_yhteys AS kaavaobjekti_teema_yhteys,
	yk_yleiskaava.yleiskaava
WHERE
	teema.id = kaavaobjekti_teema_yhteys.id_teema AND
	kaavaobjekti_viiva.id = kaavaobjekti_teema_yhteys.id_kaavaobjekti_viiva AND
	kaavaobjekti_viiva.id_yleiskaava = yleiskaava.id
GROUP BY
	kaavaobjekti_viiva.id, kayttotarkoitus_lyhenne, kaavaobjekti_viiva.version_loppumispvm, geom, yleiskaava.nimi;
	

DROP VIEW IF EXISTS yk_tarkistus.tarkistus_kaavaobjekti_piste_teemat_lkm;
DROP VIEW IF EXISTS yk_tarkistus.tarkistus_kaavaobjekti_piste_teemat_yhdessa;
CREATE VIEW yk_tarkistus.tarkistus_kaavaobjekti_piste_teemat_yhdessa AS
SELECT
	row_number() OVER () as rnum,
	geom,
	kaavaobjekti_piste.id,
	kayttotarkoitus_lyhenne,
	COUNT(*) teemat_lkm,
	string_agg(teema.nimi, '; ') AS teemat,
	string_agg(teema.kuvaus, '; ') AS teema_kuvaukset,
	kaavaobjekti_piste.version_loppumispvm,
	yleiskaava.nimi AS yleiskaava
FROM
	yk_yleiskaava.kaavaobjekti_piste,
	yk_kuvaustekniikka.teema AS teema,
	yk_kuvaustekniikka.kaavaobjekti_teema_yhteys AS kaavaobjekti_teema_yhteys,
	yk_yleiskaava.yleiskaava
WHERE
	teema.id = kaavaobjekti_teema_yhteys.id_teema AND
	kaavaobjekti_piste.id = kaavaobjekti_teema_yhteys.id_kaavaobjekti_piste AND
	kaavaobjekti_piste.id_yleiskaava = yleiskaava.id
GROUP BY
	kaavaobjekti_piste.id, kayttotarkoitus_lyhenne, kaavaobjekti_piste.version_loppumispvm, geom, yleiskaava.nimi;
		
		
--------------------------------------------------------------------------------


DROP VIEW IF EXISTS yk_tarkistus.tarkistus_kaavaobjekti_alue_kaavamaaraykset_yhdessa;
CREATE VIEW yk_tarkistus.tarkistus_kaavaobjekti_alue_kaavamaaraykset_yhdessa AS
SELECT
	row_number() OVER () as rnum,
	geom,
	kaavaobjekti_alue.id,
	kayttotarkoitus_lyhenne,
	COUNT(*) kaavamaaraykset_lkm,
	string_agg(kaavamaarays.kaavamaarays_otsikko, '; ') AS kaavamaarays_otsikot,
	kaavaobjekti_alue.version_loppumispvm,
	yleiskaava.nimi AS yleiskaava
FROM
	yk_yleiskaava.kaavaobjekti_alue,
	yk_yleiskaava.kaavamaarays AS kaavamaarays,
	yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys AS kaavaobjekti_kaavamaarays_yhteys,
	yk_yleiskaava.yleiskaava
WHERE
	kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays AND
	kaavaobjekti_alue.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue AND
	kaavaobjekti_alue.id_yleiskaava = yleiskaava.id
GROUP BY
	kaavaobjekti_alue.id, kayttotarkoitus_lyhenne, kaavaobjekti_alue.version_loppumispvm, geom, yleiskaava.nimi;
	

DROP VIEW IF EXISTS yk_tarkistus.tarkistus_kaavaobjekti_alue_taydentava_kaavamaaraykset_yhdessa;
CREATE VIEW yk_tarkistus.tarkistus_kaavaobjekti_alue_taydentava_kaavamaaraykset_yhdessa AS
SELECT
	row_number() OVER () as rnum,
	geom,
	kaavaobjekti_alue_taydentava.id,
	kayttotarkoitus_lyhenne,
	COUNT(*) kaavamaaraykset_lkm,
	string_agg(kaavamaarays.kaavamaarays_otsikko, '; ') AS kaavamaarays_otsikot,
	kaavaobjekti_alue_taydentava.version_loppumispvm,
	yleiskaava.nimi AS yleiskaava
FROM
	yk_yleiskaava.kaavaobjekti_alue_taydentava,
	yk_yleiskaava.kaavamaarays AS kaavamaarays,
	yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys AS kaavaobjekti_kaavamaarays_yhteys,
	yk_yleiskaava.yleiskaava
WHERE
	kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays AND
	kaavaobjekti_alue_taydentava.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue_taydentava AND
	kaavaobjekti_alue_taydentava.id_yleiskaava = yleiskaava.id
GROUP BY
	kaavaobjekti_alue_taydentava.id, kayttotarkoitus_lyhenne, kaavaobjekti_alue_taydentava.version_loppumispvm, geom, yleiskaava.nimi;


DROP VIEW IF EXISTS yk_tarkistus.tarkistus_kaavaobjekti_viiva_kaavamaaraykset_yhdessa;
CREATE VIEW yk_tarkistus.tarkistus_kaavaobjekti_viiva_kaavamaaraykset_yhdessa AS
SELECT
	row_number() OVER () as rnum,
	geom,
	kaavaobjekti_viiva.id,
	kayttotarkoitus_lyhenne,
	COUNT(*) kaavamaaraykset_lkm,
	string_agg(kaavamaarays.kaavamaarays_otsikko, '; ') AS kaavamaarays_otsikot,
	kaavaobjekti_viiva.version_loppumispvm,
	yleiskaava.nimi AS yleiskaava
FROM
	yk_yleiskaava.kaavaobjekti_viiva,
	yk_yleiskaava.kaavamaarays AS kaavamaarays,
	yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys AS kaavaobjekti_kaavamaarays_yhteys,
	yk_yleiskaava.yleiskaava
WHERE
	kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays AND
	kaavaobjekti_viiva.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_viiva AND
	kaavaobjekti_viiva.id_yleiskaava = yleiskaava.id
GROUP BY
	kaavaobjekti_viiva.id, kayttotarkoitus_lyhenne, kaavaobjekti_viiva.version_loppumispvm, geom, yleiskaava.nimi;
	
	
DROP VIEW IF EXISTS yk_tarkistus.tarkistus_kaavaobjekti_piste_kaavamaaraykset_yhdessa;
CREATE VIEW yk_tarkistus.tarkistus_kaavaobjekti_piste_kaavamaaraykset_yhdessa AS
SELECT
	row_number() OVER () as rnum,
	geom,
	kaavaobjekti_piste.id,
	kayttotarkoitus_lyhenne,
	COUNT(*) kaavamaaraykset_lkm,
	string_agg(kaavamaarays.kaavamaarays_otsikko, '; ') AS kaavamaarays_otsikot,
	kaavaobjekti_piste.version_loppumispvm,
	yleiskaava.nimi AS yleiskaava
FROM
	yk_yleiskaava.kaavaobjekti_piste,
	yk_yleiskaava.kaavamaarays AS kaavamaarays,
	yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys AS kaavaobjekti_kaavamaarays_yhteys,
	yk_yleiskaava.yleiskaava
WHERE
	kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays AND
	kaavaobjekti_piste.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_piste AND
	kaavaobjekti_piste.id_yleiskaava = yleiskaava.id
GROUP BY
	kaavaobjekti_piste.id, kayttotarkoitus_lyhenne, kaavaobjekti_piste.version_loppumispvm, geom, yleiskaava.nimi;
	
--------------------------------------------------------------------------------
	
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA yk_tarkistus, yk_yleiskaava, yk_koodiluettelot, yk_kuvaustekniikka, yk_suunnitteluparametrit, yk_prosessi, yk_mitoitus_varanto, yk_metatiedot, yk_inspire, yk_geoserver TO avoin_yleiskaava;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA yk_tarkistus, yk_yleiskaava, yk_koodiluettelot, yk_kuvaustekniikka, yk_suunnitteluparametrit, yk_prosessi, yk_mitoitus_varanto, yk_metatiedot, yk_inspire, yk_geoserver TO avoin_yleiskaava;

