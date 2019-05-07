-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.1
-- PostgreSQL version: 9.4
-- Project Site: pgmodeler.io
-- Model Author: ---

SET check_function_bodies = false;
-- ddl-end --


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: avoin_yleiskaava | type: DATABASE --
-- -- DROP DATABASE IF EXISTS avoin_yleiskaava;
-- CREATE DATABASE avoin_yleiskaava;
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

-- object: postgis | type: EXTENSION --
-- DROP EXTENSION IF EXISTS postgis CASCADE;
--CREATE EXTENSION postgis;
-- ddl-end --

-- object: yk_koodiluettelot.kansallinen_kaava_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.kansallinen_kaava_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.kansallinen_kaava_tyyppi AS
 ENUM ('2_yleiskaava','2_1_yleiskaava','2_2_vaiheyleiskaava','2_3_osayleiskaava','2_4_kuntien_yhteinen_yleiskaava');
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
 ENUM ('paikallinen','kunnallinen');
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
 ENUM ('1_aloitusvaihe','1_1_suunnitteluvaihe','1_2_vireille_tullut','2_valmisteluvaihe','2_1_luonnos','3_ehdotusvaihe','3_1_ehdotus','3_2_tarkistettu_ehdotus','4_hyvaksymisvaihe','4_1_hyvaksytty','4_2_oikeuskehotuksen_alainen','4_3_valituksen_alainen','5_voimaantulo','5_1_voimassa','5_2_osittain_voimassa','5_3_lainvoimainen','6_kumoaminen','6_1_kumottu','7_raukeaminen','7_1_rauennut');
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

-- object: yk_koodiluettelot.aluevaraus_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.aluevaraus_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.aluevaraus_tyyppi AS
 ENUM ('primary production','agriculture','commercial agricultural production','farming infrastructure','agricultural production for own consumption','forestry','forestry based on short rotation','forestry based on intermediate or long rotation','forestry based on continuous cover','mining and quarrying','mining of energy producing materials','mining of metal ores','other mining and quarrying','aquaculture and fishing','aquaculture','professional fishing','other primary production','hunting','management of migratory animals','picking of natural products','secondary production','raw industry','manufacturing of textile products','manufacturing of wood and wood based products','manufacturing of pulp paper and paper products','mfg. of coke refined petroleum products and nuclear fuel','manufacturing of chemicals chemical products man made fibers','manufacturing of basic metals and fabricate metals','manufacturing of non-metallic mineral products','manufacturing of rubber plastic products','manufacturing of other raw materials','heavy end product industry','manufacturing of machinery','manufacturing of vehicles and transport equipment','manufacturing of other heavy end products','light end product industry','manufacturing of food beverages and tobacco products','manufacturing of clothes and leather','publishing and printing','manufacturing of electrical and optical equipment','manufacturing of other light end products','energy production','nuclear based energy production','fossil fuel based energy production','biomass based energy production','renewable energy production','other industry','tertiary production','commercial services','WHSL retail trade repair of vehicles personal HH goods','real estate services','accommodation and food services','other commercial services','financial professional and information services','financial and insurance services','professional technical and scientific services','information and communication services','administrative and support services','other financial professional and information services','community services','public administration defence and social security services','educational services','health and social services','religious services','other community services','cultural entertainment and recreational services','cultural services','entertainment services','sports infrastructure','open air recreational areas','other recreational services','other services','transport networks logistics and utilities','transport networks','road transport','railway transport','air transport','water transport','other transport network','logistical and storage services','utilities','electricity gas and thermal power distribution services','water and sewage infrastructure','waste treatment','other utilities','residential use','permanent residential use','residential use with other compatible uses','other residential use','other uses','transitional areas','abandoned areas','natural areas not in other economic use','land areas not in other economic use','water areas not in other economic use','areas where any use allowed','areas without any specified planned use','not known use');
-- ddl-end --
ALTER TYPE yk_koodiluettelot.aluevaraus_tyyppi OWNER TO postgres;
-- ddl-end --
COMMENT ON TYPE yk_koodiluettelot.aluevaraus_tyyppi IS 'Ks. kaikki arvot: http://inspire.ec.europa.eu/codelist/HILUCSValue/';
-- ddl-end --

-- object: yk_koodiluettelot.muu_kaavakohde_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.muu_kaavakohde_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.muu_kaavakohde_tyyppi AS
 ENUM ('impact on environment','noise management zone','noise protection area','emission control area','air quality management zone','renewable energy area','nature protection','ecological corridor','biodiversity reservoir','protected wooded area','protected urban periurban agricultural or natural area','protected wetland','plant health protection zone','other nature protection area','climate protection','water protection','designated waters','nitrate vulnerable zone','sensitive area','bathing waters','drinking water protection area','forest management area','other impact on environment','risk exposure','flood risks','area exposed to flood risk','flood risk management zone','industrial risk','lead','restricted zones around contaminated sites','brownfield land','exclusion area around seveso sites','mining','erosion','other risk exposure','heritage protection','natural heritage protection','biodiversity protection','geodiversity protection','landscape area protection','built heritage protection','archeological protection','other heritage protection','general interest','public easement','airport easement','railroad easement','utility easement','rain water easement','sanitary sewer easement','electrical power line easement','telephone line easement','radio electrical easement','fuel gas pipe easement','beach access','conservation easement','historic preservation easement','other public easement','other easement','other reserved areas serving general interest','land property right','usable building area','area reserved for pre empting parcels','area reserved for restructuring parcels','reconstruction areas','stand by land resources','other land property right','regulations on buildings','building line','boundary line','spatial design','secondary structure area','collective facility','building height regulation','building density regulation','minimum housing size','other regulations on buildings','local regional state development policies','settlement structure','central places','basic','lower order centre','middle order centre','high order centre','axes','settlement axes','supralocal axes','assignment of functions','housing','commerce industry','services','tourism','agriculture','forestry','business park','technopole','harbor activities','airport activities','spatial order categories','rural area','rural development pole','city and outer conurbation area','urban area','metropolitan area','functional urban area','peri urban areas','polycentric spatial structure','eurocorridor or pan european corridor','spatial development projects','other settlement structure development policies','open space structure','forest','recreation','green belt','green break','raw materials','prospecting and mining permit area','area for dumping of waste','recultivation','water','other open space structures','coastal zone management area','infrastructure','network','road','rail road','water infrastructure','other network infrastructure','regulated fairway at sea or large inland water','supply','disposal','communication','other infrastructure','urban reshaping and development area','urban renewal','urban regeneration and revitalisation','urban rehabilitation and restoration','commercial development area','after zoning','specific area','derelict area','parking obligation area','demolition provisions areas','energy saving area','ruling deferring','study plan request','social health choices','composition of local residential population','publicly subsidised housing area','regulated activities','restricted activities','permitted activities','forbidden activities','suitable activities','other supplementary regulation');
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
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_alue_taydentava uuid,
	CONSTRAINT sidottu_kaavaobjekti_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_suunnitteluparametrit.sidottu_kaavaobjekti OWNER TO postgres;
-- ddl-end --

-- object: yk_suunnitteluparametrit.sitova_kaavaobjekti | type: TABLE --
-- DROP TABLE IF EXISTS yk_suunnitteluparametrit.sitova_kaavaobjekti CASCADE;
CREATE TABLE yk_suunnitteluparametrit.sitova_kaavaobjekti(
	id uuid NOT NULL,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_alue_taydentava uuid,
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
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_alue_taydentava uuid,
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
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	id_kaavaobjekti_alue_taydentava uuid,
	id_kaavaobjekti_alue uuid,
	CONSTRAINT ei_sitova_tavoiteaika_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_suunnitteluparametrit.ei_sitova_tavoiteaika OWNER TO postgres;
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

-- object: yk_yleiskaava.yleiskaava | type: TABLE --
-- DROP TABLE IF EXISTS yk_yleiskaava.yleiskaava CASCADE;
CREATE TABLE yk_yleiskaava.yleiskaava(
	id uuid NOT NULL,
	muokkaaja varchar,
	vireilletulopvm date,
	kaavaaloitus_hyvaksymispvm date,
	kaavaaloitus_nahtavillepvm date,
	kaavaluonnos_hyvaksymispvm date,
	kaavaluonnos_nahtavillepvm date,
	kaavaehdotus_hyvaksymispvm date,
	kaavaehdotus_nahtavillepvm date,
	kaavatarkistettuehdotus_hyvaksymispvm date,
	kaavatarkistettuehdotus_nahtavillepvm date,
	hyvaksymispvm date,
	voimaantulopvm date,
	lainvoimapvm date,
	kumoamispvm date,
	keskeytyspvm date,
	version_alkamispvm date DEFAULT current_date,
	version_loppumispvm date,
	nimi varchar NOT NULL,
	nro varchar,
	kaavan_ulkorajaus geometry(MULTIPOLYGONZ, 3878),
	kuntakoodi numeric(3,0),
	karttamerkinta_url varchar,
	id_kaavan_taso uuid NOT NULL,
	id_kansallinen_prosessin_vaihe uuid,
	id_kansallinen_kaavatyyppi uuid,
	id_prosessin_vaihe uuid,
	id_kaavoitusprosessin_tila uuid,
	CONSTRAINT yleiskaava_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.yleiskaava.version_alkamispvm IS 'INSPIRE';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.yleiskaava.nro IS 'yleiskaavan numero (esim. yk032)';
-- ddl-end --
ALTER TABLE yk_yleiskaava.yleiskaava OWNER TO postgres;
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
	id_yleiskaava uuid,
	id_dokumentti uuid,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_alue_taydentava uuid,
	CONSTRAINT dokumentti_yleiskaava_linkki_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_prosessi.dokumentti_yleiskaava_yhteys OWNER TO postgres;
-- ddl-end --

-- object: yk_prosessi.lahtoaineisto_yleiskaava_yhteys | type: TABLE --
-- DROP TABLE IF EXISTS yk_prosessi.lahtoaineisto_yleiskaava_yhteys CASCADE;
CREATE TABLE yk_prosessi.lahtoaineisto_yleiskaava_yhteys(
	id uuid NOT NULL,
	id_yleiskaava uuid,
	id_lahtoaineisto uuid,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_alue_taydentava uuid,
	CONSTRAINT dokumentti_yleiskaava_linkki_pk_1 PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_yhteys OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.kansallinen_taydentava_kaavamerkinta_luokka | type: TABLE --
-- DROP TABLE IF EXISTS yk_koodiluettelot.kansallinen_taydentava_kaavamerkinta_luokka CASCADE;
CREATE TABLE yk_koodiluettelot.kansallinen_taydentava_kaavamerkinta_luokka(
	id uuid NOT NULL,
	tunniste varchar,
	nimi varchar,
	kuvaus varchar,
	laajempi_koodiarvo varchar,
	CONSTRAINT maankaytto_tyyppi_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN yk_koodiluettelot.kansallinen_taydentava_kaavamerkinta_luokka.tunniste IS 'esim. AP, TY-1';
-- ddl-end --
ALTER TABLE yk_koodiluettelot.kansallinen_taydentava_kaavamerkinta_luokka OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.kaavakohde_luokka | type: TABLE --
-- DROP TABLE IF EXISTS yk_koodiluettelot.kaavakohde_luokka CASCADE;
CREATE TABLE yk_koodiluettelot.kaavakohde_luokka(
	id uuid NOT NULL,
	tunniste varchar,
	nimi varchar,
	kuvaus varchar,
	laajempi_koodiarvo varchar,
	CONSTRAINT "HSRCL_pk_2" PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_koodiluettelot.kaavakohde_luokka IS 'http://inspire.ec.europa.eu/codelist/HILUCSValue/';
-- ddl-end --
ALTER TABLE yk_koodiluettelot.kaavakohde_luokka OWNER TO postgres;
-- ddl-end --

-- object: yk_koodiluettelot.taydentava_kaavamerkinta_luokka | type: TABLE --
-- DROP TABLE IF EXISTS yk_koodiluettelot.taydentava_kaavamerkinta_luokka CASCADE;
CREATE TABLE yk_koodiluettelot.taydentava_kaavamerkinta_luokka(
	id uuid NOT NULL,
	tunniste varchar,
	nimi varchar,
	kuvaus varchar,
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

-- object: yk_koodiluettelot.virkistys_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.virkistys_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.virkistys_tyyppi AS
 ENUM ('kaupunkipuisto','lahivirkistys','maisema_luonnonhoito_alue','urheilu_virkistyspalvelu_alue','muu');
-- ddl-end --
ALTER TYPE yk_koodiluettelot.virkistys_tyyppi OWNER TO postgres;
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

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.mittakaava DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.mittakaava ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_prosessi.liikennejarjestelmasuunnitelma | type: TABLE --
-- DROP TABLE IF EXISTS yk_prosessi.liikennejarjestelmasuunnitelma CASCADE;
CREATE TABLE yk_prosessi.liikennejarjestelmasuunnitelma(
	id uuid NOT NULL,
	nimi varchar,
	nro varchar,
	linkki_data varchar,
	linkitys_tyyppi yk_prosessi.linkitys_tyyppi,
	id_yleiskaava uuid,
	CONSTRAINT liikenne_jarjestelma_suunnnitelma_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_prosessi.liikennejarjestelmasuunnitelma OWNER TO postgres;
-- ddl-end --

-- object: yk_prosessi.liittyva_kaava | type: TABLE --
-- DROP TABLE IF EXISTS yk_prosessi.liittyva_kaava CASCADE;
CREATE TABLE yk_prosessi.liittyva_kaava(
	id uuid NOT NULL,
	nimi varchar,
	nro varchar NOT NULL,
	linkki_data varchar,
	id_kaavan_taso uuid,
	linkitys_tyyppi yk_prosessi.linkitys_tyyppi,
	id_kansallinen_kaavatyyppi uuid,
	id_yleiskaava uuid,
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
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	id_kaavaobjekti_alue_taydentava uuid,
	id_kaavaobjekti_alue uuid
);
-- ddl-end --
COMMENT ON COLUMN yk_suunnitteluparametrit.suhde_maan_tasoon.taso IS 'maan alla < 0, maantasolla = 0, maan päällä > 0, ei määritelty = null';
-- ddl-end --
ALTER TABLE yk_suunnitteluparametrit.suhde_maan_tasoon OWNER TO postgres;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.liikennejarjestelmasuunnitelma DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_prosessi.liikennejarjestelmasuunnitelma ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
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

-- object: prosessin_vaihe_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.yleiskaava DROP CONSTRAINT IF EXISTS prosessin_vaihe_fk CASCADE;
ALTER TABLE yk_yleiskaava.yleiskaava ADD CONSTRAINT prosessin_vaihe_fk FOREIGN KEY (id_prosessin_vaihe)
REFERENCES yk_koodiluettelot.prosessin_vaihe (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
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
	tunniste varchar,
	nimi varchar,
	kuvaus varchar,
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
	id_kaavakohde_luokka uuid,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_alue_taydentava uuid,
	CONSTRAINT kaavakohde_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_inspire.kaavakohde OWNER TO postgres;
-- ddl-end --

-- object: yk_inspire.kansallinen_kaavakohde | type: TABLE --
-- DROP TABLE IF EXISTS yk_inspire.kansallinen_kaavakohde CASCADE;
CREATE TABLE yk_inspire.kansallinen_kaavakohde(
	id uuid NOT NULL,
	id_kansallinen_kaavakohde_luokka uuid,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_alue_taydentava uuid,
	CONSTRAINT kansallinen_kaavakohde_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_inspire.kansallinen_kaavakohde OWNER TO postgres;
-- ddl-end --

-- object: yk_inspire.kansallinen_taydentava_kaavamerkinta | type: TABLE --
-- DROP TABLE IF EXISTS yk_inspire.kansallinen_taydentava_kaavamerkinta CASCADE;
CREATE TABLE yk_inspire.kansallinen_taydentava_kaavamerkinta(
	id uuid NOT NULL,
	id_kansallinen_taydentava_kaavamerkinta_luokka uuid,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_alue_taydentava uuid,
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

-- object: yk_inspire.taydentava_kaavamerkinta | type: TABLE --
-- DROP TABLE IF EXISTS yk_inspire.taydentava_kaavamerkinta CASCADE;
CREATE TABLE yk_inspire.taydentava_kaavamerkinta(
	id uuid NOT NULL,
	id_taydentava_kaavamerkinta_luokka uuid,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_alue_taydentava uuid,
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

-- object: yk_mitoitus_varanto.mitoitus | type: TABLE --
-- DROP TABLE IF EXISTS yk_mitoitus_varanto.mitoitus CASCADE;
CREATE TABLE yk_mitoitus_varanto.mitoitus(
	id uuid NOT NULL,
	mitoitus_referenssi varchar,
	pinta_ala real,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	id_varanto_arvio uuid,
	id_varanto_toteutunut uuid,
	id_vaestorakenne_arvio uuid,
	id_vaestorakenne_toteutunut uuid,
	id_asuntovaranto_kaytto_arvio uuid,
	id_asuntovaranto_kaytto_toteutunut uuid,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_alue_taydentava uuid,
	CONSTRAINT mitoitus_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_mitoitus_varanto.mitoitus IS 'http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/ScopeObjectDetail.action;jsessionid=F05001FBEDB4246DD99D7D5C531E28A0?objectDetailId=10573';
-- ddl-end --
COMMENT ON COLUMN yk_mitoitus_varanto.mitoitus.mitoitus_referenssi IS 'INSPIRE';
-- ddl-end --
ALTER TABLE yk_mitoitus_varanto.mitoitus OWNER TO postgres;
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

-- object: yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys | type: TABLE --
-- DROP TABLE IF EXISTS yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys CASCADE;
CREATE TABLE yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys(
	id uuid NOT NULL,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_alue_taydentava uuid,
	id_kaavamaarays uuid,
	CONSTRAINT kaavaobjekti_kaavamaarays_linkki_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys IS 'kaavaobjektilla voi olla useita kaavamääräyksiä ja kaavamääräys voi liittyä useaan kaavaobjektiin';
-- ddl-end --
ALTER TABLE yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys OWNER TO postgres;
-- ddl-end --

-- object: yk_kuvaustekniikka.apugeometria_piste | type: TABLE --
-- DROP TABLE IF EXISTS yk_kuvaustekniikka.apugeometria_piste CASCADE;
CREATE TABLE yk_kuvaustekniikka.apugeometria_piste(
	id uuid NOT NULL,
	geom geometry(POINTZ, 3878),
	nimi varchar,
	selitys varchar,
	rotaatio real,
	tyyppi varchar,
	id_teema uuid,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_alue_taydentava uuid,
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
	rotaatio real,
	tyyppi varchar,
	id_teema uuid,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_alue_taydentava uuid,
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
	rotaatio real,
	tyyppi varchar,
	id_teema uuid,
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_alue_taydentava uuid,
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
	kaavamaarays_otsikko varchar,
	maaraysteksti varchar,
	lahde varchar,
	kaavamaarays_url varchar,
	kuvaus_teksti varchar,
	kuvaus_url varchar,
	jarjestys_nro smallint,
	lisatieto varchar,
	id_yleiskaava uuid,
	CONSTRAINT virallinen_dokumentaatio_pk_1 PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_yleiskaava.yleismaarays IS 'http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/SearchObjectSelection.action?search=Official+Documentation';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.yleismaarays.id IS 'http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/SearchObjectSelection.action?search=Official+Documentation';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.yleismaarays.jarjestys_nro IS 'Ominaisuutta voidaan käyttää järjestämään yleismääräykset käyttöliittymässä haluttuun järjestykseen';
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
	id_kaavaobjekti_viiva uuid,
	id_kaavaobjekti_piste uuid,
	id_kaavaobjekti_alue uuid,
	id_kaavaobjekti_alue_taydentava uuid,
	CONSTRAINT kaavaobjekti_teema_yhteys_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE yk_kuvaustekniikka.kaavaobjekti_teema_yhteys OWNER TO postgres;
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

-- object: yk_koodiluettelot.kaavoitusprosessin_tila_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.kaavoitusprosessin_tila_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.kaavoitusprosessin_tila_tyyppi AS
 ENUM ('kaava_vireilla_ja_valmistelussa','keskeytetty','oas_nahtavilla','luonnos_nahtavilla','ehdotus_nahtavilla','tarkistettu_ehdotus_nahtavilla','hyvaksytty_ehdotus','hyvaksytty_ehdotus_josta_valitettu','voimaan_kuulutettu_osin_tai_kokonaan');
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
	muokkaaja varchar,
	voimaantulopvm date,
	kumoamispvm date,
	version_alkamispvm date DEFAULT current_date,
	version_loppumispvm date,
	kaavamaaraysotsikko varchar,
	kayttotarkoitus_lyhenne varchar,
	nro varchar,
	paikan_nimi varchar,
	katuosoite varchar,
	karttamerkinta_teksti varchar,
	pituus_km real,
	luokittelu varchar,
	lisatieto varchar,
	lisatieto2 varchar,
	kohde_periytyy_muualta boolean,
	aineisto_lisatieto varchar,
	kansallinen_laillinen_sitovuus varchar,
	id_yleiskaava uuid,
	id_kansallinen_prosessin_vaihe uuid,
	id_kaavakohteen_olemassaolo uuid,
	id_kansallisen_kaavakohteen_olemassaolo uuid,
	id_laillinen_sitovuus uuid,
	id_prosessin_vaihe uuid,
	id_kaavoitusprosessin_tila uuid,
	CONSTRAINT kaavaobjekti_pk_2 PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_yleiskaava.kaavaobjekti_viiva IS 'Presence of one or several HILUCS values in an area, indicated either as the percentage covered for each value or as the values listed in their order of importance. http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/ScopeObjectDetail.action?objectDetailId=10556';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_viiva.id IS 'Uniikki ID tietokannassa, esim. 0079e638-2bb0-ee48-a15d-e560e3720622. Voidaan QGIS:ssä antaa automaattisesti attribuuttilomake-toiminnon avulla.';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_viiva.muokkaaja IS 'Henkilö, joka on luonut merkinnän tähän tauluun tai muokannut sitä';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_viiva.voimaantulopvm IS 'INSPIRE:n "Valid From"-kenttä Zoning element ja Supplementary regulation -tauluissa';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_viiva.kumoamispvm IS 'INSPIRE:n "Valid To"-kenttä Zoning element ja Supplementary regulation -tauluissa';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_viiva.version_alkamispvm IS 'INSPIRE:n "begin Lifespan Version"-kenttä Zoning element ja Supplementary regulation -tauluissa';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_viiva.version_loppumispvm IS 'INSPIRE:n "end Lifespan Version"-kenttä Zoning element ja Supplementary regulation -tauluissa';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_viiva.kaavamaaraysotsikko IS 'Viivamaisen kohteen kaavamääräyksen otsikko, esim. "Moottoritie" tai  "ohjeellinen ekologinen yhteys". Voidaan QGIS:ssä antaa lista vaihtoehdoista attribuuttilomake-toiminnon avulla.';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_viiva.nro IS 'Voidaan käyttää, jos kaavaobjektille halutaan antaa numero. Käytetty olemassa olevan tietokanta-aineiston tuonnissa avoimen tietokantamallin tietokantaan';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_viiva.paikan_nimi IS 'Esim. "Lempääläntie" tai "Loukkaanoja"';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_viiva.katuosoite IS 'Osoite, joka voi olla tarpeen määritellä osalle kaavaobjekteja.';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_viiva.karttamerkinta_teksti IS 'Karttamerkintä, jota voidaan käyttää visualisoinneissa.';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_viiva.pituus_km IS 'Viivamaisen kohteen pituus, joka päivittyy automaattisesti. Yksikkönä kilometri';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_viiva.luokittelu IS 'Vapaavalintainen kohteen luokittelu erilaisiin luokkiin tai tyyppeihin';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_viiva.lisatieto IS 'Tarvittava lisätieto kohteesta';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_viiva.kohde_periytyy_muualta IS 'INSPIRE:n "inherited From Other Plans"-kenttä Supplementary regulation-taulusta ja käytetään, jos kaavaobjekti on otettu käyttöön jostakin toisesta kaavasta';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_viiva.aineisto_lisatieto IS 'Mahdollisia huomioita ja lisätietoja aineistosta. Voidaan käytttää myös tuotaessa olemassa olevaa tietokanta-aineistoa avoimen tietokantamallin mukaiseen tietokantaan';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_viiva.kansallinen_laillinen_sitovuus IS 'INSPIRE:n "specific Regulation Nature"-kenttä Supplementary regulation-taulusta ja voidaan käyttää, kun Ympäristöministeriö on määritellyt mahdolliset arvot';
-- ddl-end --
ALTER TABLE yk_yleiskaava.kaavaobjekti_viiva OWNER TO postgres;
-- ddl-end --

-- object: yk_yleiskaava.kaavaobjekti_piste | type: TABLE --
-- DROP TABLE IF EXISTS yk_yleiskaava.kaavaobjekti_piste CASCADE;
CREATE TABLE yk_yleiskaava.kaavaobjekti_piste(
	id uuid NOT NULL,
	geom geometry(MULTIPOINTZ, 3878),
	muokkaaja varchar,
	voimaantulopvm date,
	kumoamispvm date,
	version_alkamispvm date,
	version_loppumispvm date,
	kaavamaaraysotsikko varchar,
	kayttotarkoitus_lyhenne varchar,
	nro varchar,
	paikan_nimi varchar,
	katuosoite varchar,
	karttamerkinta_teksti varchar,
	luokittelu varchar,
	lisatieto varchar,
	lisatieto2 varchar,
	kohde_periytyy_muualta boolean,
	aineisto_lisatieto varchar,
	kansallinen_laillinen_sitovuus varchar,
	id_yleiskaava uuid,
	id_kansallinen_prosessin_vaihe uuid,
	id_kaavakohteen_olemassaolo uuid,
	id_kansallisen_kaavakohteen_olemassaolo uuid,
	id_laillinen_sitovuus uuid,
	id_prosessin_vaihe uuid,
	id_kaavoitusprosessin_tila uuid,
	CONSTRAINT kaavaobjekti_pk_1 PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_yleiskaava.kaavaobjekti_piste IS 'Presence of one or several HILUCS values in an area, indicated either as the percentage covered for each value or as the values listed in their order of importance. http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/ScopeObjectDetail.action?objectDetailId=10556';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_piste.id IS 'Uniikki ID tietokannassa, esim. 0079e638-2bb0-ee48-a15d-e560e3720622. Voidaan QGIS:ssä antaa automaattisesti attribuuttilomake-toiminnon avulla.';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_piste.muokkaaja IS 'Henkilö, joka on luonut merkinnän tähän tauluun tai muokannut sitä';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_piste.voimaantulopvm IS 'INSPIRE:n "Valid From"-kenttä Zoning element ja Supplementary regulation -tauluissa';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_piste.kumoamispvm IS 'INSPIRE:n "Valid To"-kenttä Zoning element ja Supplementary regulation -tauluissa';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_piste.version_alkamispvm IS 'INSPIRE:n "begin Lifespan Version"-kenttä Zoning element ja Supplementary regulation -tauluissa';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_piste.version_loppumispvm IS 'INSPIRE:n "end Lifespan Version"-kenttä Zoning element ja Supplementary regulation -tauluissa';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_piste.kaavamaaraysotsikko IS 'Pistemäisen kohteen kaavamääräyksen otsikko, esim. "Aluekeskus" tai  "Uusi jätevedenpuhdistamo". Voidaan QGIS:ssä antaa lista vaihtoehdoista attribuuttilomake-toiminnon avulla.';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_piste.nro IS 'Voidaan käyttää, jos kaavaobjektille halutaan antaa numero. Käytetty olemassa olevan tietokanta-aineiston tuonnissa avoimen tietokantamallin tietokantaan';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_piste.paikan_nimi IS 'Esim. "Lakalaivan aluekeskus" tai "Tampereen Sähkölaitos Oy, Naistenlahden voimalaitos"';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_piste.katuosoite IS 'Osoite, joka voi olla tarpeen määritellä osalle kaavaobjekteja.';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_piste.karttamerkinta_teksti IS 'Karttamerkintä, jota voidaan käyttää visualisoinneissa.';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_piste.luokittelu IS 'Vapaavalintainen kohteen luokittelu erilaisiin luokkiin tai tyyppeihin';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_piste.lisatieto IS 'Tarvittava lisätieto kohteesta';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_piste.kohde_periytyy_muualta IS 'INSPIRE:n "inherited From Other Plans"-kenttä Supplementary regulation-taulusta ja käytetään, jos kaavaobjekti on otettu käyttöön jostakin toisesta kaavasta';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_piste.aineisto_lisatieto IS 'Mahdollisia huomioita ja lisätietoja aineistosta. Voidaan käytttää myös tuotaessa olemassa olevaa tietokanta-aineistoa avoimen tietokantamallin mukaiseen tietokantaan';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_piste.kansallinen_laillinen_sitovuus IS 'INSPIRE:n "specific Regulation Nature"-kenttä Supplementary regulation-taulusta ja voidaan käyttää, kun Ympäristöministeriö on määritellyt mahdolliset arvot';
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

-- object: public.viimeksi_muutettu | type: FUNCTION --
-- DROP FUNCTION IF EXISTS public.viimeksi_muutettu() CASCADE;
CREATE FUNCTION public.viimeksi_muutettu ()
	RETURNS trigger
	LANGUAGE plpgsql
	VOLATILE 
	CALLED ON NULL INPUT
	SECURITY INVOKER
	COST 1
	AS $$
BEGIN
	NEW.version_alkamispvm = current_date;
	RETURN NEW;
END;
$$;
-- ddl-end --
ALTER FUNCTION public.viimeksi_muutettu() OWNER TO postgres;
-- ddl-end --

-- object: viimeksi_muutettu | type: TRIGGER --
-- DROP TRIGGER IF EXISTS viimeksi_muutettu ON yk_yleiskaava.kaavaobjekti_viiva CASCADE;
CREATE TRIGGER viimeksi_muutettu
	BEFORE INSERT OR UPDATE
	ON yk_yleiskaava.kaavaobjekti_viiva
	FOR EACH ROW
	EXECUTE PROCEDURE public.viimeksi_muutettu();
-- ddl-end --

-- object: viimeksi_muutettu | type: TRIGGER --
-- DROP TRIGGER IF EXISTS viimeksi_muutettu ON yk_yleiskaava.kaavaobjekti_piste CASCADE;
CREATE TRIGGER viimeksi_muutettu
	BEFORE INSERT OR UPDATE
	ON yk_yleiskaava.kaavaobjekti_piste
	FOR EACH ROW
	EXECUTE PROCEDURE public.viimeksi_muutettu();
-- ddl-end --

-- object: yk_koodiluettelot.kayttotarkoitus_lyhenne_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.kayttotarkoitus_lyhenne_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.kayttotarkoitus_lyhenne_tyyppi AS
 ENUM ('A','A/V','C','C/V','EO','EP','P/T','R','RA','SL','T','TY','V','W','L','ANNA JOKIN ARVO');
-- ddl-end --
ALTER TYPE yk_koodiluettelot.kayttotarkoitus_lyhenne_tyyppi OWNER TO postgres;
-- ddl-end --

-- object: yk_yleiskaava.kaavaobjekti_alue | type: TABLE --
-- DROP TABLE IF EXISTS yk_yleiskaava.kaavaobjekti_alue CASCADE;
CREATE TABLE yk_yleiskaava.kaavaobjekti_alue(
	id uuid NOT NULL,
	geom geometry(MULTIPOLYGONZ, 3878),
	muokkaaja varchar,
	voimaantulopvm date,
	kumoamispvm date,
	version_alkamispvm date DEFAULT current_date,
	version_loppumispvm date,
	kaavamaaraysotsikko varchar,
	kayttotarkoitus_lyhenne varchar,
	rakennusoikeus_kem varchar,
	rakennusoikeus_lkm varchar,
	nro varchar,
	paikan_nimi varchar,
	katuosoite varchar,
	karttamerkinta_teksti varchar,
	pinta_ala_ha real,
	luokittelu varchar,
	lisatieto varchar,
	lisatieto2 varchar,
	aineisto_lisatieto varchar,
	id_yleiskaava uuid,
	id_kansallinen_prosessin_vaihe uuid,
	id_kaavakohteen_olemassaolo uuid,
	id_kansallisen_kaavakohteen_olemassaolo uuid,
	id_laillinen_sitovuus uuid,
	id_prosessin_vaihe uuid,
	id_kaavoitusprosessin_tila uuid,
	CONSTRAINT kaavaobjekti_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_yleiskaava.kaavaobjekti_alue IS 'Presence of one or several HILUCS values in an area, indicated either as the percentage covered for each value or as the values listed in their order of importance. http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/ScopeObjectDetail.action?objectDetailId=10556';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue.id IS 'Uniikki ID tietokannassa, esim. 0079e638-2bb0-ee48-a15d-e560e3720622. Voidaan QGIS:ssä antaa automaattisesti attribuuttilomake-toiminnon avulla.';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue.muokkaaja IS 'Henkilö, joka on luonut merkinnän tähän tauluun tai muokannut sitä';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue.voimaantulopvm IS 'INSPIRE:n "Valid From"-kenttä Zoning element ja Supplementary regulation -tauluissa';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue.kumoamispvm IS 'INSPIRE:n "Valid To"-kenttä Zoning element ja Supplementary regulation -tauluissa';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue.version_alkamispvm IS 'INSPIRE:n "begin Lifespan Version"-kenttä Zoning element ja Supplementary regulation -tauluissa';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue.version_loppumispvm IS 'INSPIRE:n "end Lifespan Version"-kenttä Zoning element ja Supplementary regulation -tauluissa';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue.kaavamaaraysotsikko IS 'Aluevarauksen kaavamääräyksen otsikko, esim. käyttötarkoitustyyppi "Asumisen alue" tai erityisominaisuusalue "Natura-alue" tai "Suojavyöhyke". Voidaan QGIS:ssä antaa lista vaihtoehdoista attribuuttilomake-toiminnon avulla.';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue.kayttotarkoitus_lyhenne IS 'Käyttötarkoituskoodi, esim. "A" tai "C", joka vastaa kaavamaaraysotsikko-sarakkeen arvoa ja joka ilmaiseen maankäyttötyypin. Voidaan QGIS:ssä antaa lista vaihtoehdoista attribuuttilomake-toiminnon avulla.';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue.rakennusoikeus_kem IS 'Käyttötarkoitusalueen rakennusoikeuden määrä, yksikkönä  kerrosneliömetri.';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue.rakennusoikeus_lkm IS 'Käyttötarkoitusalueen rakennusoikeuden määrä, yksikkönä  rakennuspaikkojen lukumäärä.';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue.nro IS 'Voidaan käyttää, jos kaavaobjektille halutaan antaa numero. Käytetty olemassa olevan tietokanta-aineiston tuonnissa avoimen tietokantamallin tietokantaan';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue.paikan_nimi IS 'Esim. "Lahdesjärvi-Lakalaiva" tai "Koilliskeskus" tai Vihiojan valuma-alue"';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue.katuosoite IS 'Osoite, joka voi olla tarpeen määritellä osalle kaavaobjekteja.';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue.karttamerkinta_teksti IS 'Karttamerkintä, jota voidaan käyttää visualisoinneissa.';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue.pinta_ala_ha IS 'Aluevarauksen pinta-ala, joka päivittyy automaattisesti. Yksikkönä hehtaari';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue.luokittelu IS 'Vapaavalintainen kohteen luokittelu erilaisiin luokkiin tai tyyppeihin';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue.lisatieto IS 'Tarvittava lisätieto kohteesta';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue.aineisto_lisatieto IS 'Mahdollisia huomioita ja lisätietoja aineistosta. Voidaan käytttää myös tuotaessa olemassa olevaa tietokanta-aineistoa avoimen tietokantamallin mukaiseen tietokantaan';
-- ddl-end --
ALTER TABLE yk_yleiskaava.kaavaobjekti_alue OWNER TO postgres;
-- ddl-end --

-- object: kaavaobjekti_alue_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_yhteys DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_fk CASCADE;
ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_yhteys ADD CONSTRAINT kaavaobjekti_alue_fk FOREIGN KEY (id_kaavaobjekti_alue)
REFERENCES yk_yleiskaava.kaavaobjekti_alue (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_fk | type: CONSTRAINT --
-- ALTER TABLE yk_inspire.taydentava_kaavamerkinta DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_fk CASCADE;
ALTER TABLE yk_inspire.taydentava_kaavamerkinta ADD CONSTRAINT kaavaobjekti_alue_fk FOREIGN KEY (id_kaavaobjekti_alue)
REFERENCES yk_yleiskaava.kaavaobjekti_alue (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_alue DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_alue ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_fk | type: CONSTRAINT --
-- ALTER TABLE yk_mitoitus_varanto.mitoitus DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_fk CASCADE;
ALTER TABLE yk_mitoitus_varanto.mitoitus ADD CONSTRAINT kaavaobjekti_alue_fk FOREIGN KEY (id_kaavaobjekti_alue)
REFERENCES yk_yleiskaava.kaavaobjekti_alue (id) MATCH FULL
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

-- object: kaavaobjekti_alue_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kuvaustekniikka.kaavaobjekti_teema_yhteys DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_fk CASCADE;
ALTER TABLE yk_kuvaustekniikka.kaavaobjekti_teema_yhteys ADD CONSTRAINT kaavaobjekti_alue_fk FOREIGN KEY (id_kaavaobjekti_alue)
REFERENCES yk_yleiskaava.kaavaobjekti_alue (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kansallisen_kaavakohteen_olemassaolo_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_alue DROP CONSTRAINT IF EXISTS kansallisen_kaavakohteen_olemassaolo_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_alue ADD CONSTRAINT kansallisen_kaavakohteen_olemassaolo_fk FOREIGN KEY (id_kansallisen_kaavakohteen_olemassaolo)
REFERENCES yk_inspire.kansallisen_kaavakohteen_olemassaolo (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: laillinen_sitovuus_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_alue DROP CONSTRAINT IF EXISTS laillinen_sitovuus_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_alue ADD CONSTRAINT laillinen_sitovuus_fk FOREIGN KEY (id_laillinen_sitovuus)
REFERENCES yk_koodiluettelot.laillinen_sitovuus (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.dokumentti_yleiskaava_yhteys DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_fk CASCADE;
ALTER TABLE yk_prosessi.dokumentti_yleiskaava_yhteys ADD CONSTRAINT kaavaobjekti_alue_fk FOREIGN KEY (id_kaavaobjekti_alue)
REFERENCES yk_yleiskaava.kaavaobjekti_alue (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
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

-- object: prosessin_vaihe_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_alue DROP CONSTRAINT IF EXISTS prosessin_vaihe_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_alue ADD CONSTRAINT prosessin_vaihe_fk FOREIGN KEY (id_prosessin_vaihe)
REFERENCES yk_koodiluettelot.prosessin_vaihe (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_fk | type: CONSTRAINT --
-- ALTER TABLE yk_inspire.kansallinen_taydentava_kaavamerkinta DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_fk CASCADE;
ALTER TABLE yk_inspire.kansallinen_taydentava_kaavamerkinta ADD CONSTRAINT kaavaobjekti_alue_fk FOREIGN KEY (id_kaavaobjekti_alue)
REFERENCES yk_yleiskaava.kaavaobjekti_alue (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: viimeksi_muutettu | type: TRIGGER --
-- DROP TRIGGER IF EXISTS viimeksi_muutettu ON yk_yleiskaava.kaavaobjekti_alue CASCADE;
CREATE TRIGGER viimeksi_muutettu
	BEFORE INSERT OR UPDATE
	ON yk_yleiskaava.kaavaobjekti_alue
	FOR EACH ROW
	EXECUTE PROCEDURE public.viimeksi_muutettu();
-- ddl-end --

-- object: kaavoitusprosessin_tila_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_alue DROP CONSTRAINT IF EXISTS kaavoitusprosessin_tila_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_alue ADD CONSTRAINT kaavoitusprosessin_tila_fk FOREIGN KEY (id_kaavoitusprosessin_tila)
REFERENCES yk_koodiluettelot.kaavoitusprosessin_tila (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_yleiskaava.kaavaobjekti_alue_taydentava | type: TABLE --
-- DROP TABLE IF EXISTS yk_yleiskaava.kaavaobjekti_alue_taydentava CASCADE;
CREATE TABLE yk_yleiskaava.kaavaobjekti_alue_taydentava(
	id uuid NOT NULL,
	geom geometry(MULTIPOLYGONZ, 3878),
	muokkaaja varchar,
	voimaantulopvm date,
	kumoamispvm date,
	version_alkamispvm date DEFAULT current_date,
	version_loppumispvm date,
	kaavamaaraysotsikko varchar,
	kayttotarkoitus_lyhenne varchar,
	rakennusoikeus_kem varchar,
	rakennusoikeus_lkm varchar,
	nro varchar,
	paikan_nimi varchar,
	katuosoite varchar,
	karttamerkinta_teksti varchar,
	pinta_ala_ha real,
	luokittelu varchar,
	lisatieto varchar,
	lisatieto2 varchar,
	kohde_periytyy_muualta boolean,
	aineisto_lisatieto varchar,
	kansallinen_laillinen_sitovuus varchar,
	id_yleiskaava uuid,
	id_kansallinen_prosessin_vaihe uuid,
	id_kaavakohteen_olemassaolo uuid,
	id_kansallisen_kaavakohteen_olemassaolo uuid,
	id_laillinen_sitovuus uuid,
	id_prosessin_vaihe uuid,
	id_kaavoitusprosessin_tila uuid,
	CONSTRAINT kaavaobjekti_pk_3 PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_yleiskaava.kaavaobjekti_alue_taydentava IS 'Presence of one or several HILUCS values in an area, indicated either as the percentage covered for each value or as the values listed in their order of importance. http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/ScopeObjectDetail.action?objectDetailId=10556';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue_taydentava.id IS 'Uniikki ID tietokannassa, esim. 0079e638-2bb0-ee48-a15d-e560e3720622. Voidaan QGIS:ssä antaa automaattisesti attribuuttilomake-toiminnon avulla.';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue_taydentava.muokkaaja IS 'Henkilö, joka on luonut merkinnän tähän tauluun tai muokannut sitä';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue_taydentava.voimaantulopvm IS 'INSPIRE:n "Valid From"-kenttä Zoning element ja Supplementary regulation -tauluissa';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue_taydentava.kumoamispvm IS 'INSPIRE:n "Valid To"-kenttä Zoning element ja Supplementary regulation -tauluissa';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue_taydentava.version_alkamispvm IS 'INSPIRE:n "begin Lifespan Version"-kenttä Zoning element ja Supplementary regulation -tauluissa';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue_taydentava.version_loppumispvm IS 'INSPIRE:n "end Lifespan Version"-kenttä Zoning element ja Supplementary regulation -tauluissa';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue_taydentava.kaavamaaraysotsikko IS 'Aluevarauksen kaavamääräyksen otsikko, esim. käyttötarkoitustyyppi "Asumisen alue" tai erityisominaisuusalue "Natura-alue" tai "Suojavyöhyke". Voidaan QGIS:ssä antaa lista vaihtoehdoista attribuuttilomake-toiminnon avulla.';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue_taydentava.kayttotarkoitus_lyhenne IS 'Käyttötarkoituskoodi, esim. "A" tai "C", joka vastaa kaavamaaraysotsikko-sarakkeen arvoa ja joka ilmaiseen maankäyttötyypin. Voidaan QGIS:ssä antaa lista vaihtoehdoista attribuuttilomake-toiminnon avulla.';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue_taydentava.rakennusoikeus_kem IS 'Käyttötarkoitusalueen rakennusoikeuden määrä, yksikkönä  kerrosneliömetri.';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue_taydentava.rakennusoikeus_lkm IS 'Käyttötarkoitusalueen rakennusoikeuden määrä, yksikkönä  rakennuspaikkojen lukumäärä.';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue_taydentava.nro IS 'Voidaan käyttää, jos kaavaobjektille halutaan antaa numero. Käytetty olemassa olevan tietokanta-aineiston tuonnissa avoimen tietokantamallin tietokantaan';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue_taydentava.paikan_nimi IS 'Esim. "Lahdesjärvi-Lakalaiva" tai "Koilliskeskus" tai Vihiojan valuma-alue"';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue_taydentava.katuosoite IS 'Osoite, joka voi olla tarpeen määritellä osalle kaavaobjekteja.';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue_taydentava.karttamerkinta_teksti IS 'Karttamerkintä, jota voidaan käyttää visualisoinneissa.';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue_taydentava.pinta_ala_ha IS 'Aluevarauksen pinta-ala, joka päivittyy automaattisesti. Yksikkönä hehtaari';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue_taydentava.luokittelu IS 'Vapaavalintainen kohteen luokittelu erilaisiin luokkiin tai tyyppeihin';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue_taydentava.lisatieto IS 'Tarvittava lisätieto kohteesta';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue_taydentava.kohde_periytyy_muualta IS 'INSPIRE:n "inherited From Other Plans"-kenttä Supplementary regulation-taulusta ja käytetään, jos kaavaobjekti on otettu käyttöön jostakin toisesta kaavasta';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue_taydentava.aineisto_lisatieto IS 'Mahdollisia huomioita ja lisätietoja aineistosta. Voidaan käytttää myös tuotaessa olemassa olevaa tietokanta-aineistoa avoimen tietokantamallin mukaiseen tietokantaan';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavaobjekti_alue_taydentava.kansallinen_laillinen_sitovuus IS 'INSPIRE:n "specific Regulation Nature"-kenttä Supplementary regulation-taulusta ja voidaan käyttää, kun Ympäristöministeriö on määritellyt mahdolliset arvot';
-- ddl-end --
ALTER TABLE yk_yleiskaava.kaavaobjekti_alue_taydentava OWNER TO postgres;
-- ddl-end --

-- object: viimeksi_muutettu | type: TRIGGER --
-- DROP TRIGGER IF EXISTS viimeksi_muutettu ON yk_yleiskaava.kaavaobjekti_alue_taydentava CASCADE;
CREATE TRIGGER viimeksi_muutettu
	BEFORE INSERT OR UPDATE
	ON yk_yleiskaava.kaavaobjekti_alue_taydentava
	FOR EACH ROW
	EXECUTE PROCEDURE public.viimeksi_muutettu();
-- ddl-end --

-- object: kaavaobjekti_alue_taydentava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kuvaustekniikka.kaavaobjekti_teema_yhteys DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_taydentava_fk CASCADE;
ALTER TABLE yk_kuvaustekniikka.kaavaobjekti_teema_yhteys ADD CONSTRAINT kaavaobjekti_alue_taydentava_fk FOREIGN KEY (id_kaavaobjekti_alue_taydentava)
REFERENCES yk_yleiskaava.kaavaobjekti_alue_taydentava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_taydentava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kuvaustekniikka.apugeometria_alue DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_taydentava_fk CASCADE;
ALTER TABLE yk_kuvaustekniikka.apugeometria_alue ADD CONSTRAINT kaavaobjekti_alue_taydentava_fk FOREIGN KEY (id_kaavaobjekti_alue_taydentava)
REFERENCES yk_yleiskaava.kaavaobjekti_alue_taydentava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_taydentava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kuvaustekniikka.apugeometria_viiva DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_taydentava_fk CASCADE;
ALTER TABLE yk_kuvaustekniikka.apugeometria_viiva ADD CONSTRAINT kaavaobjekti_alue_taydentava_fk FOREIGN KEY (id_kaavaobjekti_alue_taydentava)
REFERENCES yk_yleiskaava.kaavaobjekti_alue_taydentava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_taydentava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_kuvaustekniikka.apugeometria_piste DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_taydentava_fk CASCADE;
ALTER TABLE yk_kuvaustekniikka.apugeometria_piste ADD CONSTRAINT kaavaobjekti_alue_taydentava_fk FOREIGN KEY (id_kaavaobjekti_alue_taydentava)
REFERENCES yk_yleiskaava.kaavaobjekti_alue_taydentava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_taydentava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.mittakaava DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_taydentava_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.mittakaava ADD CONSTRAINT kaavaobjekti_alue_taydentava_fk FOREIGN KEY (id_kaavaobjekti_alue_taydentava)
REFERENCES yk_yleiskaava.kaavaobjekti_alue_taydentava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_taydentava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.ei_sitova_tavoiteaika DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_taydentava_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.ei_sitova_tavoiteaika ADD CONSTRAINT kaavaobjekti_alue_taydentava_fk FOREIGN KEY (id_kaavaobjekti_alue_taydentava)
REFERENCES yk_yleiskaava.kaavaobjekti_alue_taydentava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_taydentava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.suhde_maan_tasoon DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_taydentava_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.suhde_maan_tasoon ADD CONSTRAINT kaavaobjekti_alue_taydentava_fk FOREIGN KEY (id_kaavaobjekti_alue_taydentava)
REFERENCES yk_yleiskaava.kaavaobjekti_alue_taydentava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_taydentava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.sidottu_kaavaobjekti DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_taydentava_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.sidottu_kaavaobjekti ADD CONSTRAINT kaavaobjekti_alue_taydentava_fk FOREIGN KEY (id_kaavaobjekti_alue_taydentava)
REFERENCES yk_yleiskaava.kaavaobjekti_alue_taydentava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_taydentava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.sitova_kaavaobjekti DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_taydentava_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.sitova_kaavaobjekti ADD CONSTRAINT kaavaobjekti_alue_taydentava_fk FOREIGN KEY (id_kaavaobjekti_alue_taydentava)
REFERENCES yk_yleiskaava.kaavaobjekti_alue_taydentava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_taydentava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_mitoitus_varanto.mitoitus DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_taydentava_fk CASCADE;
ALTER TABLE yk_mitoitus_varanto.mitoitus ADD CONSTRAINT kaavaobjekti_alue_taydentava_fk FOREIGN KEY (id_kaavaobjekti_alue_taydentava)
REFERENCES yk_yleiskaava.kaavaobjekti_alue_taydentava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_taydentava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_taydentava_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys ADD CONSTRAINT kaavaobjekti_alue_taydentava_fk FOREIGN KEY (id_kaavaobjekti_alue_taydentava)
REFERENCES yk_yleiskaava.kaavaobjekti_alue_taydentava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_taydentava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_inspire.kaavakohde DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_taydentava_fk CASCADE;
ALTER TABLE yk_inspire.kaavakohde ADD CONSTRAINT kaavaobjekti_alue_taydentava_fk FOREIGN KEY (id_kaavaobjekti_alue_taydentava)
REFERENCES yk_yleiskaava.kaavaobjekti_alue_taydentava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_taydentava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_inspire.kansallinen_kaavakohde DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_taydentava_fk CASCADE;
ALTER TABLE yk_inspire.kansallinen_kaavakohde ADD CONSTRAINT kaavaobjekti_alue_taydentava_fk FOREIGN KEY (id_kaavaobjekti_alue_taydentava)
REFERENCES yk_yleiskaava.kaavaobjekti_alue_taydentava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_taydentava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_inspire.taydentava_kaavamerkinta DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_taydentava_fk CASCADE;
ALTER TABLE yk_inspire.taydentava_kaavamerkinta ADD CONSTRAINT kaavaobjekti_alue_taydentava_fk FOREIGN KEY (id_kaavaobjekti_alue_taydentava)
REFERENCES yk_yleiskaava.kaavaobjekti_alue_taydentava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_taydentava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_inspire.kansallinen_taydentava_kaavamerkinta DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_taydentava_fk CASCADE;
ALTER TABLE yk_inspire.kansallinen_taydentava_kaavamerkinta ADD CONSTRAINT kaavaobjekti_alue_taydentava_fk FOREIGN KEY (id_kaavaobjekti_alue_taydentava)
REFERENCES yk_yleiskaava.kaavaobjekti_alue_taydentava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_taydentava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_yhteys DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_taydentava_fk CASCADE;
ALTER TABLE yk_prosessi.lahtoaineisto_yleiskaava_yhteys ADD CONSTRAINT kaavaobjekti_alue_taydentava_fk FOREIGN KEY (id_kaavaobjekti_alue_taydentava)
REFERENCES yk_yleiskaava.kaavaobjekti_alue_taydentava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_taydentava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_prosessi.dokumentti_yleiskaava_yhteys DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_taydentava_fk CASCADE;
ALTER TABLE yk_prosessi.dokumentti_yleiskaava_yhteys ADD CONSTRAINT kaavaobjekti_alue_taydentava_fk FOREIGN KEY (id_kaavaobjekti_alue_taydentava)
REFERENCES yk_yleiskaava.kaavaobjekti_alue_taydentava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: laillinen_sitovuus_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_alue_taydentava DROP CONSTRAINT IF EXISTS laillinen_sitovuus_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_alue_taydentava ADD CONSTRAINT laillinen_sitovuus_fk FOREIGN KEY (id_laillinen_sitovuus)
REFERENCES yk_koodiluettelot.laillinen_sitovuus (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavoitusprosessin_tila_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_alue_taydentava DROP CONSTRAINT IF EXISTS kaavoitusprosessin_tila_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_alue_taydentava ADD CONSTRAINT kaavoitusprosessin_tila_fk FOREIGN KEY (id_kaavoitusprosessin_tila)
REFERENCES yk_koodiluettelot.kaavoitusprosessin_tila (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: prosessin_vaihe_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_alue_taydentava DROP CONSTRAINT IF EXISTS prosessin_vaihe_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_alue_taydentava ADD CONSTRAINT prosessin_vaihe_fk FOREIGN KEY (id_prosessin_vaihe)
REFERENCES yk_koodiluettelot.prosessin_vaihe (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kansallinen_prosessin_vaihe_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_alue_taydentava DROP CONSTRAINT IF EXISTS kansallinen_prosessin_vaihe_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_alue_taydentava ADD CONSTRAINT kansallinen_prosessin_vaihe_fk FOREIGN KEY (id_kansallinen_prosessin_vaihe)
REFERENCES yk_koodiluettelot.kansallinen_prosessin_vaihe (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_alue_taydentava DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_alue_taydentava ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavakohteen_olemassaolo_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_alue_taydentava DROP CONSTRAINT IF EXISTS kaavakohteen_olemassaolo_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_alue_taydentava ADD CONSTRAINT kaavakohteen_olemassaolo_fk FOREIGN KEY (id_kaavakohteen_olemassaolo)
REFERENCES yk_inspire.kaavakohteen_olemassaolo (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: kansallisen_kaavakohteen_olemassaolo_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_alue_taydentava DROP CONSTRAINT IF EXISTS kansallisen_kaavakohteen_olemassaolo_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_alue_taydentava ADD CONSTRAINT kansallisen_kaavakohteen_olemassaolo_fk FOREIGN KEY (id_kansallisen_kaavakohteen_olemassaolo)
REFERENCES yk_inspire.kansallisen_kaavakohteen_olemassaolo (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yk_koodiluettelot.kaavamaarays_tyyppi | type: TYPE --
-- DROP TYPE IF EXISTS yk_koodiluettelot.kaavamaarays_tyyppi CASCADE;
CREATE TYPE yk_koodiluettelot.kaavamaarays_tyyppi AS
 ENUM ('piste','viiva','alue','täydentävä','piste viiva','piste alue','piste täydentävä','piste viiva alue','piste viiva täydentävä','piste alue täydentävä','piste viiva alue täydentävä','viiva alue','viiva täydentävä','viiva alue täydentävä','alue täydentävä');
-- ddl-end --
ALTER TYPE yk_koodiluettelot.kaavamaarays_tyyppi OWNER TO postgres;
-- ddl-end --

-- object: yk_yleiskaava.kaavamaarays | type: TABLE --
-- DROP TABLE IF EXISTS yk_yleiskaava.kaavamaarays CASCADE;
CREATE TABLE yk_yleiskaava.kaavamaarays(
	id uuid NOT NULL,
	kaavamaarays_otsikko varchar,
	maaraysteksti varchar,
	voimaantulopvm date,
	kumoamispvm date,
	lahde varchar,
	kaavamaarays_url varchar,
	karttamerkinta_url varchar,
	kuvaus_teksti varchar,
	kuvaus_url varchar,
	lisatieto varchar,
	kohdetyyppi yk_koodiluettelot.kaavamaarays_tyyppi,
	CONSTRAINT virallinen_dokumentaatio_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE yk_yleiskaava.kaavamaarays IS 'http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/SearchObjectSelection.action?search=Official+Documentation';
-- ddl-end --
COMMENT ON COLUMN yk_yleiskaava.kaavamaarays.id IS 'http://inspire-regadmin.jrc.ec.europa.eu/dataspecification/SearchObjectSelection.action?search=Official+Documentation';
-- ddl-end --
ALTER TABLE yk_yleiskaava.kaavamaarays OWNER TO postgres;
-- ddl-end --

-- object: kaavamaarays_fk | type: CONSTRAINT --
-- ALTER TABLE yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys DROP CONSTRAINT IF EXISTS kaavamaarays_fk CASCADE;
ALTER TABLE yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys ADD CONSTRAINT kaavamaarays_fk FOREIGN KEY (id_kaavamaarays)
REFERENCES yk_yleiskaava.kaavamaarays (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.tukes_vyohyke DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.tukes_vyohyke ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: viimeksi_muokattu | type: TRIGGER --
-- DROP TRIGGER IF EXISTS viimeksi_muokattu ON yk_yleiskaava.yleiskaava CASCADE;
CREATE TRIGGER viimeksi_muokattu
	BEFORE INSERT OR UPDATE
	ON yk_yleiskaava.yleiskaava
	FOR EACH ROW
	EXECUTE PROCEDURE public.viimeksi_muutettu();
-- ddl-end --

-- object: kaavaobjekti_alue_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.ei_sitova_tavoiteaika DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.ei_sitova_tavoiteaika ADD CONSTRAINT kaavaobjekti_alue_fk FOREIGN KEY (id_kaavaobjekti_alue)
REFERENCES yk_yleiskaava.kaavaobjekti_alue (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: kaavaobjekti_alue_fk | type: CONSTRAINT --
-- ALTER TABLE yk_suunnitteluparametrit.suhde_maan_tasoon DROP CONSTRAINT IF EXISTS kaavaobjekti_alue_fk CASCADE;
ALTER TABLE yk_suunnitteluparametrit.suhde_maan_tasoon ADD CONSTRAINT kaavaobjekti_alue_fk FOREIGN KEY (id_kaavaobjekti_alue)
REFERENCES yk_yleiskaava.kaavaobjekti_alue (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: yleiskaava_fk | type: CONSTRAINT --
-- ALTER TABLE yk_metatiedot.metatietokortti DROP CONSTRAINT IF EXISTS yleiskaava_fk CASCADE;
ALTER TABLE yk_metatiedot.metatietokortti ADD CONSTRAINT yleiskaava_fk FOREIGN KEY (id_yleiskaava)
REFERENCES yk_yleiskaava.yleiskaava (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.pinta_alan_paivitys | type: FUNCTION --
-- DROP FUNCTION IF EXISTS public.pinta_alan_paivitys() CASCADE;
CREATE FUNCTION public.pinta_alan_paivitys ()
	RETURNS trigger
	LANGUAGE plpgsql
	VOLATILE 
	CALLED ON NULL INPUT
	SECURITY INVOKER
	COST 1
	AS $$
BEGIN
	NEW.pinta_ala_ha = ST_Area(NEW.geom) / 10000;
	RETURN NEW;
END;

$$;
-- ddl-end --
ALTER FUNCTION public.pinta_alan_paivitys() OWNER TO postgres;
-- ddl-end --

-- object: public.pituuden_paivitys | type: FUNCTION --
-- DROP FUNCTION IF EXISTS public.pituuden_paivitys() CASCADE;
CREATE FUNCTION public.pituuden_paivitys ()
	RETURNS trigger
	LANGUAGE plpgsql
	VOLATILE 
	CALLED ON NULL INPUT
	SECURITY INVOKER
	COST 1
	AS $$
BEGIN
	NEW.pituus_km = ST_Length(NEW.geom) / 1000;
	RETURN NEW;
END;

$$;
-- ddl-end --
ALTER FUNCTION public.pituuden_paivitys() OWNER TO postgres;
-- ddl-end --

-- object: pinta_alan_paivitys | type: TRIGGER --
-- DROP TRIGGER IF EXISTS pinta_alan_paivitys ON yk_yleiskaava.kaavaobjekti_alue CASCADE;
CREATE TRIGGER pinta_alan_paivitys
	BEFORE INSERT OR UPDATE
	ON yk_yleiskaava.kaavaobjekti_alue
	FOR EACH ROW
	EXECUTE PROCEDURE public.pinta_alan_paivitys();
-- ddl-end --

-- object: pinta_alan_paivitys | type: TRIGGER --
-- DROP TRIGGER IF EXISTS pinta_alan_paivitys ON yk_yleiskaava.kaavaobjekti_alue_taydentava CASCADE;
CREATE TRIGGER pinta_alan_paivitys
	BEFORE INSERT OR UPDATE
	ON yk_yleiskaava.kaavaobjekti_alue_taydentava
	FOR EACH ROW
	EXECUTE PROCEDURE public.pinta_alan_paivitys();
-- ddl-end --

-- object: pituuden_paivitys | type: TRIGGER --
-- DROP TRIGGER IF EXISTS pituuden_paivitys ON yk_yleiskaava.kaavaobjekti_viiva CASCADE;
CREATE TRIGGER pituuden_paivitys
	BEFORE INSERT OR UPDATE
	ON yk_yleiskaava.kaavaobjekti_viiva
	FOR EACH ROW
	EXECUTE PROCEDURE public.pituuden_paivitys();
-- ddl-end --


