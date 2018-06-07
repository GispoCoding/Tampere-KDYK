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

-- object: yk_kaavamaaraykset | type: SCHEMA --
-- DROP SCHEMA IF EXISTS yk_kaavamaaraykset CASCADE;
CREATE SCHEMA yk_kaavamaaraykset;
-- ddl-end --
ALTER SCHEMA yk_kaavamaaraykset OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot | type: SCHEMA --
-- DROP SCHEMA IF EXISTS yk_koodiluettelot CASCADE;
CREATE SCHEMA yk_koodiluettelot;
-- ddl-end --
ALTER SCHEMA yk_koodiluettelot OWNER TO postgres;
-- ddl-end --

-- object: yk_suunnitteluparametrit | type: SCHEMA --
-- DROP SCHEMA IF EXISTS yk_suunnitteluparametrit CASCADE;
CREATE SCHEMA yk_suunnitteluparametrit;
-- ddl-end --
ALTER SCHEMA yk_suunnitteluparametrit OWNER TO postgres;
-- ddl-end --

-- object: yk_kuvaustekniikka | type: SCHEMA --
-- DROP SCHEMA IF EXISTS yk_kuvaustekniikka CASCADE;
CREATE SCHEMA yk_kuvaustekniikka;
-- ddl-end --
ALTER SCHEMA yk_kuvaustekniikka OWNER TO postgres;
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

-- object: yk_kaavoitus_yhteydet | type: SCHEMA --
-- DROP SCHEMA IF EXISTS yk_kaavoitus_yhteydet CASCADE;
CREATE SCHEMA yk_kaavoitus_yhteydet;
-- ddl-end --
ALTER SCHEMA yk_kaavoitus_yhteydet OWNER TO postgres;
-- ddl-end --

SET search_path TO pg_catalog,public,yk_yleiskaava,yk_kaavamaaraykset,yk_koodiluettelot,yk_suunnitteluparametrit,yk_kuvaustekniikka,yk_prosessi,yk_mitoitus_varanto,yk_metatiedot,yk_kaavoitus_yhteydet;
-- ddl-end --

-- object: yk_yleiskaava.kaavaobjekti | type: TABLE --
-- DROP TABLE IF EXISTS yk_yleiskaava.kaavaobjekti CASCADE;
CREATE TABLE yk_yleiskaava.kaavaobjekti(
	id uuid NOT NULL,
	geom geometry(GEOMETRYZ) NOT NULL,
	nimi varchar,
	hilucs_presence varchar,
	specific_presence varchar,
	muokkaaja varchar,
	voimaantulopvm date,
	kumoamispvm date,
	version_alkamispvm date,
	version_loppumispvm date,
	alueen_nro varchar,
	aluevarauskohde boolean,
	kohde_periytyy_muualta bool,
	mitoitustieto varchar,
	kansallinen_laillinen_sitovuus varchar,
	yleiskaava uuid,
	id_laillinen_sitovuus uuid,
	id_prosessin_vaihe uuid,
	id_kansallinen_prosessin_vaihe uuid,
	CONSTRAINT kaavaobjekti_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_yleiskaava.kaavaobjekti IS 'Presence of one or several HILUCS values in an area, indicated either as the percentage covered for each value or as the values listed in their order of importance. http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/ScopeObjectDetail.action?objectDetailId=10556';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti.mitoitustieto IS 'Dimensioning Indication Value - http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/ScopeObjectDetail.action;jsessionid=F05001FBEDB4246DD99D7D5C531E28A0?objectDetailId=10573';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti.kansallinen_laillinen_sitovuus IS 'INSPIRE - Legal nature of the land use regulation from a national perspective. On member state level the legal classification for plan regulations may be complex. A supplementary regulation may be principally "bindingOnlyForAuthorities" but according to national law this regulation have to be more specified to explain the specific degree of binding. (e.g. on state or regional planning level in Germany: principles of spatial planning, other spatial planning requirements or goals of spatial planning).';
-- ddl-end --
ALTER TABLE yk_yleiskaava.kaavaobjekti OWNER TO postgres;
-- ddl-end --

-- object: yk_yleiskaava.yleiskaava | type: TABLE --
-- DROP TABLE IF EXISTS yk_yleiskaava.yleiskaava CASCADE;
CREATE TABLE yk_yleiskaava.yleiskaava(
	id uuid NOT NULL,
	nimi varchar NOT NULL,
	kaavan_ulkorajaus geometry(MULTIPOLYGONZ) NOT NULL,
	vaihtoehtoinen_nimi varchar,
	vireilletulopvm date,
	voimaantulopvm date,
	kumoamispvm date,
	version_alkamispvm date,
	version_loppumispvm date,
	muokkaaja varchar,
	nro varchar,
	oikeusvaikutus bool,
	id_kaavan_taso uuid NOT NULL,
	id_kaavatyyppi uuid,
	id_prosessin_vaihe uuid,
	id_kansallinen_prosessin_vaihe uuid,
	CONSTRAINT yleiskaava_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.yleiskaava.version_alkamispvm IS 'INSPIRE';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.yleiskaava.nro IS 'yleiskaavan numero (esim. yk032)';
-- ddl-end --
ALTER TABLE yk_yleiskaava.yleiskaava OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.plan_type_name_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.plan_type_name_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.plan_type_name_tyyppi AS
 ENUM ();
-- ddl-end --
ALTER TYPE yk_koodiluettelot.plan_type_name_tyyppi OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.kaavatyyppi | type: TABLE --
-- DROP TABLE IF EXISTS yk_koodiluettelot.kaavatyyppi CASCADE;
CREATE TABLE yk_koodiluettelot.kaavatyyppi(
	id uuid NOT NULL,
	koodi yk_koodiluettelot.plan_type_name_tyyppi,
	kuvaus varchar,
	CONSTRAINT plan_type_name_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_koodiluettelot.kaavatyyppi IS 'Kaavatyypit siten kuin ne määritellään jäsenvaltioissa. Tässä koodiluettelossa hyväksytään mitkä tahansa tiedon tarjoajien määrittelemät arvot.';
-- ddl-end --
ALTER TABLE yk_koodiluettelot.kaavatyyppi OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.losp_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.losp_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.losp_tyyppi AS
 ENUM ('infra_local','infra_regional','local','national','other','regional','supra_local','supra_regional');
-- ddl-end --
ALTER TYPE yk_koodiluettelot.losp_tyyppi OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.kaavan_taso | type: TABLE --
-- DROP TABLE IF EXISTS yk_koodiluettelot.kaavan_taso CASCADE;
CREATE TABLE yk_koodiluettelot.kaavan_taso(
	id uuid NOT NULL,
	koodi yk_koodiluettelot.losp_tyyppi,
	kuvaus varchar,
	CONSTRAINT level_of_spatial_plan_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_koodiluettelot.kaavan_taso IS 'Kaavan aluehierarkia. http://inspire.ec.europa.eu/codelist/LevelOfSpatialPlanValue';
-- ddl-end --
ALTER TABLE yk_koodiluettelot.kaavan_taso OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.kansallinen_vaihe_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.kansallinen_vaihe_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.kansallinen_vaihe_tyyppi AS
 ENUM ('vireilla_ja_valmistelussa','keskeytetty','oas_nahtavilla','luonnos_nahtavilla','ehdotus_nahtavilla','tarkistettu_ehdotus_nahtavilla','hyvaksytty_ehdotus','hyvaksytty_ehdotus_josta_valitettu','voimaankuulutettu_osin_tai_kokonaan');
-- ddl-end --
ALTER TYPE yk_koodiluettelot.kansallinen_vaihe_tyyppi OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.kansallinen_prosessin_vaihe | type: TABLE --
-- DROP TABLE IF EXISTS yk_koodiluettelot.kansallinen_prosessin_vaihe CASCADE;
CREATE TABLE yk_koodiluettelot.kansallinen_prosessin_vaihe(
	id uuid NOT NULL,
	koodi yk_koodiluettelot.kansallinen_vaihe_tyyppi,
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
	id_kaavamaarays uuid,
	CONSTRAINT kaavadokumentti_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_yleiskaava.kaavadokumentti OWNER TO postgres;
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
	id_yleiskaava uuid,
	vain_suunnittelu boolean,
	id_kaavaobjekti uuid,
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

-- object: yk_kaavamaaraykset.yleismaarays | type: TABLE --
-- DROP TABLE IF EXISTS yk_kaavamaaraykset.yleismaarays CASCADE;
CREATE TABLE yk_kaavamaaraykset.yleismaarays(
	id uuid NOT NULL,
	nimi varchar,
	lyhenne varchar,
	kuvaus varchar,
	maarayskoodi varchar,
	diaari_nro varchar,
	voimaantulopvm date,
	kumoamispvm date,
	taso varchar,
	viite varchar,
	paivays date,
	linkki varchar,
	spesifinen_referenssi varchar,
	id_kaavamaarays uuid,
	CONSTRAINT yleismaarays_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN yk_kaavamaaraykset.yleismaarays.taso IS 'INSPIRE';
-- ddl-end --
COMMENT ON COLUMN yk_kaavamaaraykset.yleismaarays.viite IS 'INSPIRE';
-- ddl-end --
COMMENT ON COLUMN yk_kaavamaaraykset.yleismaarays.paivays IS 'INSPIRE';
-- ddl-end --
COMMENT ON COLUMN yk_kaavamaaraykset.yleismaarays.linkki IS 'INSPIRE';
-- ddl-end --
COMMENT ON COLUMN yk_kaavamaaraykset.yleismaarays.spesifinen_referenssi IS 'INSPIRE';
-- ddl-end --
ALTER TABLE yk_kaavamaaraykset.yleismaarays OWNER TO postgres;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_koodiluettelot.hilucs_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.hilucs_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.hilucs_tyyppi AS
 ENUM ();
-- ddl-end --
ALTER TYPE yk_koodiluettelot.hilucs_tyyppi OWNER TO postgres;
-- ddl-end --
COMMENT ON TYPE yk_koodiluettelot.hilucs_tyyppi IS 'Ks. kaikki arvot: http://inspire.ec.europa.eu/codelist/HILUCSValue/';
-- ddl-end --

-- object: yk_koodiluettelot.hsrcl_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.hsrcl_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.hsrcl_tyyppi AS
 ENUM ('after_zoning','agriculture','air_quality_management_zone','airport_activities','airport_easement','archeological_protection');
-- ddl-end --
ALTER TYPE yk_koodiluettelot.hsrcl_tyyppi OWNER TO postgres;
-- ddl-end --
COMMENT ON TYPE yk_koodiluettelot.hsrcl_tyyppi IS 'Ks. kaikki arvot: http://inspire.ec.europa.eu/codelist/SupplementaryRegulationValue';
-- ddl-end --

-- object: yk_koodiluettelot.kayttotarkoitus_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.kayttotarkoitus_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.kayttotarkoitus_tyyppi AS
 ENUM ('asuminen','keskustatoiminnot','palvelut','tyo_ja_tuotanto','virkistys','loma_asuminen','liikenne','erityisalue','suojelu','maa_ja_metsatalous','vesialueet');
-- ddl-end --
ALTER TYPE yk_koodiluettelot.kayttotarkoitus_tyyppi OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.kansallinen_hsrcl_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.kansallinen_hsrcl_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.kansallinen_hsrcl_tyyppi AS
 ENUM ();
-- ddl-end --
ALTER TYPE yk_koodiluettelot.kansallinen_hsrcl_tyyppi OWNER TO postgres;
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
	sidottu_kaavaobjekti uuid,
	sitova_kaavaobjekti uuid,
	CONSTRAINT sidonnaisuus_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_suunnitteluparametrit.sidonnaisuus OWNER TO postgres;
-- ddl-end --

-- object: yk_suunnitteluparametrit.sidottu_kaavaobjekti | type: TABLE --
-- DROP TABLE IF EXISTS yk_suunnitteluparametrit.sidottu_kaavaobjekti CASCADE;
CREATE TABLE yk_suunnitteluparametrit.sidottu_kaavaobjekti(
	id uuid NOT NULL,
	kaavaobjekti uuid,
	CONSTRAINT sidottu_kaavaobjekti_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_suunnitteluparametrit.sidottu_kaavaobjekti OWNER TO postgres;
-- ddl-end --

-- object: yk_suunnitteluparametrit.sitova_kaavaobjekti | type: TABLE --
-- DROP TABLE IF EXISTS yk_suunnitteluparametrit.sitova_kaavaobjekti CASCADE;
CREATE TABLE yk_suunnitteluparametrit.sitova_kaavaobjekti(
	id uuid NOT NULL,
	kaavaobjekti uuid,
	CONSTRAINT sitova_kaavaobjekti_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_suunnitteluparametrit.sitova_kaavaobjekti OWNER TO postgres;
-- ddl-end --

-- object: kaavaobjekti_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.sidottu_kaavaobjekti DROP CONSTRAINT IF EXISTS kaavaobjekti_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.sidottu_kaavaobjekti ADD CONSTRAINT kaavaobjekti_fk FOREIGN KEY (kaavaobjekti)
REFERENCES yk_yleiskaava.kaavaobjekti (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: sidottu_kaavaobjekti_uq | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.sidottu_kaavaobjekti DROP CONSTRAINT IF EXISTS sidottu_kaavaobjekti_uq CASCADE;
ALTER TABLE yk_suunnitteluparametrit.sidottu_kaavaobjekti ADD CONSTRAINT sidottu_kaavaobjekti_uq UNIQUE (kaavaobjekti);
-- ddl-end --

-- object: kaavaobjekti_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.sitova_kaavaobjekti DROP CONSTRAINT IF EXISTS kaavaobjekti_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.sitova_kaavaobjekti ADD CONSTRAINT kaavaobjekti_fk FOREIGN KEY (kaavaobjekti)
REFERENCES yk_yleiskaava.kaavaobjekti (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: sitova_kaavaobjekti_uq | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.sitova_kaavaobjekti DROP CONSTRAINT IF EXISTS sitova_kaavaobjekti_uq CASCADE;
ALTER TABLE yk_suunnitteluparametrit.sitova_kaavaobjekti ADD CONSTRAINT sitova_kaavaobjekti_uq UNIQUE (kaavaobjekti);
-- ddl-end --

-- object: sidottu_kaavaobjekti_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.sidonnaisuus DROP CONSTRAINT IF EXISTS sidottu_kaavaobjekti_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.sidonnaisuus ADD CONSTRAINT sidottu_kaavaobjekti_fk FOREIGN KEY (sidottu_kaavaobjekti)
REFERENCES yk_suunnitteluparametrit.sidottu_kaavaobjekti (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: sitova_kaavaobjekti_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.sidonnaisuus DROP CONSTRAINT IF EXISTS sitova_kaavaobjekti_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.sidonnaisuus ADD CONSTRAINT sitova_kaavaobjekti_fk FOREIGN KEY (sitova_kaavaobjekti)
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
	id_kaavaobjekti uuid,
	id_yleiskaava uuid,
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
	kaavaobjekti uuid,
	CONSTRAINT ei_sitova_tavoiteaika_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_suunnitteluparametrit.ei_sitova_tavoiteaika OWNER TO postgres;
-- ddl-end --

-- object: kaavaobjekti_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.ei_sitova_tavoiteaika DROP CONSTRAINT IF EXISTS kaavaobjekti_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.ei_sitova_tavoiteaika ADD CONSTRAINT kaavaobjekti_fk FOREIGN KEY (kaavaobjekti)
REFERENCES yk_yleiskaava.kaavaobjekti (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: ei_sitova_tavoiteaika_uq | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.ei_sitova_tavoiteaika DROP CONSTRAINT IF EXISTS ei_sitova_tavoiteaika_uq CASCADE;
ALTER TABLE yk_suunnitteluparametrit.ei_sitova_tavoiteaika ADD CONSTRAINT ei_sitova_tavoiteaika_uq UNIQUE (kaavaobjekti);
-- ddl-end --

-- object: yk_suunnitteluparametrit.tukes_vyohyke | type: TABLE --
-- DROP TABLE IF EXISTS yk_suunnitteluparametrit.tukes_vyohyke CASCADE;
CREATE TABLE yk_suunnitteluparametrit.tukes_vyohyke(
	id uuid NOT NULL,
	geom geometry(MULTIPOLYGONZ),
	nimi varchar,
	kuvaus varchar,
	yleiskaava uuid,
	id_lahtoaineisto_yleiskaava_linkki uuid,
	CONSTRAINT tukes_vyohyke_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_suunnitteluparametrit.tukes_vyohyke OWNER TO postgres;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.tukes_vyohyke DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.tukes_vyohyke ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_kuvaustekniikka.teema | type: TABLE --
-- DROP TABLE IF EXISTS yk_kuvaustekniikka.teema CASCADE;
CREATE TABLE yk_kuvaustekniikka.teema(
	id uuid,
	nimi varchar,
	kuvaus varchar,
	sld_url varchar,
	yleiskaava uuid
);
-- ddl-end --
ALTER TABLE yk_kuvaustekniikka.teema OWNER TO postgres;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kuvaustekniikka.teema DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_kuvaustekniikka.teema ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_prosessi.dokumentti_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_prosessi.dokumentti_tyyppi CASCADE;
CREATE TYPE yk_prosessi.dokumentti_tyyppi AS
 ENUM ('kaupunkiseudun_rakennesuunnitelma','ohjelma','oas','vat_tavoite','tiedotus','oas_palaute','kaavaluonnos_mielipide','kaavaehdotus_muistutus','kaavaehdotus_lausunto','kaavaehdotus_viranomaisneuvottelu','paatos','valitus_ho','valitus_kho','suunnitelma','selvitys','inventointi','visio','vaikutusarvio');
-- ddl-end --
ALTER TYPE yk_prosessi.dokumentti_tyyppi OWNER TO postgres;
-- ddl-end --

-- object: yk_prosessi.dokumentti | type: TABLE --
-- DROP TABLE IF EXISTS yk_prosessi.dokumentti CASCADE;
CREATE TABLE yk_prosessi.dokumentti(
	id uuid NOT NULL,
	tyyppi yk_prosessi.dokumentti_tyyppi,
	nimi varchar,
	kuvaus varchar,
	inspire_paatos bool,
	id_ulko_linkitys uuid,
	CONSTRAINT dokumentti_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_prosessi.dokumentti OWNER TO postgres;
-- ddl-end --

-- object: yk_prosessi.lahtoaineisto | type: TABLE --
-- DROP TABLE IF EXISTS yk_prosessi.lahtoaineisto CASCADE;
CREATE TABLE yk_prosessi.lahtoaineisto(
	id uuid NOT NULL,
	nimi varchar,
	kuvaus varchar,
	id_ulko_linkitys uuid,
	CONSTRAINT lahtoaineisto_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_prosessi.lahtoaineisto OWNER TO postgres;
-- ddl-end --

-- object: yk_prosessi.linkitys_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_prosessi.linkitys_tyyppi CASCADE;
CREATE TYPE yk_prosessi.linkitys_tyyppi AS
 ENUM ('selma','donna','mml','mil','maakuntien_liitto','tukes','museovirasto','syke');
-- ddl-end --
ALTER TYPE yk_prosessi.linkitys_tyyppi OWNER TO postgres;
-- ddl-end --

-- object: yk_prosessi.ulko_linkitys | type: TABLE --
-- DROP TABLE IF EXISTS yk_prosessi.ulko_linkitys CASCADE;
CREATE TABLE yk_prosessi.ulko_linkitys(
	id uuid NOT NULL,
	tyyppi yk_prosessi.linkitys_tyyppi,
	linkki_data varchar,
	CONSTRAINT linkitys_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_prosessi.ulko_linkitys IS 'linkkidata on koneluettavassa mutta ei välttämättä ihmisen luettavassa muodossa, jonka tarkka muoto riippuu erikseen tietomallia varten luotavasta spesifikaatiosta';
-- ddl-end --
ALTER TABLE yk_prosessi.ulko_linkitys OWNER TO postgres;
-- ddl-end --

-- object: ulko_linkitys_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.lahtoaineisto DROP CONSTRAINT IF EXISTS ulko_linkitys_fk CASCADE;
ALTER TABLE yk_prosessi.lahtoaineisto ADD CONSTRAINT ulko_linkitys_fk FOREIGN KEY (id_ulko_linkitys)
REFERENCES yk_prosessi.ulko_linkitys (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: lahtoaineisto_uq | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.lahtoaineisto DROP CONSTRAINT IF EXISTS lahtoaineisto_uq CASCADE;
ALTER TABLE yk_prosessi.lahtoaineisto ADD CONSTRAINT lahtoaineisto_uq UNIQUE (id_ulko_linkitys);
-- ddl-end --

-- object: ulko_linkitys_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.dokumentti DROP CONSTRAINT IF EXISTS ulko_linkitys_fk CASCADE;
ALTER TABLE yk_prosessi.dokumentti ADD CONSTRAINT ulko_linkitys_fk FOREIGN KEY (id_ulko_linkitys)
REFERENCES yk_prosessi.ulko_linkitys (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: dokumentti_uq | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.dokumentti DROP CONSTRAINT IF EXISTS dokumentti_uq CASCADE;
ALTER TABLE yk_prosessi.dokumentti ADD CONSTRAINT dokumentti_uq UNIQUE (id_ulko_linkitys);
-- ddl-end --

-- object: yk_prosessi.dokumentti_yleiskaava_linkki | type: TABLE --
-- DROP TABLE IF EXISTS yk_prosessi.dokumentti_yleiskaava_linkki CASCADE;
CREATE TABLE yk_prosessi.dokumentti_yleiskaava_linkki(
	id uuid NOT NULL,
	id_dokumentti uuid,
	id_yleiskaava uuid,
	id_liikennejarjestelma_suunnnitelma uuid,
	id_liittyva_kaava uuid,
	id_paatos uuid,
	CONSTRAINT dokumentti_yleiskaava_linkki_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_prosessi.dokumentti_yleiskaava_linkki OWNER TO postgres;
-- ddl-end --

-- object: yk_prosessi.lahtoaineisto_yleiskaava_linkki | type: TABLE --
-- DROP TABLE IF EXISTS yk_prosessi.lahtoaineisto_yleiskaava_linkki CASCADE;
CREATE TABLE yk_prosessi.lahtoaineisto_yleiskaava_linkki(
	id uuid NOT NULL,
	id_lahtoaineisto uuid,
	id_liikennejarjestelma_suunnnitelma uuid,
	id_yleiskaava uuid,
	id_kaavaobjekti uuid,
	id_virkistysalue uuid,
	CONSTRAINT dokumentti_yleiskaava_linkki_pk_1 PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_linkki OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.kansallinen_taydentava_kaavamerkinta_luokka | type: TABLE --
-- DROP TABLE IF EXISTS yk_koodiluettelot.kansallinen_taydentava_kaavamerkinta_luokka CASCADE;
CREATE TABLE yk_koodiluettelot.kansallinen_taydentava_kaavamerkinta_luokka(
	id uuid NOT NULL,
	koodi yk_koodiluettelot.kansallinen_hsrcl_tyyppi,
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
	koodi yk_koodiluettelot.hilucs_tyyppi,
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
	koodi yk_koodiluettelot.hsrcl_tyyppi,
	laajempi_koodiarvo varchar,
	CONSTRAINT "HSRCL_pk_1" PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_koodiluettelot.taydentava_kaavamerkinta_luokka IS 'http://inspire.ec.europa.eu/codelist/SupplementaryRegulationValue';
-- ddl-end --
ALTER TABLE yk_koodiluettelot.taydentava_kaavamerkinta_luokka OWNER TO postgres;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.taustakartta DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_yleiskaava.taustakartta ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.taustakartta DROP CONSTRAINT IF EXISTS kaavaobjekti_fk CASCADE;
ALTER TABLE yk_yleiskaava.taustakartta ADD CONSTRAINT kaavaobjekti_fk FOREIGN KEY (id_kaavaobjekti)
REFERENCES yk_yleiskaava.kaavaobjekti (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
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

-- object: yk_koodiluettelot.virkistysalue_tyyppi | type: TABLE --
-- DROP TABLE IF EXISTS yk_koodiluettelot.virkistysalue_tyyppi CASCADE;
CREATE TABLE yk_koodiluettelot.virkistysalue_tyyppi(
	id uuid NOT NULL,
	koodi yk_koodiluettelot.virkistys_tyyppi,
	kuvaus varchar,
	CONSTRAINT virkistysalue_tyyppi_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_koodiluettelot.virkistysalue_tyyppi OWNER TO postgres;
-- ddl-end --

-- object: yk_mitoitus_varanto.virkistysalue | type: TABLE --
-- DROP TABLE IF EXISTS yk_mitoitus_varanto.virkistysalue CASCADE;
CREATE TABLE yk_mitoitus_varanto.virkistysalue(
	id uuid NOT NULL,
	geom geometry(MULTIPOLYGONZ),
	nimi varchar,
	kuvaus varchar,
	id_virkistysalue_tyyppi uuid,
	id_kaavaobjekti uuid,
	CONSTRAINT virkistysalue_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_mitoitus_varanto.virkistysalue OWNER TO postgres;
-- ddl-end --

-- object: kaavaobjekti_fk | type: CONSTRAINT --
-- ALTER TABLE yk_mitoitus_varanto.virkistysalue DROP CONSTRAINT IF EXISTS kaavaobjekti_fk CASCADE;
ALTER TABLE yk_mitoitus_varanto.virkistysalue ADD CONSTRAINT kaavaobjekti_fk FOREIGN KEY (id_kaavaobjekti)
REFERENCES yk_yleiskaava.kaavaobjekti (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: virkistysalue_uq | type: CONSTRAINT --
-- ALTER TABLE yk_mitoitus_varanto.virkistysalue DROP CONSTRAINT IF EXISTS virkistysalue_uq CASCADE;
ALTER TABLE yk_mitoitus_varanto.virkistysalue ADD CONSTRAINT virkistysalue_uq UNIQUE (id_kaavaobjekti);
-- ddl-end --

-- object: virkistysalue_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_linkki DROP CONSTRAINT IF EXISTS virkistysalue_fk CASCADE;
ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_linkki ADD CONSTRAINT virkistysalue_fk FOREIGN KEY (id_virkistysalue)
REFERENCES yk_mitoitus_varanto.virkistysalue (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_linkki DROP CONSTRAINT IF EXISTS kaavaobjekti_fk CASCADE;
ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_linkki ADD CONSTRAINT kaavaobjekti_fk FOREIGN KEY (id_kaavaobjekti)
REFERENCES yk_yleiskaava.kaavaobjekti (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_linkki DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_linkki ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.dokumentti_yleiskaava_linkki DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_prosessi.dokumentti_yleiskaava_linkki ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
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

-- object: kaavatyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.yleiskaava DROP CONSTRAINT IF EXISTS kaavatyyppi_fk CASCADE;
ALTER TABLE yk_yleiskaava.yleiskaava ADD CONSTRAINT kaavatyyppi_fk FOREIGN KEY (id_kaavatyyppi)
REFERENCES yk_koodiluettelot.kaavatyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kansallinen_prosessin_vaihe_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti DROP CONSTRAINT IF EXISTS kansallinen_prosessin_vaihe_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti ADD CONSTRAINT kansallinen_prosessin_vaihe_fk FOREIGN KEY (id_kansallinen_prosessin_vaihe)
REFERENCES yk_koodiluettelot.kansallinen_prosessin_vaihe (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.mittakaava DROP CONSTRAINT IF EXISTS kaavaobjekti_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.mittakaava ADD CONSTRAINT kaavaobjekti_fk FOREIGN KEY (id_kaavaobjekti)
REFERENCES yk_yleiskaava.kaavaobjekti (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.mittakaava DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.mittakaava ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_mitoitus_varanto.seuranta_lahtodata_linkki | type: TABLE --
-- DROP TABLE IF EXISTS yk_mitoitus_varanto.seuranta_lahtodata_linkki CASCADE;
CREATE TABLE yk_mitoitus_varanto.seuranta_lahtodata_linkki(
	id uuid NOT NULL,
	kaavioiden_sijaintpisteet_id bigint,
	seuranta_alueet_kartalla_id integer,
	seuranta_alueet_ulkorajaus_id integer,
	ruudukko_id character varying,
	seuranta_alueet_laskenta integer,
	id_kaavaobjekti uuid,
	CONSTRAINT seuranta_lahtodata_linkki_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_mitoitus_varanto.seuranta_lahtodata_linkki IS 'Yhdistää kaavaobjektin seuranta-järjestelmän tietokannan taulujen rivit vastaaviin kaavaobjekteihin';
-- ddl-end --
ALTER TABLE yk_mitoitus_varanto.seuranta_lahtodata_linkki OWNER TO postgres;
-- ddl-end --

-- object: kaavaobjekti_fk | type: CONSTRAINT --
-- ALTER TABLE yk_mitoitus_varanto.seuranta_lahtodata_linkki DROP CONSTRAINT IF EXISTS kaavaobjekti_fk CASCADE;
ALTER TABLE yk_mitoitus_varanto.seuranta_lahtodata_linkki ADD CONSTRAINT kaavaobjekti_fk FOREIGN KEY (id_kaavaobjekti)
REFERENCES yk_yleiskaava.kaavaobjekti (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_mitoitus_varanto.seuranta_maa_ala_linkki | type: TABLE --
-- DROP TABLE IF EXISTS yk_mitoitus_varanto.seuranta_maa_ala_linkki CASCADE;
CREATE TABLE yk_mitoitus_varanto.seuranta_maa_ala_linkki(
	id uuid NOT NULL,
	ak_kaavatilanne_tamperedbsta_id integer,
	kaavioiden_sijaintipisteet_id bigint,
	rakennusalueet_alueina_oraclesta_id integer,
	ruudukko_seuranta_alueille_id character varying,
	seuranta_alueet_kartalla_id integer,
	seuranta_alueet_laskenta_id integer,
	ruudukko_id character varying,
	id_kaavaobjekti uuid,
	CONSTRAINT seuranta_lahtodata_linkki_pk_5 PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_mitoitus_varanto.seuranta_maa_ala_linkki IS 'Yhdistää kaavaobjektin seuranta-järjestelmän tietokannan taulujen rivit vastaaviin kaavaobjekteihin';
-- ddl-end --
ALTER TABLE yk_mitoitus_varanto.seuranta_maa_ala_linkki OWNER TO postgres;
-- ddl-end --

-- object: yk_mitoitus_varanto.seuranta_vaesto_linkki | type: TABLE --
-- DROP TABLE IF EXISTS yk_mitoitus_varanto.seuranta_vaesto_linkki CASCADE;
CREATE TABLE yk_mitoitus_varanto.seuranta_vaesto_linkki(
	id uuid NOT NULL,
	ak_kaavatyot_oraclesta_id integer,
	ohjeelliset_tontit_oraclesta_id integer,
	rekisteritontit_oraclesta_id integer,
	ruudukko_id character varying,
	ruudukko_seuranta_alueille_id character varying,
	tontinjakotontit_oraclesta_id integer,
	vaesto_oraclesta_id smallint,
	seuranta_alueet_kartalla_id integer,
	seuranta_alueet_laskenta_id integer,
	vaesto_poikkileikkaus_id integer,
	yleiskaavan_hyvaksytty_varanto_oraclesta_id integer,
	yleiskaavan_vireilla_oleva_varanto_oraclesta_id integer,
	id_kaavaobjekti uuid,
	CONSTRAINT seuranta_lahtodata_linkki_pk_4 PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_mitoitus_varanto.seuranta_vaesto_linkki IS 'Yhdistää kaavaobjektin seuranta-järjestelmän tietokannan taulujen rivit vastaaviin kaavaobjekteihin';
-- ddl-end --
ALTER TABLE yk_mitoitus_varanto.seuranta_vaesto_linkki OWNER TO postgres;
-- ddl-end --

-- object: yk_mitoitus_varanto.seuranta_poikkileikkaukset_linkki | type: TABLE --
-- DROP TABLE IF EXISTS yk_mitoitus_varanto.seuranta_poikkileikkaukset_linkki CASCADE;
CREATE TABLE yk_mitoitus_varanto.seuranta_poikkileikkaukset_linkki(
	id uuid NOT NULL,
	lahipalvelut_ruudukko_21022018_id character varying,
	lahipalvelut_seuranta_alueet_laskenta_21022018_id integer,
	maa_ala_ruudukko_11012018_id character varying,
	maa_ala_ruudukko_21022018_id character varying,
	maa_ala_seuranta_alueet_laskenta_11012018_id integer,
	maa_ala_seuranta_alueet_laskenta_21022018_id integer,
	vaesto_ruudukko_11012018_id character varying,
	vaesto_ruudukko_21022018_id character varying,
	vaesto_ruudukko_25102017_id character varying,
	vaesto_seuranta_alueet_laskenta_11012018_id integer,
	vaesto_seuranta_alueet_laskenta_21022018_id integer,
	vaesto_seuranta_alueet_laskenta_25102017_id integer,
	varanto_rakentaminen_ruudukko_11012018_id character varying,
	varanto_rakentaminen_ruudukko_01112017_id character varying,
	varanto_rakentaminen_ruudukko_21022018_id character varying,
	varanto_rakentaminen_ruudukko_26102017_id character varying,
	varanto_rakentaminen_seuranta_alueet_laskenta_01112017_id integer,
	varanto_rakentaminen_seuranta_alueet_laskenta_11012018_id integer,
	varanto_rakentaminen_seuranta_alueet_laskenta_21022018_id integer,
	varanto_rakentaminen_seuranta_alueet_laskenta_26102017_id integer,
	id_kaavaobjekti uuid,
	CONSTRAINT seuranta_lahtodata_linkki_pk_3 PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_mitoitus_varanto.seuranta_poikkileikkaukset_linkki IS 'Yhdistää kaavaobjektin seuranta-järjestelmän tietokannan taulujen rivit vastaaviin kaavaobjekteihin';
-- ddl-end --
ALTER TABLE yk_mitoitus_varanto.seuranta_poikkileikkaukset_linkki OWNER TO postgres;
-- ddl-end --

-- object: yk_mitoitus_varanto.seuranta_varanto_rakentaminen_linkki | type: TABLE --
-- DROP TABLE IF EXISTS yk_mitoitus_varanto.seuranta_varanto_rakentaminen_linkki CASCADE;
CREATE TABLE yk_mitoitus_varanto.seuranta_varanto_rakentaminen_linkki(
	id uuid NOT NULL,
	ak_kaavatyot_oraclesta_id integer,
	ohjeelliset_tontit_oraclesta_id integer,
	rakennukset_alueina_oraclesta_id integer,
	ruudukko_id character varying,
	rekisteritontit_oraclesta_id integer,
	tontinjakotontit_oraclesta_id integer,
	yleiskaavan_hyvaksytty_varanto_oraclesta_id integer,
	ruudukko_seuranta_alueilla_id character varying,
	seuranta_alueet_kartalla_id integer,
	yleiskaavan_vireilla_oleva_varanto_oraclesta_id integer,
	seuranta_alueet_laskenta_id integer,
	id_kaavaobjekti uuid,
	CONSTRAINT seuranta_lahtodata_linkki_pk_2 PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_mitoitus_varanto.seuranta_varanto_rakentaminen_linkki IS 'Yhdistää kaavaobjektin seuranta-järjestelmän tietokannan taulujen rivit vastaaviin kaavaobjekteihin';
-- ddl-end --
ALTER TABLE yk_mitoitus_varanto.seuranta_varanto_rakentaminen_linkki OWNER TO postgres;
-- ddl-end --

-- object: yk_mitoitus_varanto.seuranta_lahipalvelut_linkki | type: TABLE --
-- DROP TABLE IF EXISTS yk_mitoitus_varanto.seuranta_lahipalvelut_linkki CASCADE;
CREATE TABLE yk_mitoitus_varanto.seuranta_lahipalvelut_linkki(
	id uuid NOT NULL,
	kirjastot_oraclesta_id integer,
	koulut_orcalesta_id integer,
	neuvolat_oraclesta_id integer,
	paivakodit_oraclesta_id integer,
	ruudukko_id character varying,
	yksityiset_laakariasemat_id bigint,
	ruudukko_seuranta_alueilla character varying,
	seuranta_alueet_kartalla_id integer,
	seuranta_alueet_laskenta_id integer,
	terveysasemat_oraclesta_id integer,
	tk_toimipaikat_syksy2015_old integer,
	tk_toimipaikat_testi_old_id integer,
	yleiset_alueet_iriksesta_id integer,
	toimipaikkarekisteri_id integer,
	id_kaavaobjekti uuid,
	CONSTRAINT seuranta_lahtodata_linkki_pk_1 PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_mitoitus_varanto.seuranta_lahipalvelut_linkki IS 'Yhdistää kaavaobjektin seuranta-järjestelmän tietokannan taulujen rivit vastaaviin kaavaobjekteihin';
-- ddl-end --
ALTER TABLE yk_mitoitus_varanto.seuranta_lahipalvelut_linkki OWNER TO postgres;
-- ddl-end --

-- object: kaavaobjekti_fk | type: CONSTRAINT --
-- ALTER TABLE yk_mitoitus_varanto.seuranta_maa_ala_linkki DROP CONSTRAINT IF EXISTS kaavaobjekti_fk CASCADE;
ALTER TABLE yk_mitoitus_varanto.seuranta_maa_ala_linkki ADD CONSTRAINT kaavaobjekti_fk FOREIGN KEY (id_kaavaobjekti)
REFERENCES yk_yleiskaava.kaavaobjekti (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_fk | type: CONSTRAINT --
-- ALTER TABLE yk_mitoitus_varanto.seuranta_vaesto_linkki DROP CONSTRAINT IF EXISTS kaavaobjekti_fk CASCADE;
ALTER TABLE yk_mitoitus_varanto.seuranta_vaesto_linkki ADD CONSTRAINT kaavaobjekti_fk FOREIGN KEY (id_kaavaobjekti)
REFERENCES yk_yleiskaava.kaavaobjekti (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_fk | type: CONSTRAINT --
-- ALTER TABLE yk_mitoitus_varanto.seuranta_poikkileikkaukset_linkki DROP CONSTRAINT IF EXISTS kaavaobjekti_fk CASCADE;
ALTER TABLE yk_mitoitus_varanto.seuranta_poikkileikkaukset_linkki ADD CONSTRAINT kaavaobjekti_fk FOREIGN KEY (id_kaavaobjekti)
REFERENCES yk_yleiskaava.kaavaobjekti (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_fk | type: CONSTRAINT --
-- ALTER TABLE yk_mitoitus_varanto.seuranta_varanto_rakentaminen_linkki DROP CONSTRAINT IF EXISTS kaavaobjekti_fk CASCADE;
ALTER TABLE yk_mitoitus_varanto.seuranta_varanto_rakentaminen_linkki ADD CONSTRAINT kaavaobjekti_fk FOREIGN KEY (id_kaavaobjekti)
REFERENCES yk_yleiskaava.kaavaobjekti (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_fk | type: CONSTRAINT --
-- ALTER TABLE yk_mitoitus_varanto.seuranta_lahipalvelut_linkki DROP CONSTRAINT IF EXISTS kaavaobjekti_fk CASCADE;
ALTER TABLE yk_mitoitus_varanto.seuranta_lahipalvelut_linkki ADD CONSTRAINT kaavaobjekti_fk FOREIGN KEY (id_kaavaobjekti)
REFERENCES yk_yleiskaava.kaavaobjekti (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_kaavoitus_yhteydet.liikennejarjestelma_suunnnitelma | type: TABLE --
-- DROP TABLE IF EXISTS yk_kaavoitus_yhteydet.liikennejarjestelma_suunnnitelma CASCADE;
CREATE TABLE yk_kaavoitus_yhteydet.liikennejarjestelma_suunnnitelma(
	id uuid NOT NULL,
	nro varchar NOT NULL,
	id_yleiskaava uuid,
	CONSTRAINT liikenne_jarjestelma_suunnnitelma_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_kaavoitus_yhteydet.liikennejarjestelma_suunnnitelma OWNER TO postgres;
-- ddl-end --

-- object: liikennejarjestelma_suunnnitelma_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.dokumentti_yleiskaava_linkki DROP CONSTRAINT IF EXISTS liikennejarjestelma_suunnnitelma_fk CASCADE;
ALTER TABLE yk_prosessi.dokumentti_yleiskaava_linkki ADD CONSTRAINT liikennejarjestelma_suunnnitelma_fk FOREIGN KEY (id_liikennejarjestelma_suunnnitelma)
REFERENCES yk_kaavoitus_yhteydet.liikennejarjestelma_suunnnitelma (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: liikennejarjestelma_suunnnitelma_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_linkki DROP CONSTRAINT IF EXISTS liikennejarjestelma_suunnnitelma_fk CASCADE;
ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_linkki ADD CONSTRAINT liikennejarjestelma_suunnnitelma_fk FOREIGN KEY (id_liikennejarjestelma_suunnnitelma)
REFERENCES yk_kaavoitus_yhteydet.liikennejarjestelma_suunnnitelma (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_kaavoitus_yhteydet.liittyva_kaava | type: TABLE --
-- DROP TABLE IF EXISTS yk_kaavoitus_yhteydet.liittyva_kaava CASCADE;
CREATE TABLE yk_kaavoitus_yhteydet.liittyva_kaava(
	id uuid NOT NULL,
	nro varchar NOT NULL,
	id_kaavatyyppi uuid,
	id_kaavan_taso uuid,
	CONSTRAINT kaava_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_kaavoitus_yhteydet.liittyva_kaava OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.kaava_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.kaava_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.kaava_tyyppi AS
 ENUM ('maakuntakaava','yleiskaava','asemakaava','osayleiskaava','rantayleiskaava','muu');
-- ddl-end --
ALTER TYPE yk_koodiluettelot.kaava_tyyppi OWNER TO postgres;
-- ddl-end --

-- object: kaavan_taso_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kaavoitus_yhteydet.liittyva_kaava DROP CONSTRAINT IF EXISTS kaavan_taso_fk CASCADE;
ALTER TABLE yk_kaavoitus_yhteydet.liittyva_kaava ADD CONSTRAINT kaavan_taso_fk FOREIGN KEY (id_kaavan_taso)
REFERENCES yk_koodiluettelot.kaavan_taso (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_suunnitteluparametrit.suhde_maan_tasoon | type: TABLE --
-- DROP TABLE IF EXISTS yk_suunnitteluparametrit.suhde_maan_tasoon CASCADE;
CREATE TABLE yk_suunnitteluparametrit.suhde_maan_tasoon(
	id uuid,
	taso smallint,
	id_kaavaobjekti uuid
);
-- ddl-end --
COMMENT ON COLUMN yk_suunnitteluparametrit.suhde_maan_tasoon.taso IS 'maan alla < 0, maantasolla = 0, maan päällä > 0, ei määritelty = null';
-- ddl-end --
ALTER TABLE yk_suunnitteluparametrit.suhde_maan_tasoon OWNER TO postgres;
-- ddl-end --

-- object: kaavaobjekti_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.suhde_maan_tasoon DROP CONSTRAINT IF EXISTS kaavaobjekti_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.suhde_maan_tasoon ADD CONSTRAINT kaavaobjekti_fk FOREIGN KEY (id_kaavaobjekti)
REFERENCES yk_yleiskaava.kaavaobjekti (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: suhde_maan_tasoon_uq | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.suhde_maan_tasoon DROP CONSTRAINT IF EXISTS suhde_maan_tasoon_uq CASCADE;
ALTER TABLE yk_suunnitteluparametrit.suhde_maan_tasoon ADD CONSTRAINT suhde_maan_tasoon_uq UNIQUE (id_kaavaobjekti);
-- ddl-end --

-- object: liittyva_kaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.dokumentti_yleiskaava_linkki DROP CONSTRAINT IF EXISTS liittyva_kaava_fk CASCADE;
ALTER TABLE yk_prosessi.dokumentti_yleiskaava_linkki ADD CONSTRAINT liittyva_kaava_fk FOREIGN KEY (id_liittyva_kaava)
REFERENCES yk_kaavoitus_yhteydet.liittyva_kaava (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kaavoitus_yhteydet.liikennejarjestelma_suunnnitelma DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_kaavoitus_yhteydet.liikennejarjestelma_suunnnitelma ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: virkistysalue_tyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE yk_mitoitus_varanto.virkistysalue DROP CONSTRAINT IF EXISTS virkistysalue_tyyppi_fk CASCADE;
ALTER TABLE yk_mitoitus_varanto.virkistysalue ADD CONSTRAINT virkistysalue_tyyppi_fk FOREIGN KEY (id_virkistysalue_tyyppi)
REFERENCES yk_koodiluettelot.virkistysalue_tyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: lahtoaineisto_yleiskaava_linkki_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.tukes_vyohyke DROP CONSTRAINT IF EXISTS lahtoaineisto_yleiskaava_linkki_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.tukes_vyohyke ADD CONSTRAINT lahtoaineisto_yleiskaava_linkki_fk FOREIGN KEY (id_lahtoaineisto_yleiskaava_linkki)
REFERENCES yk_prosessi.lahtoaineisto_yleiskaava_linkki (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: lahtoaineisto_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_linkki DROP CONSTRAINT IF EXISTS lahtoaineisto_fk CASCADE;
ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_linkki ADD CONSTRAINT lahtoaineisto_fk FOREIGN KEY (id_lahtoaineisto)
REFERENCES yk_prosessi.lahtoaineisto (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: dokumentti_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.dokumentti_yleiskaava_linkki DROP CONSTRAINT IF EXISTS dokumentti_fk CASCADE;
ALTER TABLE yk_prosessi.dokumentti_yleiskaava_linkki ADD CONSTRAINT dokumentti_fk FOREIGN KEY (id_dokumentti)
REFERENCES yk_prosessi.dokumentti (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_koodiluettelot.regulation_nature_vaiue_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.regulation_nature_vaiue_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.regulation_nature_vaiue_tyyppi AS
 ENUM ();
-- ddl-end --
ALTER TYPE yk_koodiluettelot.regulation_nature_vaiue_tyyppi OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.laillinen_sitovuus | type: TABLE --
-- DROP TABLE IF EXISTS yk_koodiluettelot.laillinen_sitovuus CASCADE;
CREATE TABLE yk_koodiluettelot.laillinen_sitovuus(
	id uuid NOT NULL,
	nimi yk_koodiluettelot.regulation_nature_vaiue_tyyppi,
	CONSTRAINT laillinen_sitovuus_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_koodiluettelot.laillinen_sitovuus IS 'Kaavamääräysten laillinen sitovuus. http://inspire.ec.europa.eu/codelist/RegulationNatureValue';
-- ddl-end --
ALTER TABLE yk_koodiluettelot.laillinen_sitovuus OWNER TO postgres;
-- ddl-end --

-- object: kaavatyyppi_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kaavoitus_yhteydet.liittyva_kaava DROP CONSTRAINT IF EXISTS kaavatyyppi_fk CASCADE;
ALTER TABLE yk_kaavoitus_yhteydet.liittyva_kaava ADD CONSTRAINT kaavatyyppi_fk FOREIGN KEY (id_kaavatyyppi)
REFERENCES yk_koodiluettelot.kaavatyyppi (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_koodiluettelot.process_step_general_value_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.process_step_general_value_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.process_step_general_value_tyyppi AS
 ENUM ();
-- ddl-end --
ALTER TYPE yk_koodiluettelot.process_step_general_value_tyyppi OWNER TO postgres;
-- ddl-end --
COMMENT ON TYPE yk_koodiluettelot.process_step_general_value_tyyppi IS 'Kaavaprosessin yleispiirteinen vaihe, jossa kaava on. http://inspire.ec.europa.eu/codelist/ProcessStepGeneralValue';
-- ddl-end --

-- object: yk_koodiluettelot.prosessin_vaihe | type: TABLE --
-- DROP TABLE IF EXISTS yk_koodiluettelot.prosessin_vaihe CASCADE;
CREATE TABLE yk_koodiluettelot.prosessin_vaihe(
	id uuid NOT NULL,
	nimi yk_koodiluettelot.process_step_general_value_tyyppi,
	CONSTRAINT prosessin_vaihe_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_koodiluettelot.prosessin_vaihe IS 'Kaavaprosessin yleispiirteinen vaihe, jossa kaava on. http://inspire.ec.europa.eu/codelist/ProcessStepGeneralValue';
-- ddl-end --
ALTER TABLE yk_koodiluettelot.prosessin_vaihe OWNER TO postgres;
-- ddl-end --

-- object: laillinen_sitovuus_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti DROP CONSTRAINT IF EXISTS laillinen_sitovuus_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti ADD CONSTRAINT laillinen_sitovuus_fk FOREIGN KEY (id_laillinen_sitovuus)
REFERENCES yk_koodiluettelot.laillinen_sitovuus (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: prosessin_vaihe_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti DROP CONSTRAINT IF EXISTS prosessin_vaihe_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti ADD CONSTRAINT prosessin_vaihe_fk FOREIGN KEY (id_prosessin_vaihe)
REFERENCES yk_koodiluettelot.prosessin_vaihe (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: prosessin_vaihe_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.yleiskaava DROP CONSTRAINT IF EXISTS prosessin_vaihe_fk CASCADE;
ALTER TABLE yk_yleiskaava.yleiskaava ADD CONSTRAINT prosessin_vaihe_fk FOREIGN KEY (id_prosessin_vaihe)
REFERENCES yk_koodiluettelot.prosessin_vaihe (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_yleiskaava.paatos | type: TABLE --
-- DROP TABLE IF EXISTS yk_yleiskaava.paatos CASCADE;
CREATE TABLE yk_yleiskaava.paatos(
	id uuid NOT NULL,
	paatospvm date,
	paatos_referenssi varchar,
	id_yleiskaava uuid,
	CONSTRAINT paatos_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_yleiskaava.paatos IS 'Ordinance - Reference to administrative ordinance. Ordinance is a regulation/rule that is adopted by an authority that is legally mandated to take such ordinance. http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/ScopeObjectDetail.action;jsessionid=F05001FBEDB4246DD99D7D5C531E28A0?objectDetailId=10561';
-- ddl-end --
ALTER TABLE yk_yleiskaava.paatos OWNER TO postgres;
-- ddl-end --

-- object: paatos_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.dokumentti_yleiskaava_linkki DROP CONSTRAINT IF EXISTS paatos_fk CASCADE;
ALTER TABLE yk_prosessi.dokumentti_yleiskaava_linkki ADD CONSTRAINT paatos_fk FOREIGN KEY (id_paatos)
REFERENCES yk_yleiskaava.paatos (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.paatos DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_yleiskaava.paatos ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_kaavamaaraykset.kaavamaarays | type: TABLE --
-- DROP TABLE IF EXISTS yk_kaavamaaraykset.kaavamaarays CASCADE;
CREATE TABLE yk_kaavamaaraykset.kaavamaarays(
	id uuid NOT NULL,
	maaraysteksti varchar,
	id_yleiskaava uuid,
	id_kaavaobjekti uuid,
	CONSTRAINT virallinen_dokumentaatio_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_kaavamaaraykset.kaavamaarays IS 'http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/SearchObjectSelection.action?search=Official+Documentation';
-- ddl-end --
COMMENT ON COLUMN yk_kaavamaaraykset.kaavamaarays.id IS 'http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/SearchObjectSelection.action?search=Official+Documentation';
-- ddl-end --
ALTER TABLE yk_kaavamaaraykset.kaavamaarays OWNER TO postgres;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kaavamaaraykset.kaavamaarays DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_kaavamaaraykset.kaavamaarays ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavamaarays_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavadokumentti DROP CONSTRAINT IF EXISTS kaavamaarays_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavadokumentti ADD CONSTRAINT kaavamaarays_fk FOREIGN KEY (id_kaavamaarays)
REFERENCES yk_kaavamaaraykset.kaavamaarays (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavamaarays_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kaavamaaraykset.yleismaarays DROP CONSTRAINT IF EXISTS kaavamaarays_fk CASCADE;
ALTER TABLE yk_kaavamaaraykset.yleismaarays ADD CONSTRAINT kaavamaarays_fk FOREIGN KEY (id_kaavamaarays)
REFERENCES yk_kaavamaaraykset.kaavamaarays (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_kaavamaaraykset.kaavaobjektia_koskeva_maarays | type: TABLE --
-- DROP TABLE IF EXISTS yk_kaavamaaraykset.kaavaobjektia_koskeva_maarays CASCADE;
CREATE TABLE yk_kaavamaaraykset.kaavaobjektia_koskeva_maarays(
	id uuid NOT NULL,
	nimi varchar,
	lyhenne varchar,
	kuvaus varchar,
	maarayskoodi varchar,
	diaari_nro varchar,
	voimaantulopvm date,
	kumoamispvm date,
	taso varchar,
	viite varchar,
	paivays date,
	linkki varchar,
	spesifinen_referenssi varchar,
	id_kaavamaarays uuid,
	CONSTRAINT yleismaarays_pk_1 PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN yk_kaavamaaraykset.kaavaobjektia_koskeva_maarays.taso IS 'INSPIRE';
-- ddl-end --
COMMENT ON COLUMN yk_kaavamaaraykset.kaavaobjektia_koskeva_maarays.viite IS 'INSPIRE';
-- ddl-end --
COMMENT ON COLUMN yk_kaavamaaraykset.kaavaobjektia_koskeva_maarays.paivays IS 'INSPIRE';
-- ddl-end --
COMMENT ON COLUMN yk_kaavamaaraykset.kaavaobjektia_koskeva_maarays.linkki IS 'INSPIRE';
-- ddl-end --
COMMENT ON COLUMN yk_kaavamaaraykset.kaavaobjektia_koskeva_maarays.spesifinen_referenssi IS 'INSPIRE';
-- ddl-end --
ALTER TABLE yk_kaavamaaraykset.kaavaobjektia_koskeva_maarays OWNER TO postgres;
-- ddl-end --

-- object: kaavamaarays_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kaavamaaraykset.kaavaobjektia_koskeva_maarays DROP CONSTRAINT IF EXISTS kaavamaarays_fk CASCADE;
ALTER TABLE yk_kaavamaaraykset.kaavaobjektia_koskeva_maarays ADD CONSTRAINT kaavamaarays_fk FOREIGN KEY (id_kaavamaarays)
REFERENCES yk_kaavamaaraykset.kaavamaarays (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kaavamaaraykset.kaavamaarays DROP CONSTRAINT IF EXISTS kaavaobjekti_fk CASCADE;
ALTER TABLE yk_kaavamaaraykset.kaavamaarays ADD CONSTRAINT kaavaobjekti_fk FOREIGN KEY (id_kaavaobjekti)
REFERENCES yk_yleiskaava.kaavaobjekti (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_koodiluettelot.kansallinen_hilucs_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.kansallinen_hilucs_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.kansallinen_hilucs_tyyppi AS
 ENUM ();
-- ddl-end --
ALTER TYPE yk_koodiluettelot.kansallinen_hilucs_tyyppi OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.kansallinen_kaavakohde_luokka | type: TABLE --
-- DROP TABLE IF EXISTS yk_koodiluettelot.kansallinen_kaavakohde_luokka CASCADE;
CREATE TABLE yk_koodiluettelot.kansallinen_kaavakohde_luokka(
	id uuid NOT NULL,
	koodi yk_koodiluettelot.kansallinen_hsrcl_tyyppi,
	laajempi_koodiarvo varchar,
	CONSTRAINT kansallinen_kaavakohde_luokka_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_koodiluettelot.kansallinen_kaavakohde_luokka OWNER TO postgres;
-- ddl-end --

-- object: yk_yleiskaava.kaavakohde | type: TABLE --
-- DROP TABLE IF EXISTS yk_yleiskaava.kaavakohde CASCADE;
CREATE TABLE yk_yleiskaava.kaavakohde(
	id uuid NOT NULL,
	id_kaavakohde_luokka uuid,
	id_kaavaobjekti uuid,
	CONSTRAINT kaavakohde_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_yleiskaava.kaavakohde OWNER TO postgres;
-- ddl-end --

-- object: kaavakohde_luokka_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavakohde DROP CONSTRAINT IF EXISTS kaavakohde_luokka_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavakohde ADD CONSTRAINT kaavakohde_luokka_fk FOREIGN KEY (id_kaavakohde_luokka)
REFERENCES yk_koodiluettelot.kaavakohde_luokka (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavakohde DROP CONSTRAINT IF EXISTS kaavaobjekti_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavakohde ADD CONSTRAINT kaavaobjekti_fk FOREIGN KEY (id_kaavaobjekti)
REFERENCES yk_yleiskaava.kaavaobjekti (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_yleiskaava.kansallinen_kaavakohde | type: TABLE --
-- DROP TABLE IF EXISTS yk_yleiskaava.kansallinen_kaavakohde CASCADE;
CREATE TABLE yk_yleiskaava.kansallinen_kaavakohde(
	id uuid NOT NULL,
	id_kansallinen_kaavakohde_luokka uuid,
	id_kaavaobjekti uuid,
	CONSTRAINT kansallinen_kaavakohde_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_yleiskaava.kansallinen_kaavakohde OWNER TO postgres;
-- ddl-end --

-- object: kansallinen_kaavakohde_luokka_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kansallinen_kaavakohde DROP CONSTRAINT IF EXISTS kansallinen_kaavakohde_luokka_fk CASCADE;
ALTER TABLE yk_yleiskaava.kansallinen_kaavakohde ADD CONSTRAINT kansallinen_kaavakohde_luokka_fk FOREIGN KEY (id_kansallinen_kaavakohde_luokka)
REFERENCES yk_koodiluettelot.kansallinen_kaavakohde_luokka (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kansallinen_kaavakohde DROP CONSTRAINT IF EXISTS kaavaobjekti_fk CASCADE;
ALTER TABLE yk_yleiskaava.kansallinen_kaavakohde ADD CONSTRAINT kaavaobjekti_fk FOREIGN KEY (id_kaavaobjekti)
REFERENCES yk_yleiskaava.kaavaobjekti (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_yleiskaava.kansallinen_taydentava_kaavamerkinta | type: TABLE --
-- DROP TABLE IF EXISTS yk_yleiskaava.kansallinen_taydentava_kaavamerkinta CASCADE;
CREATE TABLE yk_yleiskaava.kansallinen_taydentava_kaavamerkinta(
	id uuid NOT NULL,
	id_kansallinen_taydentava_kaavamerkinta_luokka uuid,
	id_kaavaobjekti uuid,
	CONSTRAINT kaavakohde_pk_2 PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_yleiskaava.kansallinen_taydentava_kaavamerkinta OWNER TO postgres;
-- ddl-end --

-- object: kansallinen_taydentava_kaavamerkinta_luokka_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kansallinen_taydentava_kaavamerkinta DROP CONSTRAINT IF EXISTS kansallinen_taydentava_kaavamerkinta_luokka_fk CASCADE;
ALTER TABLE yk_yleiskaava.kansallinen_taydentava_kaavamerkinta ADD CONSTRAINT kansallinen_taydentava_kaavamerkinta_luokka_fk FOREIGN KEY (id_kansallinen_taydentava_kaavamerkinta_luokka)
REFERENCES yk_koodiluettelot.kansallinen_taydentava_kaavamerkinta_luokka (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kansallinen_taydentava_kaavamerkinta DROP CONSTRAINT IF EXISTS kaavaobjekti_fk CASCADE;
ALTER TABLE yk_yleiskaava.kansallinen_taydentava_kaavamerkinta ADD CONSTRAINT kaavaobjekti_fk FOREIGN KEY (id_kaavaobjekti)
REFERENCES yk_yleiskaava.kaavaobjekti (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_yleiskaava.taydentava_kaavamerkinta | type: TABLE --
-- DROP TABLE IF EXISTS yk_yleiskaava.taydentava_kaavamerkinta CASCADE;
CREATE TABLE yk_yleiskaava.taydentava_kaavamerkinta(
	id uuid NOT NULL,
	id_taydentava_kaavamerkinta_luokka uuid,
	id_kaavaobjekti uuid,
	CONSTRAINT kaavakohde_pk_1 PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_yleiskaava.taydentava_kaavamerkinta OWNER TO postgres;
-- ddl-end --

-- object: taydentava_kaavamerkinta_luokka_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.taydentava_kaavamerkinta DROP CONSTRAINT IF EXISTS taydentava_kaavamerkinta_luokka_fk CASCADE;
ALTER TABLE yk_yleiskaava.taydentava_kaavamerkinta ADD CONSTRAINT taydentava_kaavamerkinta_luokka_fk FOREIGN KEY (id_taydentava_kaavamerkinta_luokka)
REFERENCES yk_koodiluettelot.taydentava_kaavamerkinta_luokka (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.taydentava_kaavamerkinta DROP CONSTRAINT IF EXISTS kaavaobjekti_fk CASCADE;
ALTER TABLE yk_yleiskaava.taydentava_kaavamerkinta ADD CONSTRAINT kaavaobjekti_fk FOREIGN KEY (id_kaavaobjekti)
REFERENCES yk_yleiskaava.kaavaobjekti (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --


