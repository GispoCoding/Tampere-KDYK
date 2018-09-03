-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.0
-- PostgreSQL version: 9.6
-- Project Site: pgmodeler.com.br
-- Model Author: ---


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: avoin_yleiskaava | type: DATABASE --
-- -- DROP DATABASE IF EXISTS avoin_yleiskaava;
-- CREATE DATABASE avoin_yleiskaava
-- ;
-- -- ddl-end --
-- 

-- object: yk_yleiskaava | type: SCHEMA --
-- DROP SCHEMA IF EXISTS yk_yleiskaava CASCADE;
CREATE SCHEMA yk_yleiskaava;
-- ddl-end --
ALTER SCHEMA yk_yleiskaava OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot | type: SCHEMA --
-- DROP SCHEMA IF EXISTS yk_koodiluettelot CASCADE;
CREATE SCHEMA yk_koodiluettelot;
-- ddl-end --
ALTER SCHEMA yk_koodiluettelot OWNER TO postgres;
-- ddl-end --

-- object: yk_kuvaustekniikka | type: SCHEMA --
-- DROP SCHEMA IF EXISTS yk_kuvaustekniikka CASCADE;
CREATE SCHEMA yk_kuvaustekniikka;
-- ddl-end --
ALTER SCHEMA yk_kuvaustekniikka OWNER TO postgres;
-- ddl-end --

-- object: yk_suunnitteluparametrit | type: SCHEMA --
-- DROP SCHEMA IF EXISTS yk_suunnitteluparametrit CASCADE;
CREATE SCHEMA yk_suunnitteluparametrit;
-- ddl-end --
ALTER SCHEMA yk_suunnitteluparametrit OWNER TO postgres;
-- ddl-end --

-- object: yk_prosessi | type: SCHEMA --
-- DROP SCHEMA IF EXISTS yk_prosessi CASCADE;
CREATE SCHEMA yk_prosessi;
-- ddl-end --
ALTER SCHEMA yk_prosessi OWNER TO postgres;
-- ddl-end --

-- object: yk_mitoitus_varanto | type: SCHEMA --
-- DROP SCHEMA IF EXISTS yk_mitoitus_varanto CASCADE;
CREATE SCHEMA yk_mitoitus_varanto;
-- ddl-end --
ALTER SCHEMA yk_mitoitus_varanto OWNER TO postgres;
-- ddl-end --

-- object: yk_metatiedot | type: SCHEMA --
-- DROP SCHEMA IF EXISTS yk_metatiedot CASCADE;
CREATE SCHEMA yk_metatiedot;
-- ddl-end --
ALTER SCHEMA yk_metatiedot OWNER TO postgres;
-- ddl-end --

-- object: yk_inspire | type: SCHEMA --
-- DROP SCHEMA IF EXISTS yk_inspire CASCADE;
CREATE SCHEMA yk_inspire;
-- ddl-end --
ALTER SCHEMA yk_inspire OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver | type: SCHEMA --
-- DROP SCHEMA IF EXISTS yk_geoserver CASCADE;
CREATE SCHEMA yk_geoserver;
-- ddl-end --
ALTER SCHEMA yk_geoserver OWNER TO postgres;
-- ddl-end --

SET search_path TO pg_catalog,public,yk_yleiskaava,yk_koodiluettelot,yk_kuvaustekniikka,yk_suunnitteluparametrit,yk_prosessi,yk_mitoitus_varanto,yk_metatiedot,yk_inspire,yk_geoserver;
-- ddl-end --

-- object: yk_yleiskaava.kaavaobjekti_alue | type: TABLE --
-- DROP TABLE IF EXISTS yk_yleiskaava.kaavaobjekti_alue CASCADE;
CREATE TABLE yk_yleiskaava.kaavaobjekti_alue(
	id uuid NOT NULL,
	geom geometry(MULTIPOLYGONZ, 3878),
	nimi varchar,
	muokkaaja varchar,
	voimaantulopvm date,
	kumoamispvm date,
	version_alkamispvm date,
	version_loppumispvm date,
	nro varchar,
	aluevarauskohde boolean,
	taydentava_kaavamerkinta boolean,
	kohde_periytyy_muualta boolean,
	kansallinen_laillinen_sitovuus varchar,
	alkup_taulun_nimi varchar,
	id_yleiskaava uuid,
	id_laillinen_sitovuus uuid,
	id_prosessin_vaihe uuid,
	id_kansallinen_prosessin_vaihe uuid,
	id_kaavoitusprosessin_tila uuid,
	id_kaavakohteen_olemassaolo uuid,
	id_kansallisen_kaavakohteen_olemassaolo uuid,
	kayttotarkoitus_koodi varchar,
	kayttotarkoitus_nimi varchar,
	karttamerkinta varchar,
	katuosoite varchar,
	leveys_m real,
	pituus_km real,
	yhdrak_palvelualue varchar,
	yhdrak_rakennusoikeus varchar,
	mj_kp_laji varchar,
	mj_kp_tyyppi varchar,
	mj_kp_tyypintarkenne varchar,
	mj_kp_ajoitus varchar,
	mj_kp_tunnus varchar,
	kem_vyohykeleveys_km varchar,
	kem_kohde smallint,
	puhd_saast_syy varchar,
	puhd_toimenpiteet varchar,
	puhd_saast_kuva varchar,
	puhd_selvitystarve varchar,
	referenssi varchar,
	lisatieto varchar,
	CONSTRAINT kaavaobjekti_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_yleiskaava.kaavaobjekti_alue IS 'Presence of one or several HILUCS values in an area, indicated either as the percentage covered for each value or as the values listed in their order of importance. http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/ScopeObjectDetail.action?objectDetailId=10556';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue.nimi IS 'INSPIRE - official name of the supplementary regulation - http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/SearchObjectSelection.action?search=specific+regulation+nature';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue.taydentava_kaavamerkinta IS 'jos kaavaobjektilla ei ole kaavamaaraysta, niin se ei ole taydentava_kaavamerkinta eikä aluevarauskohde';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue.kansallinen_laillinen_sitovuus IS 'INSPIRE - Legal nature of the land use regulation from a national perspective. On member state level the legal classification for plan regulations may be complex. A supplementary regulation may be principally "bindingOnlyForAuthorities" but according to national law this regulation have to be more specified to explain the specific degree of binding. (e.g. on state or regional planning level in Germany: principles of spatial planning, other spatial planning requirements or goals of spatial planning).';
-- ddl-end --
ALTER TABLE yk_yleiskaava.kaavaobjekti_alue OWNER TO postgres;
-- ddl-end --

-- object: yk_yleiskaava.yleiskaava | type: TABLE --
-- DROP TABLE IF EXISTS yk_yleiskaava.yleiskaava CASCADE;
CREATE TABLE yk_yleiskaava.yleiskaava(
	id uuid NOT NULL,
	nimi varchar NOT NULL,
	kaavan_ulkorajaus geometry(MULTIPOLYGONZ, 3878),
	vaihtoehtoinen_nimi varchar,
	vireilletulopvm date,
	voimaantulopvm date,
	kumoamispvm date,
	version_alkamispvm date,
	version_loppumispvm date,
	muokkaaja varchar,
	nro varchar,
	id_kaavan_taso uuid NOT NULL,
	id_kansallinen_prosessin_vaihe uuid,
	id_prosessin_vaihe uuid,
	id_kaavoitusprosessin_tila uuid,
	id_kansallinen_kaavatyyppi uuid,
	kuntakoodi numeric(3,0),
	CONSTRAINT yleiskaava_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.yleiskaava.version_alkamispvm IS 'INSPIRE';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.yleiskaava.nro IS 'yleiskaavan numero (esim. yk032)';
-- ddl-end --
ALTER TABLE yk_yleiskaava.yleiskaava OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.kansallinen_kaava_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.kansallinen_kaava_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.kansallinen_kaava_tyyppi AS
 ENUM ();
-- ddl-end --
ALTER TYPE yk_koodiluettelot.kansallinen_kaava_tyyppi OWNER TO postgres;
-- ddl-end --
COMMENT ON TYPE yk_koodiluettelot.kansallinen_kaava_tyyppi IS 'http://inspire.ec.europa.eu/codelist/PlanTypeNameValue/PlanTypeNameValue.fi.html';
-- ddl-end --

-- object: yk_koodiluettelot.kansallinen_kaavatyyppi | type: TABLE --
-- DROP TABLE IF EXISTS yk_koodiluettelot.kansallinen_kaavatyyppi CASCADE;
CREATE TABLE yk_koodiluettelot.kansallinen_kaavatyyppi(
	id uuid NOT NULL,
	koodi yk_koodiluettelot.kansallinen_kaava_tyyppi,
	kuvaus varchar,
	CONSTRAINT plan_type_name_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_koodiluettelot.kansallinen_kaavatyyppi IS 'Kaavatyypit siten kuin ne määritellään jäsenvaltioissa. Tässä koodiluettelossa hyväksytään mitkä tahansa tiedon tarjoajien määrittelemät arvot.';
-- ddl-end --
ALTER TABLE yk_koodiluettelot.kansallinen_kaavatyyppi OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.kaavan_taso_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.kaavan_taso_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.kaavan_taso_tyyppi AS
 ENUM ('paikallinen','kansallinen','kunnallinen','maakunnallinen_tai_seudullinen','muu','seutukunnallinen','yli-kunnallinen','yli-maakunnallinen');
-- ddl-end --
ALTER TYPE yk_koodiluettelot.kaavan_taso_tyyppi OWNER TO postgres;
-- ddl-end --
COMMENT ON TYPE yk_koodiluettelot.kaavan_taso_tyyppi IS 'http://inspire.ec.europa.eu/codelist/LevelOfSpatialPlanValue';
-- ddl-end --

-- object: yk_koodiluettelot.kaavan_taso | type: TABLE --
-- DROP TABLE IF EXISTS yk_koodiluettelot.kaavan_taso CASCADE;
CREATE TABLE yk_koodiluettelot.kaavan_taso(
	id uuid NOT NULL,
	koodi yk_koodiluettelot.kaavan_taso_tyyppi,
	kuvaus varchar,
	CONSTRAINT level_of_spatial_plan_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_koodiluettelot.kaavan_taso IS 'Kaavan aluehierarkia. http://inspire.ec.europa.eu/codelist/LevelOfSpatialPlanValue';
-- ddl-end --
ALTER TABLE yk_koodiluettelot.kaavan_taso OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.kansallinen_prosessin_vaihe_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.kansallinen_prosessin_vaihe_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.kansallinen_prosessin_vaihe_tyyppi AS
 ENUM ('vireilla_ja_valmistelussa','keskeytetty','oas_nahtavilla','luonnos_nahtavilla','ehdotus_nahtavilla','tarkistettu_ehdotus_nahtavilla','hyvaksytty_ehdotus','hyvaksytty_ehdotus_josta_valitettu','voimaankuulutettu_osin_tai_kokonaan');
-- ddl-end --
ALTER TYPE yk_koodiluettelot.kansallinen_prosessin_vaihe_tyyppi OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.kansallinen_prosessin_vaihe | type: TABLE --
-- DROP TABLE IF EXISTS yk_koodiluettelot.kansallinen_prosessin_vaihe CASCADE;
CREATE TABLE yk_koodiluettelot.kansallinen_prosessin_vaihe(
	id uuid NOT NULL,
	koodi yk_koodiluettelot.kansallinen_prosessin_vaihe_tyyppi,
	kuvaus varchar,
	CONSTRAINT status_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_koodiluettelot.kansallinen_prosessin_vaihe OWNER TO postgres;
-- ddl-end --

-- object: yk_yleiskaava.kaavadokumentti | type: TABLE --
-- DROP TABLE IF EXISTS yk_yleiskaava.kaavadokumentti CASCADE;
CREATE TABLE yk_yleiskaava.kaavadokumentti(
	id uuid NOT NULL,
	nimi varchar NOT NULL,
	lyhenne varchar,
	paivays date,
	spesifinen_referenssi varchar,
	kartta_dokumentin_uri varchar,
	selostus_dokumentin_uri varchar,
	vaikutusarviointi_dokumentin_uri varchar,
	id_yleiskaava uuid,
	CONSTRAINT kaavadokumentti_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_yleiskaava.kaavadokumentti OWNER TO postgres;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_alue DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_alue ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_koodiluettelot.aluevaraus_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.aluevaraus_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.aluevaraus_tyyppi AS
 ENUM ();
-- ddl-end --
ALTER TYPE yk_koodiluettelot.aluevaraus_tyyppi OWNER TO postgres;
-- ddl-end --
COMMENT ON TYPE yk_koodiluettelot.aluevaraus_tyyppi IS 'Ks. kaikki arvot: http://inspire.ec.europa.eu/codelist/HILUCSValue/';
-- ddl-end --

-- object: yk_koodiluettelot.muu_kaavakohde_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.muu_kaavakohde_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.muu_kaavakohde_tyyppi AS
 ENUM ();
-- ddl-end --
ALTER TYPE yk_koodiluettelot.muu_kaavakohde_tyyppi OWNER TO postgres;
-- ddl-end --
COMMENT ON TYPE yk_koodiluettelot.muu_kaavakohde_tyyppi IS 'HSRCL Ks. kaikki arvot: http://inspire.ec.europa.eu/codelist/SupplementaryRegulationValue';
-- ddl-end --

-- object: yk_koodiluettelot.kayttotarkoitus_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.kayttotarkoitus_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.kayttotarkoitus_tyyppi AS
 ENUM ('asuminen','keskustatoiminnot','palvelut','tyo_ja_tuotanto','virkistys','loma_asuminen','liikenne','erityisalue','suojelu','maa_ja_metsatalous','vesialueet');
-- ddl-end --
ALTER TYPE yk_koodiluettelot.kayttotarkoitus_tyyppi OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.kansallinen_muu_kaavakohde_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.kansallinen_muu_kaavakohde_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.kansallinen_muu_kaavakohde_tyyppi AS
 ENUM ();
-- ddl-end --
ALTER TYPE yk_koodiluettelot.kansallinen_muu_kaavakohde_tyyppi OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.kaavaobjektin_lainvoimaisuus_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.kaavaobjektin_lainvoimaisuus_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.kaavaobjektin_lainvoimaisuus_tyyppi AS
 ENUM ('lainvoimainen');
-- ddl-end --
ALTER TYPE yk_koodiluettelot.kaavaobjektin_lainvoimaisuus_tyyppi OWNER TO postgres;
-- ddl-end --

-- object: yk_suunnitteluparametrit.sidonnaisuus | type: TABLE --
-- DROP TABLE IF EXISTS yk_suunnitteluparametrit.sidonnaisuus CASCADE;
CREATE TABLE yk_suunnitteluparametrit.sidonnaisuus(
	id uuid NOT NULL,
	tyyppi varchar,
	kuvaus varchar,
	arvo varchar,
	id_sidottu_kaavaobjekti uuid,
	id_sitova_kaavaobjekti uuid,
	CONSTRAINT sidonnaisuus_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_suunnitteluparametrit.sidonnaisuus OWNER TO postgres;
-- ddl-end --

-- object: yk_suunnitteluparametrit.sidottu_kaavaobjekti | type: TABLE --
-- DROP TABLE IF EXISTS yk_suunnitteluparametrit.sidottu_kaavaobjekti CASCADE;
CREATE TABLE yk_suunnitteluparametrit.sidottu_kaavaobjekti(
	id uuid NOT NULL,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	CONSTRAINT sidottu_kaavaobjekti_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_suunnitteluparametrit.sidottu_kaavaobjekti OWNER TO postgres;
-- ddl-end --

-- object: yk_suunnitteluparametrit.sitova_kaavaobjekti | type: TABLE --
-- DROP TABLE IF EXISTS yk_suunnitteluparametrit.sitova_kaavaobjekti CASCADE;
CREATE TABLE yk_suunnitteluparametrit.sitova_kaavaobjekti(
	id uuid NOT NULL,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	CONSTRAINT sitova_kaavaobjekti_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_suunnitteluparametrit.sitova_kaavaobjekti OWNER TO postgres;
-- ddl-end --

-- object: sidottu_kaavaobjekti_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.sidonnaisuus DROP CONSTRAINT IF EXISTS sidottu_kaavaobjekti_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.sidonnaisuus ADD CONSTRAINT sidottu_kaavaobjekti_fk FOREIGN KEY (id_sidottu_kaavaobjekti)
REFERENCES yk_suunnitteluparametrit.sidottu_kaavaobjekti (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: sitova_kaavaobjekti_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.sidonnaisuus DROP CONSTRAINT IF EXISTS sitova_kaavaobjekti_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.sidonnaisuus ADD CONSTRAINT sitova_kaavaobjekti_fk FOREIGN KEY (id_sitova_kaavaobjekti)
REFERENCES yk_suunnitteluparametrit.sitova_kaavaobjekti (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_suunnitteluparametrit.mittakaava | type: TABLE --
-- DROP TABLE IF EXISTS yk_suunnitteluparametrit.mittakaava CASCADE;
CREATE TABLE yk_suunnitteluparametrit.mittakaava(
	id uuid NOT NULL,
	oletus smallint,
	minimi smallint,
	maksimi smallint,
	suunnittelijalle_tarkoitettu bool,
	id_yleiskaava uuid,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	CONSTRAINT mittakaava_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_suunnitteluparametrit.mittakaava OWNER TO postgres;
-- ddl-end --

-- object: yk_suunnitteluparametrit.ei_sitova_tavoiteaika | type: TABLE --
-- DROP TABLE IF EXISTS yk_suunnitteluparametrit.ei_sitova_tavoiteaika CASCADE;
CREATE TABLE yk_suunnitteluparametrit.ei_sitova_tavoiteaika(
	id uuid NOT NULL,
	pvm date,
	kuvaus varchar,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	CONSTRAINT ei_sitova_tavoiteaika_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_suunnitteluparametrit.ei_sitova_tavoiteaika OWNER TO postgres;
-- ddl-end --

-- object: kaavaobjekti_alue_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.ei_sitova_tavoiteaika DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.ei_sitova_tavoiteaika ADD CONSTRAINT kaavaobjekti_alue_fk FOREIGN KEY (id_kaavaobjekti_alue)
REFERENCES yk_yleiskaava.kaavaobjekti_alue (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: ei_sitova_tavoiteaika_uq | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.ei_sitova_tavoiteaika DROP CONSTRAINT IF EXISTS ei_sitova_tavoiteaika_uq CASCADE;
ALTER TABLE yk_suunnitteluparametrit.ei_sitova_tavoiteaika ADD CONSTRAINT ei_sitova_tavoiteaika_uq UNIQUE (id_kaavaobjekti_alue);
-- ddl-end --

-- object: yk_suunnitteluparametrit.tukes_vyohyke | type: TABLE --
-- DROP TABLE IF EXISTS yk_suunnitteluparametrit.tukes_vyohyke CASCADE;
CREATE TABLE yk_suunnitteluparametrit.tukes_vyohyke(
	id uuid NOT NULL,
	geom geometry(MULTIPOLYGONZ, 3878),
	nimi varchar,
	kuvaus varchar,
	linkki_data varchar,
	id_yleiskaava uuid,
	CONSTRAINT tukes_vyohyke_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_suunnitteluparametrit.tukes_vyohyke OWNER TO postgres;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.tukes_vyohyke DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.tukes_vyohyke ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_yleiskaava.taustakartta | type: TABLE --
-- DROP TABLE IF EXISTS yk_yleiskaava.taustakartta CASCADE;
CREATE TABLE yk_yleiskaava.taustakartta(
	id uuid NOT NULL,
	nimi varchar,
	lainvoimainen boolean,
	taustakarttapvm date,
	taustakartta_referenssi varchar,
	rajapinta_uri varchar,
	vain_suunnittelu boolean,
	id_yleiskaava uuid,
	CONSTRAINT kaavan_taustakartta_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_yleiskaava.taustakartta IS 'Background Map Value - Information regarding the map that has been used as a background in the definition of a spatial plan, a zoning element or a supplementary regulation. Ks. Background Map Value - http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/ScopeObjectDetail.action;jsessionid=F05001FBEDB4246DD99D7D5C531E28A0?objectDetailId=10571';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.taustakartta.taustakarttapvm IS 'INSPIRE';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.taustakartta.taustakartta_referenssi IS 'INSPIRE';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.taustakartta.rajapinta_uri IS 'Myös INSPIRE';
-- ddl-end --
ALTER TABLE yk_yleiskaava.taustakartta OWNER TO postgres;
-- ddl-end --

-- object: yk_kuvaustekniikka.teema | type: TABLE --
-- DROP TABLE IF EXISTS yk_kuvaustekniikka.teema CASCADE;
CREATE TABLE yk_kuvaustekniikka.teema(
	id uuid NOT NULL,
	nimi varchar,
	kuvaus varchar,
	sld_url varchar,
	id_yleiskaava uuid,
	CONSTRAINT teema_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_kuvaustekniikka.teema OWNER TO postgres;
-- ddl-end --

-- object: yk_prosessi.dokumentti_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_prosessi.dokumentti_tyyppi CASCADE;
CREATE TYPE yk_prosessi.dokumentti_tyyppi AS
 ENUM ('kaupunkiseudun_rakennesuunnitelma','ohjelma','oas','vat_tavoite','tiedotus','oas_palaute','kaavaluonnos_mielipide','kaavaehdotus_muistutus','kaavaehdotus_lausunto','kaavaehdotus_viranomaisneuvottelu','paatos','valitus_ho','valitus_kho','suunnitelma','selvitys','inventointi','visio','vaikutusarvio');
-- ddl-end --
ALTER TYPE yk_prosessi.dokumentti_tyyppi OWNER TO postgres;
-- ddl-end --

-- object: yk_prosessi.linkitys_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_prosessi.linkitys_tyyppi CASCADE;
CREATE TYPE yk_prosessi.linkitys_tyyppi AS
 ENUM ('tre_selma','tre_donna','tre_facta','tre_vasara','tre_iris','tre_siiri','mml','mil','maakuntien_liitto','tukes','museovirasto','syke','like','luke');
-- ddl-end --
ALTER TYPE yk_prosessi.linkitys_tyyppi OWNER TO postgres;
-- ddl-end --
COMMENT ON TYPE yk_prosessi.linkitys_tyyppi IS 'naita voi lisätä lisää tarvittaessa';
-- ddl-end --

-- object: yk_prosessi.lahtoaineisto | type: TABLE --
-- DROP TABLE IF EXISTS yk_prosessi.lahtoaineisto CASCADE;
CREATE TABLE yk_prosessi.lahtoaineisto(
	id uuid NOT NULL,
	nimi varchar,
	lahde varchar,
	kuvaus varchar,
	linkitys_tyyppi yk_prosessi.linkitys_tyyppi,
	linkki_data varchar,
	CONSTRAINT lahtoaineisto_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN yk_prosessi.lahtoaineisto.lahde IS 'lahde sisältää ihmisen ymmärämän lähde-tiedon ja linkitys_tyyppi ohjelmistolle tarkoitetun vastaavan';
-- ddl-end --
COMMENT ON COLUMN yk_prosessi.lahtoaineisto.linkitys_tyyppi IS 'lahde sisältää ihmisen ymmärämän lähde-tiedon ja linkitys_tyyppi ohjelmistolle tarkoitetun vastaavan';
-- ddl-end --
ALTER TABLE yk_prosessi.lahtoaineisto OWNER TO postgres;
-- ddl-end --

-- object: yk_prosessi.dokumentti | type: TABLE --
-- DROP TABLE IF EXISTS yk_prosessi.dokumentti CASCADE;
CREATE TABLE yk_prosessi.dokumentti(
	id uuid NOT NULL,
	nimi varchar,
	tyyppi yk_prosessi.dokumentti_tyyppi,
	kuvaus varchar,
	inspire_paatos boolean,
	inspire_paatospvm date,
	inspire_paatos_referenssi varchar,
	linkitys_tyyppi yk_prosessi.linkitys_tyyppi,
	linkki_data varchar,
	CONSTRAINT dokumentti_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_prosessi.dokumentti OWNER TO postgres;
-- ddl-end --

-- object: yk_prosessi.dokumentti_yleiskaava_yhteys | type: TABLE --
-- DROP TABLE IF EXISTS yk_prosessi.dokumentti_yleiskaava_yhteys CASCADE;
CREATE TABLE yk_prosessi.dokumentti_yleiskaava_yhteys(
	id uuid NOT NULL,
	id_dokumentti uuid,
	id_yleiskaava uuid,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	CONSTRAINT dokumentti_yleiskaava_linkki_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_prosessi.dokumentti_yleiskaava_yhteys OWNER TO postgres;
-- ddl-end --

-- object: yk_prosessi.lahtoaineisto_yleiskaava_yhteys | type: TABLE --
-- DROP TABLE IF EXISTS yk_prosessi.lahtoaineisto_yleiskaava_yhteys CASCADE;
CREATE TABLE yk_prosessi.lahtoaineisto_yleiskaava_yhteys(
	id uuid NOT NULL,
	id_lahtoaineisto uuid,
	id_yleiskaava uuid,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	CONSTRAINT dokumentti_yleiskaava_linkki_pk_1 PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_yhteys OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.kansallinen_taydentava_kaavamerkinta_luokka | type: TABLE --
-- DROP TABLE IF EXISTS yk_koodiluettelot.kansallinen_taydentava_kaavamerkinta_luokka CASCADE;
CREATE TABLE yk_koodiluettelot.kansallinen_taydentava_kaavamerkinta_luokka(
	id uuid NOT NULL,
	koodi yk_koodiluettelot.kansallinen_muu_kaavakohde_tyyppi,
	laajempi_koodiarvo varchar,
	CONSTRAINT maankaytto_tyyppi_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN yk_koodiluettelot.kansallinen_taydentava_kaavamerkinta_luokka.koodi IS 'esim. AP, TY-1';
-- ddl-end --
ALTER TABLE yk_koodiluettelot.kansallinen_taydentava_kaavamerkinta_luokka OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.kaavakohde_luokka | type: TABLE --
-- DROP TABLE IF EXISTS yk_koodiluettelot.kaavakohde_luokka CASCADE;
CREATE TABLE yk_koodiluettelot.kaavakohde_luokka(
	id uuid NOT NULL,
	koodi yk_koodiluettelot.aluevaraus_tyyppi,
	laajempi_koodiarvo varchar,
	CONSTRAINT "HSRCL_pk_2" PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_koodiluettelot.kaavakohde_luokka IS 'http://inspire.ec.europa.eu/codelist/SupplementaryRegulationValue';
-- ddl-end --
ALTER TABLE yk_koodiluettelot.kaavakohde_luokka OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.taydentava_kaavamerkinta_luokka | type: TABLE --
-- DROP TABLE IF EXISTS yk_koodiluettelot.taydentava_kaavamerkinta_luokka CASCADE;
CREATE TABLE yk_koodiluettelot.taydentava_kaavamerkinta_luokka(
	id uuid NOT NULL,
	koodi yk_koodiluettelot.muu_kaavakohde_tyyppi,
	laajempi_koodiarvo varchar,
	CONSTRAINT "HSRCL_pk_1" PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_koodiluettelot.taydentava_kaavamerkinta_luokka IS 'http://inspire.ec.europa.eu/codelist/SupplementaryRegulationValue';
-- ddl-end --
ALTER TABLE yk_koodiluettelot.taydentava_kaavamerkinta_luokka OWNER TO postgres;
-- ddl-end --

-- object: yk_metatiedot.metatietokortti | type: TABLE --
-- DROP TABLE IF EXISTS yk_metatiedot.metatietokortti CASCADE;
CREATE TABLE yk_metatiedot.metatietokortti(
	id uuid NOT NULL,
	metatiedon_tunnistamistiedot varchar,
	resurssin_tunnistamistiedot varchar,
	tietosisalto varchar,
	sovellusskeeman_tiedot varchar,
	sijaintitiedon_esitystapatiedot varchar,
	vertausjarjestelman_tiedot varchar,
	laatutiedot varchar,
	esitystapaluettelon_tiedot varchar,
	rajoitustiedot varchar,
	jakelutiedot varchar,
	yllapitotiedot varchar,
	kattavuustiedot varchar,
	viitetiedot_ja_vastuullinen_osapuoli varchar,
	id_yleiskaava uuid,
	CONSTRAINT metatietokortti_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_metatiedot.metatietokortti IS 'http://www.jhs-suositukset.fi/suomi/jhs158 - Paikkatietoaineistojen ja -palveluiden metatiedot';
-- ddl-end --
ALTER TABLE yk_metatiedot.metatietokortti OWNER TO postgres;
-- ddl-end --

-- object: yk_yleiskaava.diaari_numerot | type: TABLE --
-- DROP TABLE IF EXISTS yk_yleiskaava.diaari_numerot CASCADE;
CREATE TABLE yk_yleiskaava.diaari_numerot(
	id uuid NOT NULL,
	nro varchar,
	pvm date,
	id_yleiskaava uuid,
	CONSTRAINT diaari_numerot_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_yleiskaava.diaari_numerot OWNER TO postgres;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.diaari_numerot DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_yleiskaava.diaari_numerot ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_metatiedot.metatietokortti DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_metatiedot.metatietokortti ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: metatietokortti_uq | type: CONSTRAINT --
-- ALTER TABLE yk_metatiedot.metatietokortti DROP CONSTRAINT IF EXISTS metatietokortti_uq CASCADE;
ALTER TABLE yk_metatiedot.metatietokortti ADD CONSTRAINT metatietokortti_uq UNIQUE (id_yleiskaava);
-- ddl-end --

-- object: yk_koodiluettelot.virkistys_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.virkistys_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.virkistys_tyyppi AS
 ENUM ('kaupunkipuisto','lahivirkistys','maisema_luonnonhoito_alue','urheilu_virkistyspalvelu_alue','muu');
-- ddl-end --
ALTER TYPE yk_koodiluettelot.virkistys_tyyppi OWNER TO postgres;
-- ddl-end --

-- object: kaavaobjekti_alue_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_yhteys DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_fk CASCADE;
ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_yhteys ADD CONSTRAINT kaavaobjekti_alue_fk FOREIGN KEY (id_kaavaobjekti_alue)
REFERENCES yk_yleiskaava.kaavaobjekti_alue (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_yhteys DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_yhteys ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.dokumentti_yleiskaava_yhteys DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_prosessi.dokumentti_yleiskaava_yhteys ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavan_taso_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.yleiskaava DROP CONSTRAINT IF EXISTS kaavan_taso_fk CASCADE;
ALTER TABLE yk_yleiskaava.yleiskaava ADD CONSTRAINT kaavan_taso_fk FOREIGN KEY (id_kaavan_taso)
REFERENCES yk_koodiluettelot.kaavan_taso (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kansallinen_prosessin_vaihe_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.yleiskaava DROP CONSTRAINT IF EXISTS kansallinen_prosessin_vaihe_fk CASCADE;
ALTER TABLE yk_yleiskaava.yleiskaava ADD CONSTRAINT kansallinen_prosessin_vaihe_fk FOREIGN KEY (id_kansallinen_prosessin_vaihe)
REFERENCES yk_koodiluettelot.kansallinen_prosessin_vaihe (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kansallinen_kaavatyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.yleiskaava DROP CONSTRAINT IF EXISTS kansallinen_kaavatyyppi_fk CASCADE;
ALTER TABLE yk_yleiskaava.yleiskaava ADD CONSTRAINT kansallinen_kaavatyyppi_fk FOREIGN KEY (id_kansallinen_kaavatyyppi)
REFERENCES yk_koodiluettelot.kansallinen_kaavatyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kansallinen_prosessin_vaihe_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_alue DROP CONSTRAINT IF EXISTS kansallinen_prosessin_vaihe_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_alue ADD CONSTRAINT kansallinen_prosessin_vaihe_fk FOREIGN KEY (id_kansallinen_prosessin_vaihe)
REFERENCES yk_koodiluettelot.kansallinen_prosessin_vaihe (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.mittakaava DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.mittakaava ADD CONSTRAINT kaavaobjekti_alue_fk FOREIGN KEY (id_kaavaobjekti_alue)
REFERENCES yk_yleiskaava.kaavaobjekti_alue (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.mittakaava DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.mittakaava ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_prosessi.liikennejarjestelmasuunnnitelma | type: TABLE --
-- DROP TABLE IF EXISTS yk_prosessi.liikennejarjestelmasuunnnitelma CASCADE;
CREATE TABLE yk_prosessi.liikennejarjestelmasuunnnitelma(
	id uuid NOT NULL,
	nimi varchar,
	nro varchar NOT NULL,
	id_yleiskaava uuid,
	linkki_data varchar,
	linkitys_tyyppi yk_prosessi.linkitys_tyyppi,
	CONSTRAINT liikenne_jarjestelma_suunnnitelma_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_prosessi.liikennejarjestelmasuunnnitelma OWNER TO postgres;
-- ddl-end --

-- object: yk_prosessi.liittyva_kaava | type: TABLE --
-- DROP TABLE IF EXISTS yk_prosessi.liittyva_kaava CASCADE;
CREATE TABLE yk_prosessi.liittyva_kaava(
	id uuid NOT NULL,
	nimi varchar,
	nro varchar NOT NULL,
	id_yleiskaava uuid,
	id_kaavan_taso uuid,
	id_kansallinen_kaavatyyppi uuid,
	linkki_data varchar,
	linkitys_tyyppi yk_prosessi.linkitys_tyyppi,
	CONSTRAINT kaava_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_prosessi.liittyva_kaava OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.kaava_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.kaava_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.kaava_tyyppi AS
 ENUM ('maakuntakaava','yleiskaava','asemakaava','osayleiskaava','rantayleiskaava','muu');
-- ddl-end --
ALTER TYPE yk_koodiluettelot.kaava_tyyppi OWNER TO postgres;
-- ddl-end --

-- object: kaavan_taso_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.liittyva_kaava DROP CONSTRAINT IF EXISTS kaavan_taso_fk CASCADE;
ALTER TABLE yk_prosessi.liittyva_kaava ADD CONSTRAINT kaavan_taso_fk FOREIGN KEY (id_kaavan_taso)
REFERENCES yk_koodiluettelot.kaavan_taso (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_suunnitteluparametrit.suhde_maan_tasoon | type: TABLE --
-- DROP TABLE IF EXISTS yk_suunnitteluparametrit.suhde_maan_tasoon CASCADE;
CREATE TABLE yk_suunnitteluparametrit.suhde_maan_tasoon(
	id uuid,
	taso smallint,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid
);
-- ddl-end --
COMMENT ON COLUMN yk_suunnitteluparametrit.suhde_maan_tasoon.taso IS 'maan alla < 0, maantasolla = 0, maan päällä > 0, ei määritelty = null';
-- ddl-end --
ALTER TABLE yk_suunnitteluparametrit.suhde_maan_tasoon OWNER TO postgres;
-- ddl-end --

-- object: kaavaobjekti_alue_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.suhde_maan_tasoon DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.suhde_maan_tasoon ADD CONSTRAINT kaavaobjekti_alue_fk FOREIGN KEY (id_kaavaobjekti_alue)
REFERENCES yk_yleiskaava.kaavaobjekti_alue (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: suhde_maan_tasoon_uq | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.suhde_maan_tasoon DROP CONSTRAINT IF EXISTS suhde_maan_tasoon_uq CASCADE;
ALTER TABLE yk_suunnitteluparametrit.suhde_maan_tasoon ADD CONSTRAINT suhde_maan_tasoon_uq UNIQUE (id_kaavaobjekti_alue);
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.liikennejarjestelmasuunnnitelma DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_prosessi.liikennejarjestelmasuunnnitelma ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: lahtoaineisto_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_yhteys DROP CONSTRAINT IF EXISTS lahtoaineisto_fk CASCADE;
ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_yhteys ADD CONSTRAINT lahtoaineisto_fk FOREIGN KEY (id_lahtoaineisto)
REFERENCES yk_prosessi.lahtoaineisto (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: dokumentti_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.dokumentti_yleiskaava_yhteys DROP CONSTRAINT IF EXISTS dokumentti_fk CASCADE;
ALTER TABLE yk_prosessi.dokumentti_yleiskaava_yhteys ADD CONSTRAINT dokumentti_fk FOREIGN KEY (id_dokumentti)
REFERENCES yk_prosessi.dokumentti (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_koodiluettelot.laillinen_sitovuus_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.laillinen_sitovuus_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.laillinen_sitovuus_tyyppi AS
 ENUM ('ei_sitova','maaritelty_lainsaadannossa','sitova_ainoastaan_viranomaisille','sitova_kehittajille','yleisesti_sitova');
-- ddl-end --
ALTER TYPE yk_koodiluettelot.laillinen_sitovuus_tyyppi OWNER TO postgres;
-- ddl-end --
COMMENT ON TYPE yk_koodiluettelot.laillinen_sitovuus_tyyppi IS 'http://inspire.ec.europa.eu/codelist/RegulationNatureValue';
-- ddl-end --

-- object: yk_koodiluettelot.laillinen_sitovuus | type: TABLE --
-- DROP TABLE IF EXISTS yk_koodiluettelot.laillinen_sitovuus CASCADE;
CREATE TABLE yk_koodiluettelot.laillinen_sitovuus(
	id uuid NOT NULL,
	koodi yk_koodiluettelot.laillinen_sitovuus_tyyppi,
	kuvaus varchar,
	CONSTRAINT laillinen_sitovuus_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_koodiluettelot.laillinen_sitovuus IS 'Kaavamääräysten laillinen sitovuus. http://inspire.ec.europa.eu/codelist/RegulationNatureValue';
-- ddl-end --
ALTER TABLE yk_koodiluettelot.laillinen_sitovuus OWNER TO postgres;
-- ddl-end --

-- object: kansallinen_kaavatyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.liittyva_kaava DROP CONSTRAINT IF EXISTS kansallinen_kaavatyyppi_fk CASCADE;
ALTER TABLE yk_prosessi.liittyva_kaava ADD CONSTRAINT kansallinen_kaavatyyppi_fk FOREIGN KEY (id_kansallinen_kaavatyyppi)
REFERENCES yk_koodiluettelot.kansallinen_kaavatyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_koodiluettelot.prosessin_vaihe_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.prosessin_vaihe_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.prosessin_vaihe_tyyppi AS
 ENUM ('ehdotus','kumottu','laillisesti_sitova_tai_voimassa','luonnos');
-- ddl-end --
ALTER TYPE yk_koodiluettelot.prosessin_vaihe_tyyppi OWNER TO postgres;
-- ddl-end --
COMMENT ON TYPE yk_koodiluettelot.prosessin_vaihe_tyyppi IS 'Kaavaprosessin yleispiirteinen vaihe, jossa kaava on. http://inspire.ec.europa.eu/codelist/ProcessStepGeneralValue';
-- ddl-end --

-- object: yk_koodiluettelot.prosessin_vaihe | type: TABLE --
-- DROP TABLE IF EXISTS yk_koodiluettelot.prosessin_vaihe CASCADE;
CREATE TABLE yk_koodiluettelot.prosessin_vaihe(
	id uuid NOT NULL,
	koodi yk_koodiluettelot.prosessin_vaihe_tyyppi,
	kuvaus varchar,
	CONSTRAINT prosessin_vaihe_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_koodiluettelot.prosessin_vaihe IS 'Kaavaprosessin yleispiirteinen vaihe, jossa kaava on. http://inspire.ec.europa.eu/codelist/ProcessStepGeneralValue';
-- ddl-end --
ALTER TABLE yk_koodiluettelot.prosessin_vaihe OWNER TO postgres;
-- ddl-end --

-- object: laillinen_sitovuus_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_alue DROP CONSTRAINT IF EXISTS laillinen_sitovuus_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_alue ADD CONSTRAINT laillinen_sitovuus_fk FOREIGN KEY (id_laillinen_sitovuus)
REFERENCES yk_koodiluettelot.laillinen_sitovuus (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: prosessin_vaihe_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_alue DROP CONSTRAINT IF EXISTS prosessin_vaihe_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_alue ADD CONSTRAINT prosessin_vaihe_fk FOREIGN KEY (id_prosessin_vaihe)
REFERENCES yk_koodiluettelot.prosessin_vaihe (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: prosessin_vaihe_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.yleiskaava DROP CONSTRAINT IF EXISTS prosessin_vaihe_fk CASCADE;
ALTER TABLE yk_yleiskaava.yleiskaava ADD CONSTRAINT prosessin_vaihe_fk FOREIGN KEY (id_prosessin_vaihe)
REFERENCES yk_koodiluettelot.prosessin_vaihe (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_yleiskaava.kaavamaarays | type: TABLE --
-- DROP TABLE IF EXISTS yk_yleiskaava.kaavamaarays CASCADE;
CREATE TABLE yk_yleiskaava.kaavamaarays(
	id uuid NOT NULL,
	nimi varchar,
	lyhenne varchar,
	maaraysteksti varchar,
	kuvaus varchar,
	diaari_nro varchar,
	voimaantulopvm date,
	kumoamispvm date,
	taso varchar,
	viite varchar,
	paivays date,
	linkki varchar,
	spesifinen_referenssi varchar,
	kaavamaarays_url varchar,
	huomio varchar,
	CONSTRAINT virallinen_dokumentaatio_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_yleiskaava.kaavamaarays IS 'http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/SearchObjectSelection.action?search=Official+Documentation';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavamaarays.id IS 'http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/SearchObjectSelection.action?search=Official+Documentation';
-- ddl-end --
ALTER TABLE yk_yleiskaava.kaavamaarays OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.kansallinen_aluevaraus_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.kansallinen_aluevaraus_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.kansallinen_aluevaraus_tyyppi AS
 ENUM ();
-- ddl-end --
ALTER TYPE yk_koodiluettelot.kansallinen_aluevaraus_tyyppi OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.kansallinen_kaavakohde_luokka | type: TABLE --
-- DROP TABLE IF EXISTS yk_koodiluettelot.kansallinen_kaavakohde_luokka CASCADE;
CREATE TABLE yk_koodiluettelot.kansallinen_kaavakohde_luokka(
	id uuid NOT NULL,
	koodi yk_koodiluettelot.kansallinen_aluevaraus_tyyppi,
	laajempi_koodiarvo varchar,
	CONSTRAINT kansallinen_kaavakohde_luokka_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_koodiluettelot.kansallinen_kaavakohde_luokka IS 'YM tekemässä näitä, mutta ei vielä saatavilla';
-- ddl-end --
ALTER TABLE yk_koodiluettelot.kansallinen_kaavakohde_luokka OWNER TO postgres;
-- ddl-end --

-- object: yk_inspire.kaavakohde | type: TABLE --
-- DROP TABLE IF EXISTS yk_inspire.kaavakohde CASCADE;
CREATE TABLE yk_inspire.kaavakohde(
	id uuid NOT NULL,
	id_kaavaobjekti_alue uuid,
	id_kaavakohde_luokka uuid,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	CONSTRAINT kaavakohde_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_inspire.kaavakohde OWNER TO postgres;
-- ddl-end --

-- object: yk_inspire.kansallinen_kaavakohde | type: TABLE --
-- DROP TABLE IF EXISTS yk_inspire.kansallinen_kaavakohde CASCADE;
CREATE TABLE yk_inspire.kansallinen_kaavakohde(
	id uuid NOT NULL,
	id_kaavaobjekti_alue uuid,
	id_kansallinen_kaavakohde_luokka uuid,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	CONSTRAINT kansallinen_kaavakohde_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_inspire.kansallinen_kaavakohde OWNER TO postgres;
-- ddl-end --

-- object: yk_inspire.kansallinen_taydentava_kaavamerkinta | type: TABLE --
-- DROP TABLE IF EXISTS yk_inspire.kansallinen_taydentava_kaavamerkinta CASCADE;
CREATE TABLE yk_inspire.kansallinen_taydentava_kaavamerkinta(
	id uuid NOT NULL,
	id_kaavaobjekti_alue uuid,
	id_kansallinen_taydentava_kaavamerkinta_luokka uuid,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	CONSTRAINT kaavakohde_pk_2 PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_inspire.kansallinen_taydentava_kaavamerkinta OWNER TO postgres;
-- ddl-end --

-- object: kansallinen_taydentava_kaavamerkinta_luokka_fk | type: CONSTRAINT --
-- ALTER TABLE yk_inspire.kansallinen_taydentava_kaavamerkinta DROP CONSTRAINT IF EXISTS kansallinen_taydentava_kaavamerkinta_luokka_fk CASCADE;
ALTER TABLE yk_inspire.kansallinen_taydentava_kaavamerkinta ADD CONSTRAINT kansallinen_taydentava_kaavamerkinta_luokka_fk FOREIGN KEY (id_kansallinen_taydentava_kaavamerkinta_luokka)
REFERENCES yk_koodiluettelot.kansallinen_taydentava_kaavamerkinta_luokka (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_fk | type: CONSTRAINT --
-- ALTER TABLE yk_inspire.kansallinen_taydentava_kaavamerkinta DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_fk CASCADE;
ALTER TABLE yk_inspire.kansallinen_taydentava_kaavamerkinta ADD CONSTRAINT kaavaobjekti_alue_fk FOREIGN KEY (id_kaavaobjekti_alue)
REFERENCES yk_yleiskaava.kaavaobjekti_alue (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_inspire.taydentava_kaavamerkinta | type: TABLE --
-- DROP TABLE IF EXISTS yk_inspire.taydentava_kaavamerkinta CASCADE;
CREATE TABLE yk_inspire.taydentava_kaavamerkinta(
	id uuid NOT NULL,
	id_kaavaobjekti_alue uuid,
	id_taydentava_kaavamerkinta_luokka uuid,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	CONSTRAINT kaavakohde_pk_1 PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_inspire.taydentava_kaavamerkinta OWNER TO postgres;
-- ddl-end --

-- object: taydentava_kaavamerkinta_luokka_fk | type: CONSTRAINT --
-- ALTER TABLE yk_inspire.taydentava_kaavamerkinta DROP CONSTRAINT IF EXISTS taydentava_kaavamerkinta_luokka_fk CASCADE;
ALTER TABLE yk_inspire.taydentava_kaavamerkinta ADD CONSTRAINT taydentava_kaavamerkinta_luokka_fk FOREIGN KEY (id_taydentava_kaavamerkinta_luokka)
REFERENCES yk_koodiluettelot.taydentava_kaavamerkinta_luokka (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_fk | type: CONSTRAINT --
-- ALTER TABLE yk_inspire.taydentava_kaavamerkinta DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_fk CASCADE;
ALTER TABLE yk_inspire.taydentava_kaavamerkinta ADD CONSTRAINT kaavaobjekti_alue_fk FOREIGN KEY (id_kaavaobjekti_alue)
REFERENCES yk_yleiskaava.kaavaobjekti_alue (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_mitoitus_varanto.mitoitus | type: TABLE --
-- DROP TABLE IF EXISTS yk_mitoitus_varanto.mitoitus CASCADE;
CREATE TABLE yk_mitoitus_varanto.mitoitus(
	id uuid NOT NULL,
	mitoitus_referenssi varchar,
	pinta_ala real,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	id_varanto_arvio uuid,
	id_varanto_toteutunut uuid,
	id_vaestorakenne_arvio uuid,
	id_vaestorakenne_toteutunut uuid,
	id_asuntovaranto_kaytto_arvio uuid,
	id_asuntovaranto_kaytto_toteutunut uuid,
	CONSTRAINT mitoitus_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_mitoitus_varanto.mitoitus IS 'http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/ScopeObjectDetail.action;jsessionid=F05001FBEDB4246DD99D7D5C531E28A0?objectDetailId=10573';
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.mitoitus.mitoitus_referenssi IS 'INSPIRE';
-- ddl-end --
ALTER TABLE yk_mitoitus_varanto.mitoitus OWNER TO postgres;
-- ddl-end --

-- object: kaavaobjekti_alue_fk | type: CONSTRAINT --
-- ALTER TABLE yk_mitoitus_varanto.mitoitus DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_fk CASCADE;
ALTER TABLE yk_mitoitus_varanto.mitoitus ADD CONSTRAINT kaavaobjekti_alue_fk FOREIGN KEY (id_kaavaobjekti_alue)
REFERENCES yk_yleiskaava.kaavaobjekti_alue (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_inspire.kaavakohteen_olemassaolo | type: TABLE --
-- DROP TABLE IF EXISTS yk_inspire.kaavakohteen_olemassaolo CASCADE;
CREATE TABLE yk_inspire.kaavakohteen_olemassaolo(
	id uuid NOT NULL,
	jarjestetty_lista smallint[],
	prosentti_lista real[],
	CONSTRAINT kaavakohteen_olemassaolo_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_inspire.kaavakohteen_olemassaolo IS 'HILUCS Presence - http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/ScopeObjectDetail.action?objectDetailId=10556';
-- ddl-end --
ALTER TABLE yk_inspire.kaavakohteen_olemassaolo OWNER TO postgres;
-- ddl-end --

-- object: yk_inspire.kansallisen_kaavakohteen_olemassaolo | type: TABLE --
-- DROP TABLE IF EXISTS yk_inspire.kansallisen_kaavakohteen_olemassaolo CASCADE;
CREATE TABLE yk_inspire.kansallisen_kaavakohteen_olemassaolo(
	id uuid NOT NULL,
	jarjestetty_lista smallint[],
	prosentti_lista real[],
	CONSTRAINT kansallisen_kaavakohteen_olemassaolo_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_inspire.kansallisen_kaavakohteen_olemassaolo IS 'HILUCS Presence - http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/ScopeObjectDetail.action?objectDetailId=10556';
-- ddl-end --
ALTER TABLE yk_inspire.kansallisen_kaavakohteen_olemassaolo OWNER TO postgres;
-- ddl-end --

-- object: kaavakohteen_olemassaolo_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_alue DROP CONSTRAINT IF EXISTS kaavakohteen_olemassaolo_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_alue ADD CONSTRAINT kaavakohteen_olemassaolo_fk FOREIGN KEY (id_kaavakohteen_olemassaolo)
REFERENCES yk_inspire.kaavakohteen_olemassaolo (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_fk | type: CONSTRAINT --
-- ALTER TABLE yk_inspire.kansallinen_kaavakohde DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_fk CASCADE;
ALTER TABLE yk_inspire.kansallinen_kaavakohde ADD CONSTRAINT kaavaobjekti_alue_fk FOREIGN KEY (id_kaavaobjekti_alue)
REFERENCES yk_yleiskaava.kaavaobjekti_alue (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_fk | type: CONSTRAINT --
-- ALTER TABLE yk_inspire.kaavakohde DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_fk CASCADE;
ALTER TABLE yk_inspire.kaavakohde ADD CONSTRAINT kaavaobjekti_alue_fk FOREIGN KEY (id_kaavaobjekti_alue)
REFERENCES yk_yleiskaava.kaavaobjekti_alue (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kansallinen_kaavakohde_luokka_fk | type: CONSTRAINT --
-- ALTER TABLE yk_inspire.kansallinen_kaavakohde DROP CONSTRAINT IF EXISTS kansallinen_kaavakohde_luokka_fk CASCADE;
ALTER TABLE yk_inspire.kansallinen_kaavakohde ADD CONSTRAINT kansallinen_kaavakohde_luokka_fk FOREIGN KEY (id_kansallinen_kaavakohde_luokka)
REFERENCES yk_koodiluettelot.kansallinen_kaavakohde_luokka (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavakohde_luokka_fk | type: CONSTRAINT --
-- ALTER TABLE yk_inspire.kaavakohde DROP CONSTRAINT IF EXISTS kaavakohde_luokka_fk CASCADE;
ALTER TABLE yk_inspire.kaavakohde ADD CONSTRAINT kaavakohde_luokka_fk FOREIGN KEY (id_kaavakohde_luokka)
REFERENCES yk_koodiluettelot.kaavakohde_luokka (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kansallisen_kaavakohteen_olemassaolo_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_alue DROP CONSTRAINT IF EXISTS kansallisen_kaavakohteen_olemassaolo_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_alue ADD CONSTRAINT kansallisen_kaavakohteen_olemassaolo_fk FOREIGN KEY (id_kansallisen_kaavakohteen_olemassaolo)
REFERENCES yk_inspire.kansallisen_kaavakohteen_olemassaolo (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys | type: TABLE --
-- DROP TABLE IF EXISTS yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys CASCADE;
CREATE TABLE yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys(
	id uuid NOT NULL,
	id_kaavamaarays uuid,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	CONSTRAINT kaavaobjekti_kaavamaarays_linkki_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys IS 'kaavaobjektilla voi olla useita kaavamääräyksiä ja kaavamääräys voi liittyä useaan kaavaobjektiin';
-- ddl-end --
ALTER TABLE yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys OWNER TO postgres;
-- ddl-end --

-- object: kaavaobjekti_alue_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.sidottu_kaavaobjekti DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.sidottu_kaavaobjekti ADD CONSTRAINT kaavaobjekti_alue_fk FOREIGN KEY (id_kaavaobjekti_alue)
REFERENCES yk_yleiskaava.kaavaobjekti_alue (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.sitova_kaavaobjekti DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.sitova_kaavaobjekti ADD CONSTRAINT kaavaobjekti_alue_fk FOREIGN KEY (id_kaavaobjekti_alue)
REFERENCES yk_yleiskaava.kaavaobjekti_alue (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys ADD CONSTRAINT kaavaobjekti_alue_fk FOREIGN KEY (id_kaavaobjekti_alue)
REFERENCES yk_yleiskaava.kaavaobjekti_alue (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavamaarays_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys DROP CONSTRAINT IF EXISTS kaavamaarays_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys ADD CONSTRAINT kaavamaarays_fk FOREIGN KEY (id_kaavamaarays)
REFERENCES yk_yleiskaava.kaavamaarays (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_kuvaustekniikka.apugeometria_piste | type: TABLE --
-- DROP TABLE IF EXISTS yk_kuvaustekniikka.apugeometria_piste CASCADE;
CREATE TABLE yk_kuvaustekniikka.apugeometria_piste(
	id uuid NOT NULL,
	geom geometry(POINTZ, 3878),
	nimi varchar,
	selitys varchar,
	id_teema uuid,
	rotaatio real,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	CONSTRAINT apugeometria_piste_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_kuvaustekniikka.apugeometria_piste OWNER TO postgres;
-- ddl-end --

-- object: yk_kuvaustekniikka.apugeometria_viiva | type: TABLE --
-- DROP TABLE IF EXISTS yk_kuvaustekniikka.apugeometria_viiva CASCADE;
CREATE TABLE yk_kuvaustekniikka.apugeometria_viiva(
	id uuid NOT NULL,
	geom geometry(LINESTRINGZ, 3878),
	nimi varchar,
	selitys varchar,
	id_teema uuid,
	rotaatio real,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	CONSTRAINT apugeometria_viiva_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_kuvaustekniikka.apugeometria_viiva OWNER TO postgres;
-- ddl-end --

-- object: yk_kuvaustekniikka.apugeometria_alue | type: TABLE --
-- DROP TABLE IF EXISTS yk_kuvaustekniikka.apugeometria_alue CASCADE;
CREATE TABLE yk_kuvaustekniikka.apugeometria_alue(
	id uuid NOT NULL,
	geom geometry(POLYGONZ, 3878),
	nimi varchar,
	selitys varchar,
	id_teema uuid,
	rotaatio real,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	CONSTRAINT apugeometria_alue_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_kuvaustekniikka.apugeometria_alue OWNER TO postgres;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavadokumentti DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavadokumentti ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_yleiskaava.yleismaarays | type: TABLE --
-- DROP TABLE IF EXISTS yk_yleiskaava.yleismaarays CASCADE;
CREATE TABLE yk_yleiskaava.yleismaarays(
	id uuid NOT NULL,
	nimi varchar,
	lyhenne varchar,
	maaraysteksti varchar,
	kuvaus varchar,
	diaari_nro varchar,
	voimaantulopvm date,
	kumoamispvm date,
	taso varchar,
	viite varchar,
	paivays date,
	linkki varchar,
	spesifinen_referenssi varchar,
	kaavamaarays_url varchar,
	huomio varchar,
	id_yleiskaava uuid,
	CONSTRAINT virallinen_dokumentaatio_pk_1 PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_yleiskaava.yleismaarays IS 'http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/SearchObjectSelection.action?search=Official+Documentation';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.yleismaarays.id IS 'http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/SearchObjectSelection.action?search=Official+Documentation';
-- ddl-end --
ALTER TABLE yk_yleiskaava.yleismaarays OWNER TO postgres;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.yleismaarays DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_yleiskaava.yleismaarays ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kuvaustekniikka.teema DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_kuvaustekniikka.teema ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: teema_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kuvaustekniikka.apugeometria_piste DROP CONSTRAINT IF EXISTS teema_fk CASCADE;
ALTER TABLE yk_kuvaustekniikka.apugeometria_piste ADD CONSTRAINT teema_fk FOREIGN KEY (id_teema)
REFERENCES yk_kuvaustekniikka.teema (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: teema_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kuvaustekniikka.apugeometria_viiva DROP CONSTRAINT IF EXISTS teema_fk CASCADE;
ALTER TABLE yk_kuvaustekniikka.apugeometria_viiva ADD CONSTRAINT teema_fk FOREIGN KEY (id_teema)
REFERENCES yk_kuvaustekniikka.teema (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: teema_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kuvaustekniikka.apugeometria_alue DROP CONSTRAINT IF EXISTS teema_fk CASCADE;
ALTER TABLE yk_kuvaustekniikka.apugeometria_alue ADD CONSTRAINT teema_fk FOREIGN KEY (id_teema)
REFERENCES yk_kuvaustekniikka.teema (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_kuvaustekniikka.kaavaobjekti_teema_yhteys | type: TABLE --
-- DROP TABLE IF EXISTS yk_kuvaustekniikka.kaavaobjekti_teema_yhteys CASCADE;
CREATE TABLE yk_kuvaustekniikka.kaavaobjekti_teema_yhteys(
	id uuid NOT NULL,
	id_teema uuid,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	CONSTRAINT kaavaobjekti_teema_yhteys_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_kuvaustekniikka.kaavaobjekti_teema_yhteys OWNER TO postgres;
-- ddl-end --

-- object: kaavaobjekti_alue_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kuvaustekniikka.kaavaobjekti_teema_yhteys DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_fk CASCADE;
ALTER TABLE yk_kuvaustekniikka.kaavaobjekti_teema_yhteys ADD CONSTRAINT kaavaobjekti_alue_fk FOREIGN KEY (id_kaavaobjekti_alue)
REFERENCES yk_yleiskaava.kaavaobjekti_alue (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: teema_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kuvaustekniikka.kaavaobjekti_teema_yhteys DROP CONSTRAINT IF EXISTS teema_fk CASCADE;
ALTER TABLE yk_kuvaustekniikka.kaavaobjekti_teema_yhteys ADD CONSTRAINT teema_fk FOREIGN KEY (id_teema)
REFERENCES yk_kuvaustekniikka.teema (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.taustakartta DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_yleiskaava.taustakartta ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.liittyva_kaava DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_prosessi.liittyva_kaava ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.dokumentti_yleiskaava_yhteys DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_fk CASCADE;
ALTER TABLE yk_prosessi.dokumentti_yleiskaava_yhteys ADD CONSTRAINT kaavaobjekti_alue_fk FOREIGN KEY (id_kaavaobjekti_alue)
REFERENCES yk_yleiskaava.kaavaobjekti_alue (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_kuvaustekniikka.yleismaarays_teema_yhteys | type: TABLE --
-- DROP TABLE IF EXISTS yk_kuvaustekniikka.yleismaarays_teema_yhteys CASCADE;
CREATE TABLE yk_kuvaustekniikka.yleismaarays_teema_yhteys(
	id uuid NOT NULL,
	id_yleismaarays uuid,
	id_teema uuid,
	CONSTRAINT yleismaarays_teema_yhteys_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_kuvaustekniikka.yleismaarays_teema_yhteys OWNER TO postgres;
-- ddl-end --

-- object: yleismaarays_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kuvaustekniikka.yleismaarays_teema_yhteys DROP CONSTRAINT IF EXISTS yleismaarays_fk CASCADE;
ALTER TABLE yk_kuvaustekniikka.yleismaarays_teema_yhteys ADD CONSTRAINT yleismaarays_fk FOREIGN KEY (id_yleismaarays)
REFERENCES yk_yleiskaava.yleismaarays (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: teema_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kuvaustekniikka.yleismaarays_teema_yhteys DROP CONSTRAINT IF EXISTS teema_fk CASCADE;
ALTER TABLE yk_kuvaustekniikka.yleismaarays_teema_yhteys ADD CONSTRAINT teema_fk FOREIGN KEY (id_teema)
REFERENCES yk_kuvaustekniikka.teema (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --


-- object: kaavaobjekti_alue_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kuvaustekniikka.apugeometria_alue DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_fk CASCADE;
ALTER TABLE yk_kuvaustekniikka.apugeometria_alue ADD CONSTRAINT kaavaobjekti_alue_fk FOREIGN KEY (id_kaavaobjekti_alue)
REFERENCES yk_yleiskaava.kaavaobjekti_alue (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kuvaustekniikka.apugeometria_viiva DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_fk CASCADE;
ALTER TABLE yk_kuvaustekniikka.apugeometria_viiva ADD CONSTRAINT kaavaobjekti_alue_fk FOREIGN KEY (id_kaavaobjekti_alue)
REFERENCES yk_yleiskaava.kaavaobjekti_alue (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kuvaustekniikka.apugeometria_piste DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_fk CASCADE;
ALTER TABLE yk_kuvaustekniikka.apugeometria_piste ADD CONSTRAINT kaavaobjekti_alue_fk FOREIGN KEY (id_kaavaobjekti_alue)
REFERENCES yk_yleiskaava.kaavaobjekti_alue (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_koodiluettelot.kaavoitusprosessin_tila_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.kaavoitusprosessin_tila_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.kaavoitusprosessin_tila_tyyppi AS
 ENUM ('kaava_vireilla_ja_valmistelussa','keskeytetty','oas_nahtavilla','luonnos_nahtavilla','ehdotus_nahtavilla','tarkistettu_ehdotus_nahtavilla','hyvaksytty_ehdotus','hyvaksytty_ehdotus_josta_valitettu','voimaan_kuulutetttu_osin_tai_kokonaan');
-- ddl-end --
ALTER TYPE yk_koodiluettelot.kaavoitusprosessin_tila_tyyppi OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.kaavoitusprosessin_tila | type: TABLE --
-- DROP TABLE IF EXISTS yk_koodiluettelot.kaavoitusprosessin_tila CASCADE;
CREATE TABLE yk_koodiluettelot.kaavoitusprosessin_tila(
	id uuid NOT NULL,
	koodi yk_koodiluettelot.kaavoitusprosessin_tila_tyyppi,
	CONSTRAINT kaavoitusprosessin_tila_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_koodiluettelot.kaavoitusprosessin_tila OWNER TO postgres;
-- ddl-end --

-- object: kaavoitusprosessin_tila_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_alue DROP CONSTRAINT IF EXISTS kaavoitusprosessin_tila_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_alue ADD CONSTRAINT kaavoitusprosessin_tila_fk FOREIGN KEY (id_kaavoitusprosessin_tila)
REFERENCES yk_koodiluettelot.kaavoitusprosessin_tila (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavoitusprosessin_tila_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.yleiskaava DROP CONSTRAINT IF EXISTS kaavoitusprosessin_tila_fk CASCADE;
ALTER TABLE yk_yleiskaava.yleiskaava ADD CONSTRAINT kaavoitusprosessin_tila_fk FOREIGN KEY (id_kaavoitusprosessin_tila)
REFERENCES yk_koodiluettelot.kaavoitusprosessin_tila (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_yleiskaava.kaavaobjekti_viiva | type: TABLE --
-- DROP TABLE IF EXISTS yk_yleiskaava.kaavaobjekti_viiva CASCADE;
CREATE TABLE yk_yleiskaava.kaavaobjekti_viiva(
	id uuid NOT NULL,
	geom geometry(MULTILINESTRINGZ, 3878),
	nimi varchar,
	muokkaaja varchar,
	voimaantulopvm date,
	kumoamispvm date,
	version_alkamispvm date,
	version_loppumispvm date,
	nro varchar,
	aluevarauskohde boolean,
	taydentava_kaavamerkinta boolean,
	kohde_periytyy_muualta boolean,
	kansallinen_laillinen_sitovuus varchar,
	alkup_taulun_nimi varchar,
	id_yleiskaava uuid,
	id_laillinen_sitovuus uuid,
	id_prosessin_vaihe uuid,
	id_kansallinen_prosessin_vaihe uuid,
	id_kaavoitusprosessin_tila uuid,
	id_kaavakohteen_olemassaolo uuid,
	id_kansallisen_kaavakohteen_olemassaolo uuid,
	kayttotarkoitus_koodi varchar,
	kayttotarkoitus_nimi varchar,
	karttamerkinta varchar,
	katuosoite varchar,
	leveys_m real,
	pituus_km real,
	yhdrak_palvelualue varchar,
	yhdrak_rakennusoikeus varchar,
	mj_kp_laji varchar,
	mj_kp_tyyppi varchar,
	mj_kp_tyypintarkenne varchar,
	mj_kp_ajoitus varchar,
	mj_kp_tunnus varchar,
	kem_vyohykeleveys_km varchar,
	kem_kohde smallint,
	puhd_saast_syy varchar,
	puhd_toimenpiteet varchar,
	puhd_saast_kuva varchar,
	puhd_selvitystarve varchar,
	referenssi varchar,
	lisatieto varchar,
	CONSTRAINT kaavaobjekti_pk_2 PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_yleiskaava.kaavaobjekti_viiva IS 'Presence of one or several HILUCS values in an area, indicated either as the percentage covered for each value or as the values listed in their order of importance. http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/ScopeObjectDetail.action?objectDetailId=10556';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_viiva.nimi IS 'INSPIRE - official name of the supplementary regulation - http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/SearchObjectSelection.action?search=specific+regulation+nature';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_viiva.taydentava_kaavamerkinta IS 'jos kaavaobjektilla ei ole kaavamaaraysta, niin se ei ole taydentava_kaavamerkinta eikä aluevarauskohde';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_viiva.kansallinen_laillinen_sitovuus IS 'INSPIRE - Legal nature of the land use regulation from a national perspective. On member state level the legal classification for plan regulations may be complex. A supplementary regulation may be principally "bindingOnlyForAuthorities" but according to national law this regulation have to be more specified to explain the specific degree of binding. (e.g. on state or regional planning level in Germany: principles of spatial planning, other spatial planning requirements or goals of spatial planning).';
-- ddl-end --
ALTER TABLE yk_yleiskaava.kaavaobjekti_viiva OWNER TO postgres;
-- ddl-end --

-- object: yk_yleiskaava.kaavaobjekti_piste | type: TABLE --
-- DROP TABLE IF EXISTS yk_yleiskaava.kaavaobjekti_piste CASCADE;
CREATE TABLE yk_yleiskaava.kaavaobjekti_piste(
	id uuid NOT NULL,
	geom geometry(MULTIPOINTZ, 3878),
	nimi varchar,
	muokkaaja varchar,
	voimaantulopvm date,
	kumoamispvm date,
	version_alkamispvm date,
	version_loppumispvm date,
	nro varchar,
	aluevarauskohde boolean,
	taydentava_kaavamerkinta boolean,
	kohde_periytyy_muualta boolean,
	kansallinen_laillinen_sitovuus varchar,
	alkup_taulun_nimi varchar,
	id_yleiskaava uuid,
	id_laillinen_sitovuus uuid,
	id_prosessin_vaihe uuid,
	id_kansallinen_prosessin_vaihe uuid,
	id_kaavoitusprosessin_tila uuid,
	id_kaavakohteen_olemassaolo uuid,
	id_kansallisen_kaavakohteen_olemassaolo uuid,
	kayttotarkoitus_koodi varchar,
	kayttotarkoitus_nimi varchar,
	karttamerkinta varchar,
	katuosoite varchar,
	leveys_m real,
	pituus_km real,
	yhdrak_palvelualue varchar,
	yhdrak_rakennusoikeus varchar,
	mj_kp_laji varchar,
	mj_kp_tyyppi varchar,
	mj_kp_tyypintarkenne varchar,
	mj_kp_ajoitus varchar,
	mj_kp_tunnus varchar,
	kem_vyohykeleveys_km varchar,
	kem_kohde smallint,
	puhd_saast_syy varchar,
	puhd_toimenpiteet varchar,
	puhd_saast_kuva varchar,
	puhd_selvitystarve varchar,
	referenssi varchar,
	lisatieto varchar,
	CONSTRAINT kaavaobjekti_pk_1 PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_yleiskaava.kaavaobjekti_piste IS 'Presence of one or several HILUCS values in an area, indicated either as the percentage covered for each value or as the values listed in their order of importance. http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/ScopeObjectDetail.action?objectDetailId=10556';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_piste.nimi IS 'INSPIRE - official name of the supplementary regulation - http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/SearchObjectSelection.action?search=specific+regulation+nature';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_piste.taydentava_kaavamerkinta IS 'jos kaavaobjektilla ei ole kaavamaaraysta, niin se ei ole taydentava_kaavamerkinta eikä aluevarauskohde';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_piste.kansallinen_laillinen_sitovuus IS 'INSPIRE - Legal nature of the land use regulation from a national perspective. On member state level the legal classification for plan regulations may be complex. A supplementary regulation may be principally "bindingOnlyForAuthorities" but according to national law this regulation have to be more specified to explain the specific degree of binding. (e.g. on state or regional planning level in Germany: principles of spatial planning, other spatial planning requirements or goals of spatial planning).';
-- ddl-end --
ALTER TABLE yk_yleiskaava.kaavaobjekti_piste OWNER TO postgres;
-- ddl-end --

-- object: kaavaobjekti_viiva_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kuvaustekniikka.apugeometria_piste DROP CONSTRAINT IF EXISTS kaavaobjekti_viiva_fk CASCADE;
ALTER TABLE yk_kuvaustekniikka.apugeometria_piste ADD CONSTRAINT kaavaobjekti_viiva_fk FOREIGN KEY (id_kaavaobjekti_viiva)
REFERENCES yk_yleiskaava.kaavaobjekti_viiva (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_viiva_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kuvaustekniikka.apugeometria_viiva DROP CONSTRAINT IF EXISTS kaavaobjekti_viiva_fk CASCADE;
ALTER TABLE yk_kuvaustekniikka.apugeometria_viiva ADD CONSTRAINT kaavaobjekti_viiva_fk FOREIGN KEY (id_kaavaobjekti_viiva)
REFERENCES yk_yleiskaava.kaavaobjekti_viiva (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_viiva_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kuvaustekniikka.apugeometria_alue DROP CONSTRAINT IF EXISTS kaavaobjekti_viiva_fk CASCADE;
ALTER TABLE yk_kuvaustekniikka.apugeometria_alue ADD CONSTRAINT kaavaobjekti_viiva_fk FOREIGN KEY (id_kaavaobjekti_viiva)
REFERENCES yk_yleiskaava.kaavaobjekti_viiva (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_viiva_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kuvaustekniikka.kaavaobjekti_teema_yhteys DROP CONSTRAINT IF EXISTS kaavaobjekti_viiva_fk CASCADE;
ALTER TABLE yk_kuvaustekniikka.kaavaobjekti_teema_yhteys ADD CONSTRAINT kaavaobjekti_viiva_fk FOREIGN KEY (id_kaavaobjekti_viiva)
REFERENCES yk_yleiskaava.kaavaobjekti_viiva (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_viiva_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.mittakaava DROP CONSTRAINT IF EXISTS kaavaobjekti_viiva_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.mittakaava ADD CONSTRAINT kaavaobjekti_viiva_fk FOREIGN KEY (id_kaavaobjekti_viiva)
REFERENCES yk_yleiskaava.kaavaobjekti_viiva (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_viiva_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.ei_sitova_tavoiteaika DROP CONSTRAINT IF EXISTS kaavaobjekti_viiva_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.ei_sitova_tavoiteaika ADD CONSTRAINT kaavaobjekti_viiva_fk FOREIGN KEY (id_kaavaobjekti_viiva)
REFERENCES yk_yleiskaava.kaavaobjekti_viiva (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_viiva_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.suhde_maan_tasoon DROP CONSTRAINT IF EXISTS kaavaobjekti_viiva_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.suhde_maan_tasoon ADD CONSTRAINT kaavaobjekti_viiva_fk FOREIGN KEY (id_kaavaobjekti_viiva)
REFERENCES yk_yleiskaava.kaavaobjekti_viiva (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_viiva_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.sidottu_kaavaobjekti DROP CONSTRAINT IF EXISTS kaavaobjekti_viiva_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.sidottu_kaavaobjekti ADD CONSTRAINT kaavaobjekti_viiva_fk FOREIGN KEY (id_kaavaobjekti_viiva)
REFERENCES yk_yleiskaava.kaavaobjekti_viiva (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_viiva_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.sitova_kaavaobjekti DROP CONSTRAINT IF EXISTS kaavaobjekti_viiva_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.sitova_kaavaobjekti ADD CONSTRAINT kaavaobjekti_viiva_fk FOREIGN KEY (id_kaavaobjekti_viiva)
REFERENCES yk_yleiskaava.kaavaobjekti_viiva (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_viiva_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys DROP CONSTRAINT IF EXISTS kaavaobjekti_viiva_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys ADD CONSTRAINT kaavaobjekti_viiva_fk FOREIGN KEY (id_kaavaobjekti_viiva)
REFERENCES yk_yleiskaava.kaavaobjekti_viiva (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_viiva_fk | type: CONSTRAINT --
-- ALTER TABLE yk_mitoitus_varanto.mitoitus DROP CONSTRAINT IF EXISTS kaavaobjekti_viiva_fk CASCADE;
ALTER TABLE yk_mitoitus_varanto.mitoitus ADD CONSTRAINT kaavaobjekti_viiva_fk FOREIGN KEY (id_kaavaobjekti_viiva)
REFERENCES yk_yleiskaava.kaavaobjekti_viiva (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_viiva_fk | type: CONSTRAINT --
-- ALTER TABLE yk_inspire.kaavakohde DROP CONSTRAINT IF EXISTS kaavaobjekti_viiva_fk CASCADE;
ALTER TABLE yk_inspire.kaavakohde ADD CONSTRAINT kaavaobjekti_viiva_fk FOREIGN KEY (id_kaavaobjekti_viiva)
REFERENCES yk_yleiskaava.kaavaobjekti_viiva (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_viiva_fk | type: CONSTRAINT --
-- ALTER TABLE yk_inspire.kansallinen_kaavakohde DROP CONSTRAINT IF EXISTS kaavaobjekti_viiva_fk CASCADE;
ALTER TABLE yk_inspire.kansallinen_kaavakohde ADD CONSTRAINT kaavaobjekti_viiva_fk FOREIGN KEY (id_kaavaobjekti_viiva)
REFERENCES yk_yleiskaava.kaavaobjekti_viiva (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_viiva_fk | type: CONSTRAINT --
-- ALTER TABLE yk_inspire.taydentava_kaavamerkinta DROP CONSTRAINT IF EXISTS kaavaobjekti_viiva_fk CASCADE;
ALTER TABLE yk_inspire.taydentava_kaavamerkinta ADD CONSTRAINT kaavaobjekti_viiva_fk FOREIGN KEY (id_kaavaobjekti_viiva)
REFERENCES yk_yleiskaava.kaavaobjekti_viiva (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_viiva_fk | type: CONSTRAINT --
-- ALTER TABLE yk_inspire.kansallinen_taydentava_kaavamerkinta DROP CONSTRAINT IF EXISTS kaavaobjekti_viiva_fk CASCADE;
ALTER TABLE yk_inspire.kansallinen_taydentava_kaavamerkinta ADD CONSTRAINT kaavaobjekti_viiva_fk FOREIGN KEY (id_kaavaobjekti_viiva)
REFERENCES yk_yleiskaava.kaavaobjekti_viiva (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_viiva_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_yhteys DROP CONSTRAINT IF EXISTS kaavaobjekti_viiva_fk CASCADE;
ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_yhteys ADD CONSTRAINT kaavaobjekti_viiva_fk FOREIGN KEY (id_kaavaobjekti_viiva)
REFERENCES yk_yleiskaava.kaavaobjekti_viiva (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_viiva_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.dokumentti_yleiskaava_yhteys DROP CONSTRAINT IF EXISTS kaavaobjekti_viiva_fk CASCADE;
ALTER TABLE yk_prosessi.dokumentti_yleiskaava_yhteys ADD CONSTRAINT kaavaobjekti_viiva_fk FOREIGN KEY (id_kaavaobjekti_viiva)
REFERENCES yk_yleiskaava.kaavaobjekti_viiva (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_viiva DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_viiva ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: laillinen_sitovuus_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_viiva DROP CONSTRAINT IF EXISTS laillinen_sitovuus_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_viiva ADD CONSTRAINT laillinen_sitovuus_fk FOREIGN KEY (id_laillinen_sitovuus)
REFERENCES yk_koodiluettelot.laillinen_sitovuus (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: prosessin_vaihe_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_viiva DROP CONSTRAINT IF EXISTS prosessin_vaihe_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_viiva ADD CONSTRAINT prosessin_vaihe_fk FOREIGN KEY (id_prosessin_vaihe)
REFERENCES yk_koodiluettelot.prosessin_vaihe (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kansallinen_prosessin_vaihe_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_viiva DROP CONSTRAINT IF EXISTS kansallinen_prosessin_vaihe_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_viiva ADD CONSTRAINT kansallinen_prosessin_vaihe_fk FOREIGN KEY (id_kansallinen_prosessin_vaihe)
REFERENCES yk_koodiluettelot.kansallinen_prosessin_vaihe (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavoitusprosessin_tila_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_viiva DROP CONSTRAINT IF EXISTS kaavoitusprosessin_tila_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_viiva ADD CONSTRAINT kaavoitusprosessin_tila_fk FOREIGN KEY (id_kaavoitusprosessin_tila)
REFERENCES yk_koodiluettelot.kaavoitusprosessin_tila (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavakohteen_olemassaolo_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_viiva DROP CONSTRAINT IF EXISTS kaavakohteen_olemassaolo_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_viiva ADD CONSTRAINT kaavakohteen_olemassaolo_fk FOREIGN KEY (id_kaavakohteen_olemassaolo)
REFERENCES yk_inspire.kaavakohteen_olemassaolo (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kansallisen_kaavakohteen_olemassaolo_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_viiva DROP CONSTRAINT IF EXISTS kansallisen_kaavakohteen_olemassaolo_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_viiva ADD CONSTRAINT kansallisen_kaavakohteen_olemassaolo_fk FOREIGN KEY (id_kansallisen_kaavakohteen_olemassaolo)
REFERENCES yk_inspire.kansallisen_kaavakohteen_olemassaolo (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_piste_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kuvaustekniikka.apugeometria_piste DROP CONSTRAINT IF EXISTS kaavaobjekti_piste_fk CASCADE;
ALTER TABLE yk_kuvaustekniikka.apugeometria_piste ADD CONSTRAINT kaavaobjekti_piste_fk FOREIGN KEY (id_kaavaobjekti_piste)
REFERENCES yk_yleiskaava.kaavaobjekti_piste (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_piste_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kuvaustekniikka.apugeometria_viiva DROP CONSTRAINT IF EXISTS kaavaobjekti_piste_fk CASCADE;
ALTER TABLE yk_kuvaustekniikka.apugeometria_viiva ADD CONSTRAINT kaavaobjekti_piste_fk FOREIGN KEY (id_kaavaobjekti_piste)
REFERENCES yk_yleiskaava.kaavaobjekti_piste (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_piste_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kuvaustekniikka.apugeometria_alue DROP CONSTRAINT IF EXISTS kaavaobjekti_piste_fk CASCADE;
ALTER TABLE yk_kuvaustekniikka.apugeometria_alue ADD CONSTRAINT kaavaobjekti_piste_fk FOREIGN KEY (id_kaavaobjekti_piste)
REFERENCES yk_yleiskaava.kaavaobjekti_piste (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_piste_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kuvaustekniikka.kaavaobjekti_teema_yhteys DROP CONSTRAINT IF EXISTS kaavaobjekti_piste_fk CASCADE;
ALTER TABLE yk_kuvaustekniikka.kaavaobjekti_teema_yhteys ADD CONSTRAINT kaavaobjekti_piste_fk FOREIGN KEY (id_kaavaobjekti_piste)
REFERENCES yk_yleiskaava.kaavaobjekti_piste (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_piste_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.mittakaava DROP CONSTRAINT IF EXISTS kaavaobjekti_piste_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.mittakaava ADD CONSTRAINT kaavaobjekti_piste_fk FOREIGN KEY (id_kaavaobjekti_piste)
REFERENCES yk_yleiskaava.kaavaobjekti_piste (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_piste_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.ei_sitova_tavoiteaika DROP CONSTRAINT IF EXISTS kaavaobjekti_piste_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.ei_sitova_tavoiteaika ADD CONSTRAINT kaavaobjekti_piste_fk FOREIGN KEY (id_kaavaobjekti_piste)
REFERENCES yk_yleiskaava.kaavaobjekti_piste (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_piste_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.suhde_maan_tasoon DROP CONSTRAINT IF EXISTS kaavaobjekti_piste_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.suhde_maan_tasoon ADD CONSTRAINT kaavaobjekti_piste_fk FOREIGN KEY (id_kaavaobjekti_piste)
REFERENCES yk_yleiskaava.kaavaobjekti_piste (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_piste_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.sidottu_kaavaobjekti DROP CONSTRAINT IF EXISTS kaavaobjekti_piste_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.sidottu_kaavaobjekti ADD CONSTRAINT kaavaobjekti_piste_fk FOREIGN KEY (id_kaavaobjekti_piste)
REFERENCES yk_yleiskaava.kaavaobjekti_piste (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_piste_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.sitova_kaavaobjekti DROP CONSTRAINT IF EXISTS kaavaobjekti_piste_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.sitova_kaavaobjekti ADD CONSTRAINT kaavaobjekti_piste_fk FOREIGN KEY (id_kaavaobjekti_piste)
REFERENCES yk_yleiskaava.kaavaobjekti_piste (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_piste_fk | type: CONSTRAINT --
-- ALTER TABLE yk_mitoitus_varanto.mitoitus DROP CONSTRAINT IF EXISTS kaavaobjekti_piste_fk CASCADE;
ALTER TABLE yk_mitoitus_varanto.mitoitus ADD CONSTRAINT kaavaobjekti_piste_fk FOREIGN KEY (id_kaavaobjekti_piste)
REFERENCES yk_yleiskaava.kaavaobjekti_piste (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_piste_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys DROP CONSTRAINT IF EXISTS kaavaobjekti_piste_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys ADD CONSTRAINT kaavaobjekti_piste_fk FOREIGN KEY (id_kaavaobjekti_piste)
REFERENCES yk_yleiskaava.kaavaobjekti_piste (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_piste_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_yhteys DROP CONSTRAINT IF EXISTS kaavaobjekti_piste_fk CASCADE;
ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_yhteys ADD CONSTRAINT kaavaobjekti_piste_fk FOREIGN KEY (id_kaavaobjekti_piste)
REFERENCES yk_yleiskaava.kaavaobjekti_piste (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_piste_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.dokumentti_yleiskaava_yhteys DROP CONSTRAINT IF EXISTS kaavaobjekti_piste_fk CASCADE;
ALTER TABLE yk_prosessi.dokumentti_yleiskaava_yhteys ADD CONSTRAINT kaavaobjekti_piste_fk FOREIGN KEY (id_kaavaobjekti_piste)
REFERENCES yk_yleiskaava.kaavaobjekti_piste (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_piste_fk | type: CONSTRAINT --
-- ALTER TABLE yk_inspire.kaavakohde DROP CONSTRAINT IF EXISTS kaavaobjekti_piste_fk CASCADE;
ALTER TABLE yk_inspire.kaavakohde ADD CONSTRAINT kaavaobjekti_piste_fk FOREIGN KEY (id_kaavaobjekti_piste)
REFERENCES yk_yleiskaava.kaavaobjekti_piste (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_piste_fk | type: CONSTRAINT --
-- ALTER TABLE yk_inspire.kansallinen_kaavakohde DROP CONSTRAINT IF EXISTS kaavaobjekti_piste_fk CASCADE;
ALTER TABLE yk_inspire.kansallinen_kaavakohde ADD CONSTRAINT kaavaobjekti_piste_fk FOREIGN KEY (id_kaavaobjekti_piste)
REFERENCES yk_yleiskaava.kaavaobjekti_piste (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_piste_fk | type: CONSTRAINT --
-- ALTER TABLE yk_inspire.taydentava_kaavamerkinta DROP CONSTRAINT IF EXISTS kaavaobjekti_piste_fk CASCADE;
ALTER TABLE yk_inspire.taydentava_kaavamerkinta ADD CONSTRAINT kaavaobjekti_piste_fk FOREIGN KEY (id_kaavaobjekti_piste)
REFERENCES yk_yleiskaava.kaavaobjekti_piste (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_piste_fk | type: CONSTRAINT --
-- ALTER TABLE yk_inspire.kansallinen_taydentava_kaavamerkinta DROP CONSTRAINT IF EXISTS kaavaobjekti_piste_fk CASCADE;
ALTER TABLE yk_inspire.kansallinen_taydentava_kaavamerkinta ADD CONSTRAINT kaavaobjekti_piste_fk FOREIGN KEY (id_kaavaobjekti_piste)
REFERENCES yk_yleiskaava.kaavaobjekti_piste (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_piste DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_piste ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: laillinen_sitovuus_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_piste DROP CONSTRAINT IF EXISTS laillinen_sitovuus_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_piste ADD CONSTRAINT laillinen_sitovuus_fk FOREIGN KEY (id_laillinen_sitovuus)
REFERENCES yk_koodiluettelot.laillinen_sitovuus (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: prosessin_vaihe_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_piste DROP CONSTRAINT IF EXISTS prosessin_vaihe_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_piste ADD CONSTRAINT prosessin_vaihe_fk FOREIGN KEY (id_prosessin_vaihe)
REFERENCES yk_koodiluettelot.prosessin_vaihe (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kansallinen_prosessin_vaihe_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_piste DROP CONSTRAINT IF EXISTS kansallinen_prosessin_vaihe_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_piste ADD CONSTRAINT kansallinen_prosessin_vaihe_fk FOREIGN KEY (id_kansallinen_prosessin_vaihe)
REFERENCES yk_koodiluettelot.kansallinen_prosessin_vaihe (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavoitusprosessin_tila_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_piste DROP CONSTRAINT IF EXISTS kaavoitusprosessin_tila_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_piste ADD CONSTRAINT kaavoitusprosessin_tila_fk FOREIGN KEY (id_kaavoitusprosessin_tila)
REFERENCES yk_koodiluettelot.kaavoitusprosessin_tila (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavakohteen_olemassaolo_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_piste DROP CONSTRAINT IF EXISTS kaavakohteen_olemassaolo_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_piste ADD CONSTRAINT kaavakohteen_olemassaolo_fk FOREIGN KEY (id_kaavakohteen_olemassaolo)
REFERENCES yk_inspire.kaavakohteen_olemassaolo (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kansallisen_kaavakohteen_olemassaolo_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_piste DROP CONSTRAINT IF EXISTS kansallisen_kaavakohteen_olemassaolo_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_piste ADD CONSTRAINT kansallisen_kaavakohteen_olemassaolo_fk FOREIGN KEY (id_kansallisen_kaavakohteen_olemassaolo)
REFERENCES yk_inspire.kansallisen_kaavakohteen_olemassaolo (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_mitoitus_varanto.varanto_arvio | type: TABLE --
-- DROP TABLE IF EXISTS yk_mitoitus_varanto.varanto_arvio CASCADE;
CREATE TABLE yk_mitoitus_varanto.varanto_arvio(
	id uuid NOT NULL,
	nolla_pvm date,
	arvio_pvm date,
	vaestomaara_muutos smallint,
	tyopaikkamaara_muutos smallint,
	kerrostalo_kem_muutos smallint,
	rivitalo_kem_muutos smallint,
	omakotitalo_kem_muutos smallint,
	muu_kem_muutos smallint,
	ehdol_kerrostalo_kem smallint,
	ehdol_rivitalo_kem smallint,
	ehdol_omakotitalo_kem smallint,
	ehdol_muu_kem smallint,
	ehdol_syyt varchar,
	poist_kerrostalo_kem_muutos smallint,
	poist_rivitalo_kem_muutos smallint,
	poist_omakotitalo_kem_muutos smallint,
	poist_muu_kem_muutos smallint,
	poist_lisatiedot varchar,
	muut_lisatiedot varchar,
	CONSTRAINT tulevaisuus_arvio_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.varanto_arvio.nolla_pvm IS 'Päivämäärä, jonka jälkeistä muutoksen suuruutta kuvataan.';
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.varanto_arvio.arvio_pvm IS 'Päivämäärä, jonka ajakohtana arvio on toteutunut';
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.varanto_arvio.vaestomaara_muutos IS 'Väestömäärän muutos';
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.varanto_arvio.tyopaikkamaara_muutos IS 'Työpaikkojen lkm muutos';
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.varanto_arvio.kerrostalo_kem_muutos IS 'Arvioitu asuinkerrostalojen kokonaiskerrosalan muutos';
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.varanto_arvio.rivitalo_kem_muutos IS 'Arvioitu rivitalojen kokonaiskerrosalan muutos';
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.varanto_arvio.omakotitalo_kem_muutos IS 'Arvioitu omakotitalojen kokonaiskerrosalan muutos';
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.varanto_arvio.muu_kem_muutos IS 'Muuhun kuin asumiseen suunniteltu kokonaiskerrosalan muutos';
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.varanto_arvio.ehdol_kerrostalo_kem IS 'Luku kuvaa sitä, kuinka monta kerrosneliötä asuinkerrostaloille osoitetusta kerrosalasta on riippuvaista siitä, että olemassa olevassa rakennuskannassa tehdään huomattavia muutoksia.';
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.varanto_arvio.ehdol_syyt IS 'Lyhyt sanallinen kuvaus siitä, miksi ehdol_*_kem sarakkeen kerrosala on ehdollista, eli onko ko kerrosalan toteutumisen ehtona esimerkiksi olemassa olevan rakennuskannan purkaminen, rakennusten korottaminen tms.';
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.varanto_arvio.poist_kerrostalo_kem_muutos IS 'Yleiskaavan mukaisen asuinkerrostalojen varannon poistuma kerrosneliöinä';
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.varanto_arvio.poist_lisatiedot IS 'Lyhyt poistumiseen liittyvä selite';
-- ddl-end --
ALTER TABLE yk_mitoitus_varanto.varanto_arvio OWNER TO postgres;
-- ddl-end --

-- object: yk_mitoitus_varanto.vaestorakenne_arvio | type: TABLE --
-- DROP TABLE IF EXISTS yk_mitoitus_varanto.vaestorakenne_arvio CASCADE;
CREATE TABLE yk_mitoitus_varanto.vaestorakenne_arvio(
	id uuid NOT NULL,
	pvm date,
	alku_ikavuosi smallint,
	loppu_ikavuosi smallint,
	lukumaara smallint,
	lisatiedot varchar,
	id_erityisryhma uuid,
	CONSTRAINT tulevaisuus_vaestorakenne_arvio_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.vaestorakenne_arvio.alku_ikavuosi IS 'Väestörakennearvion ikäryhmän alkuikä, esim. 15-64 vuotiaille tämä on 15';
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.vaestorakenne_arvio.loppu_ikavuosi IS 'Väestörakennearvion ikäryhmän suurin ikä, esim. 15-64 vuotiaille tämä on 64';
-- ddl-end --
ALTER TABLE yk_mitoitus_varanto.vaestorakenne_arvio OWNER TO postgres;
-- ddl-end --

-- object: yk_mitoitus_varanto.erityisryhma_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_mitoitus_varanto.erityisryhma_tyyppi CASCADE;
CREATE TYPE yk_mitoitus_varanto.erityisryhma_tyyppi AS
 ENUM ('tyoton','asunnoton','maahanmuuttaja','pakolainen','romani','kuulorajoitteinen','nakorajoitteinen','liikuntarajoitteinen','vammainen','vanhus');
-- ddl-end --
ALTER TYPE yk_mitoitus_varanto.erityisryhma_tyyppi OWNER TO postgres;
-- ddl-end --

-- object: yk_mitoitus_varanto.erityisryhma | type: TABLE --
-- DROP TABLE IF EXISTS yk_mitoitus_varanto.erityisryhma CASCADE;
CREATE TABLE yk_mitoitus_varanto.erityisryhma(
	id uuid NOT NULL,
	tyyppi yk_mitoitus_varanto.erityisryhma_tyyppi,
	CONSTRAINT erityisryhma_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_mitoitus_varanto.erityisryhma OWNER TO postgres;
-- ddl-end --

-- object: erityisryhma_fk | type: CONSTRAINT --
-- ALTER TABLE yk_mitoitus_varanto.vaestorakenne_arvio DROP CONSTRAINT IF EXISTS erityisryhma_fk CASCADE;
ALTER TABLE yk_mitoitus_varanto.vaestorakenne_arvio ADD CONSTRAINT erityisryhma_fk FOREIGN KEY (id_erityisryhma)
REFERENCES yk_mitoitus_varanto.erityisryhma (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_mitoitus_varanto.vaestorakenne_toteutunut | type: TABLE --
-- DROP TABLE IF EXISTS yk_mitoitus_varanto.vaestorakenne_toteutunut CASCADE;
CREATE TABLE yk_mitoitus_varanto.vaestorakenne_toteutunut(
	id uuid NOT NULL,
	pvm date,
	alku_ikavuosi smallint,
	loppu_ikavuosi smallint,
	lukumaara smallint,
	lisatiedot varchar,
	id_erityisryhma uuid,
	CONSTRAINT tulevaisuus_vaestorakenne_arvio_pk_1 PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.vaestorakenne_toteutunut.alku_ikavuosi IS 'Väestörakennearvion ikäryhmän alkuikä, esim. 15-64 vuotiaille tämä on 15';
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.vaestorakenne_toteutunut.loppu_ikavuosi IS 'Väestörakennearvion ikäryhmän suurin ikä, esim. 15-64 vuotiaille tämä on 64';
-- ddl-end --
ALTER TABLE yk_mitoitus_varanto.vaestorakenne_toteutunut OWNER TO postgres;
-- ddl-end --

-- object: erityisryhma_fk | type: CONSTRAINT --
-- ALTER TABLE yk_mitoitus_varanto.vaestorakenne_toteutunut DROP CONSTRAINT IF EXISTS erityisryhma_fk CASCADE;
ALTER TABLE yk_mitoitus_varanto.vaestorakenne_toteutunut ADD CONSTRAINT erityisryhma_fk FOREIGN KEY (id_erityisryhma)
REFERENCES yk_mitoitus_varanto.erityisryhma (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_mitoitus_varanto.varanto_toteutunut | type: TABLE --
-- DROP TABLE IF EXISTS yk_mitoitus_varanto.varanto_toteutunut CASCADE;
CREATE TABLE yk_mitoitus_varanto.varanto_toteutunut(
	id uuid NOT NULL,
	nolla_pvm date,
	toteutunut_pvm date,
	vaestomaara_muutos smallint,
	tyopaikkamaara_muutos smallint,
	kerrostalo_kem_muutos smallint,
	rivitalo_kem_muutos smallint,
	omakotitalo_kem_muutos smallint,
	muu_kem_muutos smallint,
	ehdol_kerrostalo_kem smallint,
	ehdol_rivitalo_kem smallint,
	ehdol_omakotitalo_kem smallint,
	ehdol_muu_kem smallint,
	ehdol_syyt varchar,
	poist_kerrostalo_kem_muutos smallint,
	poist_rivitalo_kem_muutos smallint,
	poist_omakotitalo_kem_muutos smallint,
	poist_muu_kem_muutos smallint,
	poist_lisatiedot varchar,
	muut_lisatiedot varchar,
	CONSTRAINT tulevaisuus_arvio_pk_1 PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.varanto_toteutunut.nolla_pvm IS 'Päivämäärä, jonka jälkeistä muutoksen suuruutta kuvataan.';
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.varanto_toteutunut.toteutunut_pvm IS 'Toteutumisen ajankohta';
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.varanto_toteutunut.vaestomaara_muutos IS 'Väestömäärän muutos';
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.varanto_toteutunut.tyopaikkamaara_muutos IS 'Työpaikkojen lkm muutos';
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.varanto_toteutunut.kerrostalo_kem_muutos IS 'Asuinkerrostalojen kokonaiskerrosalan muutos';
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.varanto_toteutunut.rivitalo_kem_muutos IS 'Rivitalojen kokonaiskerrosalan muutos';
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.varanto_toteutunut.omakotitalo_kem_muutos IS 'Omakotitalojen kokonaiskerrosalan muutos';
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.varanto_toteutunut.muu_kem_muutos IS 'Muuhun kuin asumiseen tarkoitetun kokonaiskerrosalan muutos';
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.varanto_toteutunut.ehdol_kerrostalo_kem IS 'Luku kuvaa sitä, kuinka monta kerrosneliötä asuinkerrostaloille osoitetusta kerrosalasta oli riippuvaista siitä, että olemassa olevassa rakennuskannassa tehdään huomattavia muutoksia.';
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.varanto_toteutunut.ehdol_syyt IS 'Lyhyt sanallinen kuvaus siitä, miksi ehdol_*_kem sarakkeen kerrosala oli ehdollista, eli oliko ko kerrosalan toteutumisen ehtona esimerkiksi olemassa olevan rakennuskannan purkaminen, rakennusten korottaminen tms.';
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.varanto_toteutunut.poist_kerrostalo_kem_muutos IS 'Yleiskaavan mukaisen asuinkerrostalojen varannon poistuma kerrosneliöinä';
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.varanto_toteutunut.poist_lisatiedot IS 'Lyhyt poistumiseen liittyvä selite';
-- ddl-end --
ALTER TABLE yk_mitoitus_varanto.varanto_toteutunut OWNER TO postgres;
-- ddl-end --

-- object: varanto_arvio_fk | type: CONSTRAINT --
-- ALTER TABLE yk_mitoitus_varanto.mitoitus DROP CONSTRAINT IF EXISTS varanto_arvio_fk CASCADE;
ALTER TABLE yk_mitoitus_varanto.mitoitus ADD CONSTRAINT varanto_arvio_fk FOREIGN KEY (id_varanto_arvio)
REFERENCES yk_mitoitus_varanto.varanto_arvio (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: varanto_toteutunut_fk | type: CONSTRAINT --
-- ALTER TABLE yk_mitoitus_varanto.mitoitus DROP CONSTRAINT IF EXISTS varanto_toteutunut_fk CASCADE;
ALTER TABLE yk_mitoitus_varanto.mitoitus ADD CONSTRAINT varanto_toteutunut_fk FOREIGN KEY (id_varanto_toteutunut)
REFERENCES yk_mitoitus_varanto.varanto_toteutunut (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: vaestorakenne_arvio_fk | type: CONSTRAINT --
-- ALTER TABLE yk_mitoitus_varanto.mitoitus DROP CONSTRAINT IF EXISTS vaestorakenne_arvio_fk CASCADE;
ALTER TABLE yk_mitoitus_varanto.mitoitus ADD CONSTRAINT vaestorakenne_arvio_fk FOREIGN KEY (id_vaestorakenne_arvio)
REFERENCES yk_mitoitus_varanto.vaestorakenne_arvio (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: vaestorakenne_toteutunut_fk | type: CONSTRAINT --
-- ALTER TABLE yk_mitoitus_varanto.mitoitus DROP CONSTRAINT IF EXISTS vaestorakenne_toteutunut_fk CASCADE;
ALTER TABLE yk_mitoitus_varanto.mitoitus ADD CONSTRAINT vaestorakenne_toteutunut_fk FOREIGN KEY (id_vaestorakenne_toteutunut)
REFERENCES yk_mitoitus_varanto.vaestorakenne_toteutunut (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_mitoitus_varanto.asuntovaranto_kaytto_arvio | type: TABLE --
-- DROP TABLE IF EXISTS yk_mitoitus_varanto.asuntovaranto_kaytto_arvio CASCADE;
CREATE TABLE yk_mitoitus_varanto.asuntovaranto_kaytto_arvio(
	id uuid NOT NULL,
	pvm date,
	kem_maara smallint,
	lisatiedot varchar,
	id_kayttotapa uuid,
	CONSTRAINT asuntovaranto_kaytto_arvio_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.asuntovaranto_kaytto_arvio.kem_maara IS 'Kerrosneliöiden määrä käyttötavan mukaan';
-- ddl-end --
ALTER TABLE yk_mitoitus_varanto.asuntovaranto_kaytto_arvio OWNER TO postgres;
-- ddl-end --

-- object: yk_mitoitus_varanto.kayttotapa_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_mitoitus_varanto.kayttotapa_tyyppi CASCADE;
CREATE TYPE yk_mitoitus_varanto.kayttotapa_tyyppi AS
 ENUM ('ykkosasunto','kakkosasunto','tilapainen','kylmillaan');
-- ddl-end --
ALTER TYPE yk_mitoitus_varanto.kayttotapa_tyyppi OWNER TO postgres;
-- ddl-end --

-- object: yk_mitoitus_varanto.kayttotapa | type: TABLE --
-- DROP TABLE IF EXISTS yk_mitoitus_varanto.kayttotapa CASCADE;
CREATE TABLE yk_mitoitus_varanto.kayttotapa(
	id uuid NOT NULL,
	tyyppi yk_mitoitus_varanto.kayttotapa_tyyppi,
	CONSTRAINT kayttotapa_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_mitoitus_varanto.kayttotapa OWNER TO postgres;
-- ddl-end --

-- object: kayttotapa_fk | type: CONSTRAINT --
-- ALTER TABLE yk_mitoitus_varanto.asuntovaranto_kaytto_arvio DROP CONSTRAINT IF EXISTS kayttotapa_fk CASCADE;
ALTER TABLE yk_mitoitus_varanto.asuntovaranto_kaytto_arvio ADD CONSTRAINT kayttotapa_fk FOREIGN KEY (id_kayttotapa)
REFERENCES yk_mitoitus_varanto.kayttotapa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_mitoitus_varanto.asuntovaranto_kaytto_toteutunut | type: TABLE --
-- DROP TABLE IF EXISTS yk_mitoitus_varanto.asuntovaranto_kaytto_toteutunut CASCADE;
CREATE TABLE yk_mitoitus_varanto.asuntovaranto_kaytto_toteutunut(
	id uuid NOT NULL,
	pvm date,
	kem_maara smallint,
	lisatiedot varchar,
	id_kayttotapa uuid,
	CONSTRAINT asuntovaranto_kaytto_arvio_pk_1 PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.asuntovaranto_kaytto_toteutunut.kem_maara IS 'Kerrosneliöiden määrä käyttötavan mukaan';
-- ddl-end --
ALTER TABLE yk_mitoitus_varanto.asuntovaranto_kaytto_toteutunut OWNER TO postgres;
-- ddl-end --

-- object: kayttotapa_fk | type: CONSTRAINT --
-- ALTER TABLE yk_mitoitus_varanto.asuntovaranto_kaytto_toteutunut DROP CONSTRAINT IF EXISTS kayttotapa_fk CASCADE;
ALTER TABLE yk_mitoitus_varanto.asuntovaranto_kaytto_toteutunut ADD CONSTRAINT kayttotapa_fk FOREIGN KEY (id_kayttotapa)
REFERENCES yk_mitoitus_varanto.kayttotapa (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: asuntovaranto_kaytto_arvio_fk | type: CONSTRAINT --
-- ALTER TABLE yk_mitoitus_varanto.mitoitus DROP CONSTRAINT IF EXISTS asuntovaranto_kaytto_arvio_fk CASCADE;
ALTER TABLE yk_mitoitus_varanto.mitoitus ADD CONSTRAINT asuntovaranto_kaytto_arvio_fk FOREIGN KEY (id_asuntovaranto_kaytto_arvio)
REFERENCES yk_mitoitus_varanto.asuntovaranto_kaytto_arvio (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: asuntovaranto_kaytto_toteutunut_fk | type: CONSTRAINT --
-- ALTER TABLE yk_mitoitus_varanto.mitoitus DROP CONSTRAINT IF EXISTS asuntovaranto_kaytto_toteutunut_fk CASCADE;
ALTER TABLE yk_mitoitus_varanto.mitoitus ADD CONSTRAINT asuntovaranto_kaytto_toteutunut_fk FOREIGN KEY (id_asuntovaranto_kaytto_toteutunut)
REFERENCES yk_mitoitus_varanto.asuntovaranto_kaytto_toteutunut (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_geoserver.yk049_k1_kayttotark_alue | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k1_kayttotark_alue CASCADE;
CREATE VIEW yk_geoserver.yk049_k1_kayttotark_alue
AS 

SELECT
	kaavaobjekti.id,
	kaavaobjekti.nimi AS ko_nimi,
	geom AS geom,
	kaavaobjekti.voimaantulopvm AS ko_voimaantulopvm,
	kaavaobjekti.kumoamispvm AS ko_kumoamispvm,
	nro,
	alkup_taulun_nimi,
	kayttotarkoitus_koodi,
	kayttotarkoitus_nimi,
	karttamerkinta,
	katuosoite,
	leveys_m,
	pituus_km,
	yhdrak_palvelualue,
	yhdrak_rakennusoikeus,
	mj_kp_laji,
	mj_kp_tyyppi,
	mj_kp_tyypintarkenne,
	mj_kp_ajoitus,
	mj_kp_tunnus,
	kem_vyohykeleveys_km,
	kem_kohde,
	puhd_saast_syy,
	puhd_toimenpiteet,
	puhd_saast_kuva,
	puhd_selvitystarve,
	referenssi,
	lisatieto,
	kaavamaarays.nimi AS m_nimi,
	kaavamaarays.lyhenne AS m_lyhenne,
	maaraysteksti,
	kaavamaarays.kuvaus AS m_kuvaus,
	kaavamaarays.linkki AS m_linkki,
	kaavamaarays.huomio AS m_huomio,
	teema.nimi AS teema,
	mitoitus.pinta_ala AS pinta_ala_m2
FROM
	yk_yleiskaava.kaavamaarays,
	yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
	yk_yleiskaava.kaavaobjekti_alue AS kaavaobjekti,
	yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
	yk_kuvaustekniikka.teema,
	yk_mitoitus_varanto.mitoitus
WHERE
	teema.nimi = 'yk049_k1' AND
	teema.id = kaavaobjekti_teema_yhteys.id_teema AND
	kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id AND
	GeometryType(kaavaobjekti.geom) = 'MULTIPOLYGON' AND
	kaavaobjekti.alkup_taulun_nimi = 'k1_kayttotarkoitusalueet' AND
	mitoitus.id_kaavaobjekti_alue = kaavaobjekti.id;
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k1_kayttotark_alue OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k1_linjat_reitit_vaylat_viiva | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k1_linjat_reitit_vaylat_viiva CASCADE;
CREATE VIEW yk_geoserver.yk049_k1_linjat_reitit_vaylat_viiva
AS 

SELECT
	kaavaobjekti.id,
	kaavaobjekti.nimi AS ko_nimi,
	geom AS geom,
	kaavaobjekti.voimaantulopvm AS ko_voimaantulopvm,
	kaavaobjekti.kumoamispvm AS ko_kumoamispvm,
	alkup_taulun_nimi,
	kayttotarkoitus_koodi,
	kayttotarkoitus_nimi,
	karttamerkinta,
	katuosoite,
	leveys_m,
	pituus_km,
	yhdrak_palvelualue,
	yhdrak_rakennusoikeus,
	mj_kp_laji,
	mj_kp_tyyppi,
	mj_kp_tyypintarkenne,
	mj_kp_ajoitus,
	mj_kp_tunnus,
	kem_vyohykeleveys_km,
	kem_kohde,
	puhd_saast_syy,
	puhd_toimenpiteet,
	puhd_saast_kuva,
	puhd_selvitystarve,
	referenssi,
	lisatieto,
	kaavamaarays.nimi AS m_nimi,
	kaavamaarays.lyhenne AS m_lyhenne,
	maaraysteksti,
	kaavamaarays.kuvaus AS m_kuvaus,
	kaavamaarays.linkki AS m_linkki,
	kaavamaarays.huomio AS m_huomio,
	teema.nimi AS teema
FROM
	yk_yleiskaava.kaavamaarays,
	yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
	yk_yleiskaava.kaavaobjekti_viiva AS kaavaobjekti,
	yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
	yk_kuvaustekniikka.teema
WHERE
	teema.nimi = 'yk049_k1' AND
	teema.id = kaavaobjekti_teema_yhteys.id_teema AND
	kaavaobjekti_teema_yhteys.id_kaavaobjekti_viiva = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_viiva = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id AND
	GeometryType(kaavaobjekti.geom) = 'MULTILINESTRING' AND
	kaavaobjekti.alkup_taulun_nimi = 'k1_linjat_reitit_vaylat_line';
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k1_linjat_reitit_vaylat_viiva OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k1_kaava_alue | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k1_kaava_alue CASCADE;
CREATE VIEW yk_geoserver.yk049_k1_kaava_alue
AS 

SELECT
	yleiskaava.id,
	yleiskaava.nimi AS yk_nimi,
	kaavan_ulkorajaus,
	vaihtoehtoinen_nimi AS yk_vaihtoehtoinen_nimi,
	yleiskaava.vireilletulopvm AS yk_vireilletulopvm,
	yleiskaava.voimaantulopvm AS yk_voimaantulopvm,
	yleiskaava.kumoamispvm AS yk_kumoamispvm,
	nro,
	yleismaarays.nimi AS ym_nimi,
	maaraysteksti,
	linkki,
	teema.nimi AS teema
FROM
	yk_yleiskaava.yleiskaava,
	yk_yleiskaava.yleismaarays,
	yk_kuvaustekniikka.teema,
	yk_kuvaustekniikka.yleismaarays_teema_yhteys
WHERE
	yleiskaava.nro = 'yk049' AND
	yleismaarays.id_yleiskaava = yleiskaava.id AND
	teema.nimi = 'yk049_k1' AND
	yleismaarays_teema_yhteys.id_teema = teema.id AND
	yleismaarays_teema_yhteys.id_yleismaarays = yleismaarays.id;
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k1_kaava_alue OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k1_apugeometria_piste | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k1_apugeometria_piste CASCADE;
CREATE VIEW yk_geoserver.yk049_k1_apugeometria_piste
AS 

SELECT
	apugeometria_piste.id,
	geom,
	selitys,
	rotaatio,
	teema.nimi AS teema
FROM
	yk_kuvaustekniikka.apugeometria_piste,
	yk_kuvaustekniikka.teema
WHERE
	teema.nimi = 'yk049_k1' AND
	teema.id = apugeometria_piste.id_teema;
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k1_apugeometria_piste OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k1_apugeometria_viiva | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k1_apugeometria_viiva CASCADE;
CREATE VIEW yk_geoserver.yk049_k1_apugeometria_viiva
AS 

SELECT
	apugeometria_viiva.id,
	geom,
	selitys,
	rotaatio,
	teema.nimi AS teema
FROM
	yk_kuvaustekniikka.apugeometria_viiva,
	yk_kuvaustekniikka.teema
WHERE
	teema.nimi = 'yk049_k1' AND
	teema.id = apugeometria_viiva.id_teema;
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k1_apugeometria_viiva OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k1_apugeometria_alue | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k1_apugeometria_alue CASCADE;
CREATE VIEW yk_geoserver.yk049_k1_apugeometria_alue
AS 

SELECT
	apugeometria_alue.id,
	geom,
	selitys,
	rotaatio,
	teema.nimi AS teema
FROM
	yk_kuvaustekniikka.apugeometria_alue,
	yk_kuvaustekniikka.teema
WHERE
	teema.nimi = 'yk049_k1' AND
	teema.id = apugeometria_alue.id_teema;
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k1_apugeometria_alue OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk2040_k1_pyora_tavoiteverk_viiva | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk2040_k1_pyora_tavoiteverk_viiva CASCADE;
CREATE VIEW yk_geoserver.yk2040_k1_pyora_tavoiteverk_viiva
AS 

SELECT
	kaavaobjekti.id,
	kaavaobjekti.nimi AS ko_nimi,
	geom AS geom,
	kaavaobjekti.voimaantulopvm AS ko_voimaantulopvm,
	kaavaobjekti.kumoamispvm AS ko_kumoamispvm,
	alkup_taulun_nimi,
	kayttotarkoitus_koodi,
	kayttotarkoitus_nimi,
	karttamerkinta,
	katuosoite,
	leveys_m,
	pituus_km,
	yhdrak_palvelualue,
	yhdrak_rakennusoikeus,
	mj_kp_laji,
	mj_kp_tyyppi,
	mj_kp_tyypintarkenne,
	mj_kp_ajoitus,
	mj_kp_tunnus,
	kem_vyohykeleveys_km,
	kem_kohde,
	puhd_saast_syy,
	puhd_toimenpiteet,
	puhd_saast_kuva,
	puhd_selvitystarve,
	referenssi,
	lisatieto,
	kaavamaarays.nimi AS m_nimi,
	kaavamaarays.lyhenne AS m_lyhenne,
	maaraysteksti,
	kaavamaarays.kuvaus AS m_kuvaus,
	kaavamaarays.linkki AS m_linkki,
	kaavamaarays.huomio AS m_huomio,
	teema.nimi AS teema
FROM
	yk_yleiskaava.kaavamaarays,
	yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
	yk_yleiskaava.kaavaobjekti_viiva AS kaavaobjekti,
	yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
	yk_kuvaustekniikka.teema
WHERE
	teema.nimi = 'yk049_k1' AND
	teema.id = kaavaobjekti_teema_yhteys.id_teema AND
	kaavaobjekti_teema_yhteys.id_kaavaobjekti_viiva = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_viiva = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id AND
	GeometryType(kaavaobjekti.geom) = 'MULTILINESTRING' AND
	kaavaobjekti.alkup_taulun_nimi = 'k1_pyorailyn_tavoiteverkko';
-- ddl-end --
ALTER VIEW yk_geoserver.yk2040_k1_pyora_tavoiteverk_viiva OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k1_strat_kehit_periaat_merk_alue | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k1_strat_kehit_periaat_merk_alue CASCADE;
CREATE VIEW yk_geoserver.yk049_k1_strat_kehit_periaat_merk_alue
AS 

SELECT
	kaavaobjekti.id,
	kaavaobjekti.nimi AS ko_nimi,
	geom AS geom,
	kaavaobjekti.voimaantulopvm AS ko_voimaantulopvm,
	kaavaobjekti.kumoamispvm AS ko_kumoamispvm,
	alkup_taulun_nimi,
	kayttotarkoitus_koodi,
	kayttotarkoitus_nimi,
	karttamerkinta,
	katuosoite,
	leveys_m,
	pituus_km,
	yhdrak_palvelualue,
	yhdrak_rakennusoikeus,
	mj_kp_laji,
	mj_kp_tyyppi,
	mj_kp_tyypintarkenne,
	mj_kp_ajoitus,
	mj_kp_tunnus,
	kem_vyohykeleveys_km,
	kem_kohde,
	puhd_saast_syy,
	puhd_toimenpiteet,
	puhd_saast_kuva,
	puhd_selvitystarve,
	referenssi,
	lisatieto,
	kaavamaarays.nimi AS m_nimi,
	kaavamaarays.lyhenne AS m_lyhenne,
	maaraysteksti,
	kaavamaarays.kuvaus AS m_kuvaus,
	kaavamaarays.linkki AS m_linkki,
	kaavamaarays.huomio AS m_huomio,
	teema.nimi AS teema
FROM
	yk_yleiskaava.kaavamaarays,
	yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
	yk_yleiskaava.kaavaobjekti_alue AS kaavaobjekti,
	yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
	yk_kuvaustekniikka.teema
WHERE
	teema.nimi = 'yk049_k1' AND
	teema.id = kaavaobjekti_teema_yhteys.id_teema AND
	kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id AND
	GeometryType(kaavaobjekti.geom) = 'MULTIPOLYGON' AND
	kaavaobjekti.alkup_taulun_nimi = 'k1_strategiset_kehittamisperiaatemerkinnat_polygon';
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k1_strat_kehit_periaat_merk_alue OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k1_yhdyskunta_kohteet_piste | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k1_yhdyskunta_kohteet_piste CASCADE;
CREATE VIEW yk_geoserver.yk049_k1_yhdyskunta_kohteet_piste
AS 

SELECT
	kaavaobjekti.id,
	kaavaobjekti.nimi AS ko_nimi,
	geom AS geom,
	kaavaobjekti.voimaantulopvm AS ko_voimaantulopvm,
	kaavaobjekti.kumoamispvm AS ko_kumoamispvm,
	alkup_taulun_nimi,
	kayttotarkoitus_koodi,
	kayttotarkoitus_nimi,
	karttamerkinta,
	katuosoite,
	leveys_m,
	pituus_km,
	yhdrak_palvelualue,
	yhdrak_rakennusoikeus,
	mj_kp_laji,
	mj_kp_tyyppi,
	mj_kp_tyypintarkenne,
	mj_kp_ajoitus,
	mj_kp_tunnus,
	kem_vyohykeleveys_km,
	kem_kohde,
	puhd_saast_syy,
	puhd_toimenpiteet,
	puhd_saast_kuva,
	puhd_selvitystarve,
	referenssi,
	lisatieto,
	kaavamaarays.nimi AS m_nimi,
	kaavamaarays.lyhenne AS m_lyhenne,
	maaraysteksti,
	kaavamaarays.kuvaus AS m_kuvaus,
	kaavamaarays.linkki AS m_linkki,
	kaavamaarays.huomio AS m_huomio,
	teema.nimi AS teema
FROM
	yk_yleiskaava.kaavamaarays,
	yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
	yk_yleiskaava.kaavaobjekti_piste AS kaavaobjekti,
	yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
	yk_kuvaustekniikka.teema
WHERE
	teema.nimi = 'yk049_k1' AND
	teema.id = kaavaobjekti_teema_yhteys.id_teema AND
	kaavaobjekti_teema_yhteys.id_kaavaobjekti_piste = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_piste = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id AND
	GeometryType(kaavaobjekti.geom) = 'MULTIPOINT';
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k1_yhdyskunta_kohteet_piste OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k2_kayttotark_alue | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k2_kayttotark_alue CASCADE;
CREATE VIEW yk_geoserver.yk049_k2_kayttotark_alue
AS 

SELECT
	kaavaobjekti.id,
	kaavaobjekti.nimi AS ko_nimi,
	geom AS geom,
	kaavaobjekti.voimaantulopvm AS ko_voimaantulopvm,
	kaavaobjekti.kumoamispvm AS ko_kumoamispvm,
	alkup_taulun_nimi,
	kayttotarkoitus_koodi,
	kayttotarkoitus_nimi,
	karttamerkinta,
	katuosoite,
	leveys_m,
	pituus_km,
	yhdrak_palvelualue,
	yhdrak_rakennusoikeus,
	mj_kp_laji,
	mj_kp_tyyppi,
	mj_kp_tyypintarkenne,
	mj_kp_ajoitus,
	mj_kp_tunnus,
	kem_vyohykeleveys_km,
	kem_kohde,
	puhd_saast_syy,
	puhd_toimenpiteet,
	puhd_saast_kuva,
	puhd_selvitystarve,
	referenssi,
	lisatieto,
	kaavamaarays.nimi AS m_nimi,
	kaavamaarays.lyhenne AS m_lyhenne,
	maaraysteksti,
	kaavamaarays.kuvaus AS m_kuvaus,
	kaavamaarays.linkki AS m_linkki,
	kaavamaarays.huomio AS m_huomio,
	teema.nimi AS teema,
	mitoitus.pinta_ala AS pinta_ala_m2
FROM
	yk_yleiskaava.kaavamaarays,
	yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
	yk_yleiskaava.kaavaobjekti_alue AS kaavaobjekti,
	yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
	yk_kuvaustekniikka.teema,
	yk_mitoitus_varanto.mitoitus
WHERE
	teema.nimi = 'yk049_k2' AND
	teema.id = kaavaobjekti_teema_yhteys.id_teema AND
	kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id AND
	GeometryType(kaavaobjekti.geom) = 'MULTIPOLYGON' AND
	kaavaobjekti.alkup_taulun_nimi = 'k2_kayttark_polygon' AND
	mitoitus.id_kaavaobjekti_alue = kaavaobjekti.id;
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k2_kayttotark_alue OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k2_kohteet_piste | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k2_kohteet_piste CASCADE;
CREATE VIEW yk_geoserver.yk049_k2_kohteet_piste
AS 

SELECT
	kaavaobjekti.id,
	kaavaobjekti.nimi AS ko_nimi,
	geom AS geom,
	kaavaobjekti.voimaantulopvm AS ko_voimaantulopvm,
	kaavaobjekti.kumoamispvm AS ko_kumoamispvm,
	alkup_taulun_nimi,
	kayttotarkoitus_koodi,
	kayttotarkoitus_nimi,
	karttamerkinta,
	katuosoite,
	leveys_m,
	pituus_km,
	yhdrak_palvelualue,
	yhdrak_rakennusoikeus,
	mj_kp_laji,
	mj_kp_tyyppi,
	mj_kp_tyypintarkenne,
	mj_kp_ajoitus,
	mj_kp_tunnus,
	kem_vyohykeleveys_km,
	kem_kohde,
	puhd_saast_syy,
	puhd_toimenpiteet,
	puhd_saast_kuva,
	puhd_selvitystarve,
	referenssi,
	lisatieto,
	kaavamaarays.nimi AS m_nimi,
	kaavamaarays.lyhenne AS m_lyhenne,
	maaraysteksti,
	kaavamaarays.kuvaus AS m_kuvaus,
	kaavamaarays.linkki AS m_linkki,
	kaavamaarays.huomio AS m_huomio,
	teema.nimi AS teema
FROM
	yk_yleiskaava.kaavamaarays,
	yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
	yk_yleiskaava.kaavaobjekti_piste AS kaavaobjekti,
	yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
	yk_kuvaustekniikka.teema
WHERE
	teema.nimi = 'yk049_k2' AND
	teema.id = kaavaobjekti_teema_yhteys.id_teema AND
	kaavaobjekti_teema_yhteys.id_kaavaobjekti_piste = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_piste = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id AND
	GeometryType(kaavaobjekti.geom) = 'MULTIPOINT';
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k2_kohteet_piste OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k2_osa_alue | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k2_osa_alue CASCADE;
CREATE VIEW yk_geoserver.yk049_k2_osa_alue
AS 

SELECT
	kaavaobjekti.id,
	kaavaobjekti.nimi AS ko_nimi,
	geom AS geom,
	kaavaobjekti.voimaantulopvm AS ko_voimaantulopvm,
	kaavaobjekti.kumoamispvm AS ko_kumoamispvm,
	alkup_taulun_nimi,
	kayttotarkoitus_koodi,
	kayttotarkoitus_nimi,
	karttamerkinta,
	katuosoite,
	leveys_m,
	pituus_km,
	yhdrak_palvelualue,
	yhdrak_rakennusoikeus,
	mj_kp_laji,
	mj_kp_tyyppi,
	mj_kp_tyypintarkenne,
	mj_kp_ajoitus,
	mj_kp_tunnus,
	kem_vyohykeleveys_km,
	kem_kohde,
	puhd_saast_syy,
	puhd_toimenpiteet,
	puhd_saast_kuva,
	puhd_selvitystarve,
	referenssi,
	lisatieto,
	kaavamaarays.nimi AS m_nimi,
	kaavamaarays.lyhenne AS m_lyhenne,
	maaraysteksti,
	kaavamaarays.kuvaus AS m_kuvaus,
	kaavamaarays.linkki AS m_linkki,
	kaavamaarays.huomio AS m_huomio,
	teema.nimi AS teema
FROM
	yk_yleiskaava.kaavamaarays,
	yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
	yk_yleiskaava.kaavaobjekti_alue AS kaavaobjekti,
	yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
	yk_kuvaustekniikka.teema
WHERE
	teema.nimi = 'yk049_k2' AND
	teema.id = kaavaobjekti_teema_yhteys.id_teema AND
	kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id AND
	GeometryType(kaavaobjekti.geom) = 'MULTIPOLYGON' AND
	kaavaobjekti.alkup_taulun_nimi = 'k2_osa_alueet_polygon';
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k2_osa_alue OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k2_yhteydet_polut_viiva | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k2_yhteydet_polut_viiva CASCADE;
CREATE VIEW yk_geoserver.yk049_k2_yhteydet_polut_viiva
AS 

SELECT
	kaavaobjekti.id,
	kaavaobjekti.nimi AS ko_nimi,
	geom AS geom,
	kaavaobjekti.voimaantulopvm AS ko_voimaantulopvm,
	kaavaobjekti.kumoamispvm AS ko_kumoamispvm,
	alkup_taulun_nimi,
	kayttotarkoitus_koodi,
	kayttotarkoitus_nimi,
	karttamerkinta,
	katuosoite,
	leveys_m,
	pituus_km,
	yhdrak_palvelualue,
	yhdrak_rakennusoikeus,
	mj_kp_laji,
	mj_kp_tyyppi,
	mj_kp_tyypintarkenne,
	mj_kp_ajoitus,
	mj_kp_tunnus,
	kem_vyohykeleveys_km,
	kem_kohde,
	puhd_saast_syy,
	puhd_toimenpiteet,
	puhd_saast_kuva,
	puhd_selvitystarve,
	referenssi,
	lisatieto,
	kaavamaarays.nimi AS m_nimi,
	kaavamaarays.lyhenne AS m_lyhenne,
	maaraysteksti,
	kaavamaarays.kuvaus AS m_kuvaus,
	kaavamaarays.linkki AS m_linkki,
	kaavamaarays.huomio AS m_huomio,
	teema.nimi AS teema
FROM
	yk_yleiskaava.kaavamaarays,
	yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
	yk_yleiskaava.kaavaobjekti_viiva AS kaavaobjekti,
	yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
	yk_kuvaustekniikka.teema
WHERE
	teema.nimi = 'yk049_k2' AND
	teema.id = kaavaobjekti_teema_yhteys.id_teema AND
	kaavaobjekti_teema_yhteys.id_kaavaobjekti_viiva = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_viiva = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id AND
	GeometryType(kaavaobjekti.geom) = 'MULTILINESTRING';
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k2_yhteydet_polut_viiva OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k3_arvo_alue | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k3_arvo_alue CASCADE;
CREATE VIEW yk_geoserver.yk049_k3_arvo_alue
AS 

SELECT
	kaavaobjekti.id,
	kaavaobjekti.nimi AS ko_nimi,
	geom AS geom,
	kaavaobjekti.voimaantulopvm AS ko_voimaantulopvm,
	kaavaobjekti.kumoamispvm AS ko_kumoamispvm,
	alkup_taulun_nimi,
	kayttotarkoitus_koodi,
	kayttotarkoitus_nimi,
	karttamerkinta,
	katuosoite,
	leveys_m,
	pituus_km,
	yhdrak_palvelualue,
	yhdrak_rakennusoikeus,
	mj_kp_laji,
	mj_kp_tyyppi,
	mj_kp_tyypintarkenne,
	mj_kp_ajoitus,
	mj_kp_tunnus,
	kem_vyohykeleveys_km,
	kem_kohde,
	puhd_saast_syy,
	puhd_toimenpiteet,
	puhd_saast_kuva,
	puhd_selvitystarve,
	referenssi,
	lisatieto,
	kaavamaarays.nimi AS m_nimi,
	kaavamaarays.lyhenne AS m_lyhenne,
	maaraysteksti,
	kaavamaarays.kuvaus AS m_kuvaus,
	kaavamaarays.linkki AS m_linkki,
	kaavamaarays.huomio AS m_huomio,
	teema.nimi AS teema,
	mitoitus.pinta_ala AS pinta_ala_m2
FROM
	yk_yleiskaava.kaavamaarays,
	yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
	yk_yleiskaava.kaavaobjekti_alue AS kaavaobjekti,
	yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
	yk_kuvaustekniikka.teema,
	yk_mitoitus_varanto.mitoitus
WHERE
	teema.nimi = 'yk049_k3' AND
	teema.id = kaavaobjekti_teema_yhteys.id_teema AND
	kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id AND
	GeometryType(kaavaobjekti.geom) = 'MULTIPOLYGON' AND
	mitoitus.id_kaavaobjekti_alue = kaavaobjekti.id;
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k3_arvo_alue OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k3_kohteet_piste | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k3_kohteet_piste CASCADE;
CREATE VIEW yk_geoserver.yk049_k3_kohteet_piste
AS 

SELECT
	kaavaobjekti.id,
	kaavaobjekti.nimi AS ko_nimi,
	geom AS geom,
	kaavaobjekti.voimaantulopvm AS ko_voimaantulopvm,
	kaavaobjekti.kumoamispvm AS ko_kumoamispvm,
	alkup_taulun_nimi,
	kayttotarkoitus_koodi,
	kayttotarkoitus_nimi,
	karttamerkinta,
	katuosoite,
	leveys_m,
	pituus_km,
	yhdrak_palvelualue,
	yhdrak_rakennusoikeus,
	mj_kp_laji,
	mj_kp_tyyppi,
	mj_kp_tyypintarkenne,
	mj_kp_ajoitus,
	mj_kp_tunnus,
	kem_vyohykeleveys_km,
	kem_kohde,
	puhd_saast_syy,
	puhd_toimenpiteet,
	puhd_saast_kuva,
	puhd_selvitystarve,
	referenssi,
	lisatieto,
	kaavamaarays.nimi AS m_nimi,
	kaavamaarays.lyhenne AS m_lyhenne,
	maaraysteksti,
	kaavamaarays.kuvaus AS m_kuvaus,
	kaavamaarays.linkki AS m_linkki,
	kaavamaarays.huomio AS m_huomio,
	teema.nimi AS teema,
	lahtoaineisto.linkitys_tyyppi,
	lahtoaineisto.linkki_data
FROM
	yk_yleiskaava.kaavamaarays,
	yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
	yk_yleiskaava.kaavaobjekti_piste AS kaavaobjekti,
	yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
	yk_kuvaustekniikka.teema,
	yk_prosessi.lahtoaineisto,
	yk_prosessi.lahtoaineisto_yleiskaava_yhteys
WHERE
	teema.nimi = 'yk049_k3' AND
	teema.id = kaavaobjekti_teema_yhteys.id_teema AND
	kaavaobjekti_teema_yhteys.id_kaavaobjekti_piste = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_piste = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id AND
	GeometryType(kaavaobjekti.geom) = 'MULTIPOINT' AND
	lahtoaineisto_yleiskaava_yhteys.id_kaavaobjekti_piste = kaavaobjekti.id AND
	lahtoaineisto_yleiskaava_yhteys.id_lahtoaineisto = lahtoaineisto.id;
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k3_kohteet_piste OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k4_alue | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k4_alue CASCADE;
CREATE VIEW yk_geoserver.yk049_k4_alue
AS 

SELECT
	kaavaobjekti.id,
	kaavaobjekti.nimi AS ko_nimi,
	geom AS geom,
	kaavaobjekti.voimaantulopvm AS ko_voimaantulopvm,
	kaavaobjekti.kumoamispvm AS ko_kumoamispvm,
	alkup_taulun_nimi,
	kayttotarkoitus_koodi,
	kayttotarkoitus_nimi,
	karttamerkinta,
	katuosoite,
	leveys_m,
	pituus_km,
	yhdrak_palvelualue,
	yhdrak_rakennusoikeus,
	mj_kp_laji,
	mj_kp_tyyppi,
	mj_kp_tyypintarkenne,
	mj_kp_ajoitus,
	mj_kp_tunnus,
	kem_vyohykeleveys_km,
	kem_kohde,
	puhd_saast_syy,
	puhd_toimenpiteet,
	puhd_saast_kuva,
	puhd_selvitystarve,
	referenssi,
	lisatieto,
	kaavamaarays.nimi AS m_nimi,
	kaavamaarays.lyhenne AS m_lyhenne,
	maaraysteksti,
	kaavamaarays.kuvaus AS m_kuvaus,
	kaavamaarays.linkki AS m_linkki,
	kaavamaarays.huomio AS m_huomio,
	teema.nimi AS teema,
	mitoitus.pinta_ala AS pinta_ala_m2
FROM
	yk_yleiskaava.kaavamaarays,
	yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
	yk_yleiskaava.kaavaobjekti_alue AS kaavaobjekti,
	yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
	yk_kuvaustekniikka.teema,
	yk_mitoitus_varanto.mitoitus
WHERE
	teema.nimi = 'yk049_k4' AND
	teema.id = kaavaobjekti_teema_yhteys.id_teema AND
	kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id AND
	GeometryType(kaavaobjekti.geom) = 'MULTIPOLYGON' AND
	mitoitus.id_kaavaobjekti_alue = kaavaobjekti.id;
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k4_alue OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k4_kohteet_piste | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k4_kohteet_piste CASCADE;
CREATE VIEW yk_geoserver.yk049_k4_kohteet_piste
AS 

SELECT
	kaavaobjekti.id,
	kaavaobjekti.nimi AS ko_nimi,
	geom AS geom,
	kaavaobjekti.voimaantulopvm AS ko_voimaantulopvm,
	kaavaobjekti.kumoamispvm AS ko_kumoamispvm,
	alkup_taulun_nimi,
	kayttotarkoitus_koodi,
	kayttotarkoitus_nimi,
	karttamerkinta,
	katuosoite,
	leveys_m,
	pituus_km,
	yhdrak_palvelualue,
	yhdrak_rakennusoikeus,
	mj_kp_laji,
	mj_kp_tyyppi,
	mj_kp_tyypintarkenne,
	mj_kp_ajoitus,
	mj_kp_tunnus,
	kem_vyohykeleveys_km,
	kem_kohde,
	puhd_saast_syy,
	puhd_toimenpiteet,
	puhd_saast_kuva,
	puhd_selvitystarve,
	referenssi,
	lisatieto,
	kaavamaarays.nimi AS m_nimi,
	kaavamaarays.lyhenne AS m_lyhenne,
	maaraysteksti,
	kaavamaarays.kuvaus AS m_kuvaus,
	kaavamaarays.linkki AS m_linkki,
	kaavamaarays.huomio AS m_huomio,
	teema.nimi AS teema
FROM
	yk_yleiskaava.kaavamaarays,
	yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
	yk_yleiskaava.kaavaobjekti_piste AS kaavaobjekti,
	yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
	yk_kuvaustekniikka.teema
WHERE
	teema.nimi = 'yk049_k4' AND
	teema.id = kaavaobjekti_teema_yhteys.id_teema AND
	kaavaobjekti_teema_yhteys.id_kaavaobjekti_piste = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_piste = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id AND
	GeometryType(kaavaobjekti.geom) = 'MULTIPOINT';
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k4_kohteet_piste OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k2_apugeometria_piste | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k2_apugeometria_piste CASCADE;
CREATE VIEW yk_geoserver.yk049_k2_apugeometria_piste
AS 

SELECT
	apugeometria_piste.id,
	geom,
	selitys,
	rotaatio,
	teema.nimi AS teema
FROM
	yk_kuvaustekniikka.apugeometria_piste,
	yk_kuvaustekniikka.teema
WHERE
	teema.nimi = 'yk049_k2' AND
	teema.id = apugeometria_piste.id_teema;
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k2_apugeometria_piste OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k2_apugeometria_viiva | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k2_apugeometria_viiva CASCADE;
CREATE VIEW yk_geoserver.yk049_k2_apugeometria_viiva
AS 

SELECT
	apugeometria_viiva.id,
	geom,
	selitys,
	rotaatio,
	teema.nimi AS teema
FROM
	yk_kuvaustekniikka.apugeometria_viiva,
	yk_kuvaustekniikka.teema
WHERE
	teema.nimi = 'yk049_k2' AND
	teema.id = apugeometria_viiva.id_teema;
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k2_apugeometria_viiva OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k2_apugeometria_alue | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k2_apugeometria_alue CASCADE;
CREATE VIEW yk_geoserver.yk049_k2_apugeometria_alue
AS 

SELECT
	apugeometria_alue.id,
	geom,
	selitys,
	rotaatio,
	teema.nimi AS teema
FROM
	yk_kuvaustekniikka.apugeometria_alue,
	yk_kuvaustekniikka.teema
WHERE
	teema.nimi = 'yk049_k2' AND
	teema.id = apugeometria_alue.id_teema;
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k2_apugeometria_alue OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k4_apugeometria_piste | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k4_apugeometria_piste CASCADE;
CREATE VIEW yk_geoserver.yk049_k4_apugeometria_piste
AS 

SELECT
	apugeometria_piste.id,
	geom,
	selitys,
	rotaatio,
	teema.nimi AS teema
FROM
	yk_kuvaustekniikka.apugeometria_piste,
	yk_kuvaustekniikka.teema
WHERE
	teema.nimi = 'yk049_k4' AND
	teema.id = apugeometria_piste.id_teema;
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k4_apugeometria_piste OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k4_apugeometria_viiva | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k4_apugeometria_viiva CASCADE;
CREATE VIEW yk_geoserver.yk049_k4_apugeometria_viiva
AS 

SELECT
	apugeometria_viiva.id,
	geom,
	selitys,
	rotaatio,
	teema.nimi AS teema
FROM
	yk_kuvaustekniikka.apugeometria_viiva,
	yk_kuvaustekniikka.teema
WHERE
	teema.nimi = 'yk049_k4' AND
	teema.id = apugeometria_viiva.id_teema;
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k4_apugeometria_viiva OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k4_apugeometria_alue | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k4_apugeometria_alue CASCADE;
CREATE VIEW yk_geoserver.yk049_k4_apugeometria_alue
AS 

SELECT
	apugeometria_alue.id,
	geom,
	selitys,
	rotaatio,
	teema.nimi AS teema
FROM
	yk_kuvaustekniikka.apugeometria_alue,
	yk_kuvaustekniikka.teema
WHERE
	teema.nimi = 'yk049_k4' AND
	teema.id = apugeometria_alue.id_teema;
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k4_apugeometria_alue OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k3_apugeometria_piste | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k3_apugeometria_piste CASCADE;
CREATE VIEW yk_geoserver.yk049_k3_apugeometria_piste
AS 

SELECT
	apugeometria_piste.id,
	geom,
	selitys,
	rotaatio,
	teema.nimi AS teema
FROM
	yk_kuvaustekniikka.apugeometria_piste,
	yk_kuvaustekniikka.teema
WHERE
	teema.nimi = 'yk049_k3' AND
	teema.id = apugeometria_piste.id_teema;
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k3_apugeometria_piste OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k3_apugeometria_viiva | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k3_apugeometria_viiva CASCADE;
CREATE VIEW yk_geoserver.yk049_k3_apugeometria_viiva
AS 

SELECT
	apugeometria_viiva.id,
	geom,
	selitys,
	rotaatio,
	teema.nimi AS teema
FROM
	yk_kuvaustekniikka.apugeometria_viiva,
	yk_kuvaustekniikka.teema
WHERE
	teema.nimi = 'yk049_k3' AND
	teema.id = apugeometria_viiva.id_teema;
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k3_apugeometria_viiva OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k3_apugeometria_alue | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k3_apugeometria_alue CASCADE;
CREATE VIEW yk_geoserver.yk049_k3_apugeometria_alue
AS 

SELECT
	apugeometria_alue.id,
	geom,
	selitys,
	rotaatio,
	teema.nimi AS teema
FROM
	yk_kuvaustekniikka.apugeometria_alue,
	yk_kuvaustekniikka.teema
WHERE
	teema.nimi = 'yk049_k3' AND
	teema.id = apugeometria_alue.id_teema;
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k3_apugeometria_alue OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k4_ojat_viiva | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k4_ojat_viiva CASCADE;
CREATE VIEW yk_geoserver.yk049_k4_ojat_viiva
AS 

SELECT
	kaavaobjekti.id,
	kaavaobjekti.nimi AS ko_nimi,
	geom AS geom,
	kaavaobjekti.voimaantulopvm AS ko_voimaantulopvm,
	kaavaobjekti.kumoamispvm AS ko_kumoamispvm,
	alkup_taulun_nimi,
	kayttotarkoitus_koodi,
	kayttotarkoitus_nimi,
	karttamerkinta,
	katuosoite,
	leveys_m,
	pituus_km,
	yhdrak_palvelualue,
	yhdrak_rakennusoikeus,
	mj_kp_laji,
	mj_kp_tyyppi,
	mj_kp_tyypintarkenne,
	mj_kp_ajoitus,
	mj_kp_tunnus,
	kem_vyohykeleveys_km,
	kem_kohde,
	puhd_saast_syy,
	puhd_toimenpiteet,
	puhd_saast_kuva,
	puhd_selvitystarve,
	referenssi,
	lisatieto,
	kaavamaarays.nimi AS m_nimi,
	kaavamaarays.lyhenne AS m_lyhenne,
	maaraysteksti,
	kaavamaarays.kuvaus AS m_kuvaus,
	kaavamaarays.linkki AS m_linkki,
	kaavamaarays.huomio AS m_huomio,
	teema.nimi AS teema
FROM
	yk_yleiskaava.kaavamaarays,
	yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
	yk_yleiskaava.kaavaobjekti_viiva AS kaavaobjekti,
	yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
	yk_kuvaustekniikka.teema
WHERE
	teema.nimi = 'yk049_k4' AND
	teema.id = kaavaobjekti_teema_yhteys.id_teema AND
	kaavaobjekti_teema_yhteys.id_kaavaobjekti_viiva = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_viiva = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id AND
	GeometryType(kaavaobjekti.geom) = 'MULTILINESTRING';
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k4_ojat_viiva OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k1_erityisominaisuus_alue | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k1_erityisominaisuus_alue CASCADE;
CREATE VIEW yk_geoserver.yk049_k1_erityisominaisuus_alue
AS 

SELECT
	kaavaobjekti.id,
	kaavaobjekti.nimi AS ko_nimi,
	geom AS geom,
	kaavaobjekti.voimaantulopvm AS ko_voimaantulopvm,
	kaavaobjekti.kumoamispvm AS ko_kumoamispvm,
	alkup_taulun_nimi,
	kayttotarkoitus_koodi,
	kayttotarkoitus_nimi,
	karttamerkinta,
	katuosoite,
	leveys_m,
	pituus_km,
	yhdrak_palvelualue,
	yhdrak_rakennusoikeus,
	mj_kp_laji,
	mj_kp_tyyppi,
	mj_kp_tyypintarkenne,
	mj_kp_ajoitus,
	mj_kp_tunnus,
	kem_vyohykeleveys_km,
	kem_kohde,
	puhd_saast_syy,
	puhd_toimenpiteet,
	puhd_saast_kuva,
	puhd_selvitystarve,
	referenssi,
	lisatieto,
	kaavamaarays.nimi AS m_nimi,
	kaavamaarays.lyhenne AS m_lyhenne,
	maaraysteksti,
	kaavamaarays.kuvaus AS m_kuvaus,
	kaavamaarays.linkki AS m_linkki,
	kaavamaarays.huomio AS m_huomio,
	teema.nimi AS teema
FROM
	yk_yleiskaava.kaavamaarays,
	yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
	yk_yleiskaava.kaavaobjekti_alue AS kaavaobjekti,
	yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
	yk_kuvaustekniikka.teema
WHERE
	teema.nimi = 'yk049_k1' AND
	teema.id = kaavaobjekti_teema_yhteys.id_teema AND
	kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue = kaavaobjekti.id AND
	kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays = kaavamaarays.id AND
	GeometryType(kaavaobjekti.geom) = 'MULTIPOLYGON' AND
	kaavaobjekti.alkup_taulun_nimi = 'k1_erityisominaisuus_polygon';
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k1_erityisominaisuus_alue OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k2_kaava_alue | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k2_kaava_alue CASCADE;
CREATE VIEW yk_geoserver.yk049_k2_kaava_alue
AS 

SELECT
	yleiskaava.id,
	yleiskaava.nimi AS yk_nimi,
	kaavan_ulkorajaus,
	vaihtoehtoinen_nimi AS yk_vaihtoehtoinen_nimi,
	yleiskaava.vireilletulopvm AS yk_vireilletulopvm,
	yleiskaava.voimaantulopvm AS yk_voimaantulopvm,
	yleiskaava.kumoamispvm AS yk_kumoamispvm,
	nro,
	yleismaarays.nimi AS ym_nimi,
	maaraysteksti,
	linkki,
	teema.nimi AS teema
FROM
	yk_yleiskaava.yleiskaava,
	yk_yleiskaava.yleismaarays,
	yk_kuvaustekniikka.teema,
	yk_kuvaustekniikka.yleismaarays_teema_yhteys
WHERE
	yleiskaava.nro = 'yk049' AND
	yleismaarays.id_yleiskaava = yleiskaava.id AND
	teema.nimi = 'yk049_k2' AND
	yleismaarays_teema_yhteys.id_teema = teema.id AND
	yleismaarays_teema_yhteys.id_yleismaarays = yleismaarays.id;
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k2_kaava_alue OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k3_kaava_alue | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k3_kaava_alue CASCADE;
CREATE VIEW yk_geoserver.yk049_k3_kaava_alue
AS 

SELECT
	yleiskaava.id,
	yleiskaava.nimi AS yk_nimi,
	kaavan_ulkorajaus,
	vaihtoehtoinen_nimi AS yk_vaihtoehtoinen_nimi,
	yleiskaava.vireilletulopvm AS yk_vireilletulopvm,
	yleiskaava.voimaantulopvm AS yk_voimaantulopvm,
	yleiskaava.kumoamispvm AS yk_kumoamispvm,
	nro,
	yleismaarays.nimi AS ym_nimi,
	maaraysteksti,
	linkki,
	teema.nimi AS teema
FROM
	yk_yleiskaava.yleiskaava,
	yk_yleiskaava.yleismaarays,
	yk_kuvaustekniikka.teema,
	yk_kuvaustekniikka.yleismaarays_teema_yhteys
WHERE
	yleiskaava.nro = 'yk049' AND
	yleismaarays.id_yleiskaava = yleiskaava.id AND
	teema.nimi = 'yk049_k3' AND
	yleismaarays_teema_yhteys.id_teema = teema.id AND
	yleismaarays_teema_yhteys.id_yleismaarays = yleismaarays.id;
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k3_kaava_alue OWNER TO postgres;
-- ddl-end --

-- object: yk_geoserver.yk049_k4_kaava_alue | type: VIEW --
-- DROP VIEW IF EXISTS yk_geoserver.yk049_k4_kaava_alue CASCADE;
CREATE VIEW yk_geoserver.yk049_k4_kaava_alue
AS 

SELECT
	yleiskaava.id,
	yleiskaava.nimi AS yk_nimi,
	kaavan_ulkorajaus,
	vaihtoehtoinen_nimi AS yk_vaihtoehtoinen_nimi,
	yleiskaava.vireilletulopvm AS yk_vireilletulopvm,
	yleiskaava.voimaantulopvm AS yk_voimaantulopvm,
	yleiskaava.kumoamispvm AS yk_kumoamispvm,
	nro,
	yleismaarays.nimi AS ym_nimi,
	maaraysteksti,
	linkki,
	teema.nimi AS teema
FROM
	yk_yleiskaava.yleiskaava,
	yk_yleiskaava.yleismaarays,
	yk_kuvaustekniikka.teema,
	yk_kuvaustekniikka.yleismaarays_teema_yhteys
WHERE
	yleiskaava.nro = 'yk049' AND
	yleismaarays.id_yleiskaava = yleiskaava.id AND
	teema.nimi = 'yk049_k4' AND
	yleismaarays_teema_yhteys.id_teema = teema.id AND
	yleismaarays_teema_yhteys.id_yleismaarays = yleismaarays.id;
-- ddl-end --
ALTER VIEW yk_geoserver.yk049_k4_kaava_alue OWNER TO postgres;
-- ddl-end --
