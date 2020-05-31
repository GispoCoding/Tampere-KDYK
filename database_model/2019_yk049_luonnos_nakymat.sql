DROP VIEW IF EXISTS yk_yleiskaava.yk049_k1_aluevaraukset_polygon;
CREATE VIEW yk_yleiskaava.yk049_k1_aluevaraukset_polygon AS
SELECT
        row_number() OVER () as rnum,
        kaavaobjekti_alue.geom,
		ST_Centroid(kaavaobjekti_alue.geom) AS referenssipiste_geom,
        'Kantakaupungin yleiskaava luonnos, valtuustokausi 2017-2021'::varchar AS "Yleiskaavan nimi",
		kaavamaarays.kaavamaarays_otsikko,
        CASE WHEN kaavamaarays.maaraysteksti IS NOT NULL
                THEN kaavamaarays.maaraysteksti
                ELSE '-'::text
        END
        AS "Määräysteksti",
        '<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021/yleiskaavaluonnos/kaavakartat/kartta-1.html#'::text||kaavamaarays.kaavamaarays_url||'" target="_blank">Määräysteksti ja kuvaus</a>'::text AS "Määräysteksti ja kuvaus",
        '<img src="' || kaavamaarays.karttamerkinta_url || '">'::text AS " Karttamerkintä",
        kaavaobjekti_alue.karttamerkinta_teksti,
		kaavaobjekti_alue.paikan_nimi,
		kaavaobjekti_alue.luokittelu,
		kaavaobjekti_alue.rakennusoikeus_kem/*,
		CASE WHEN kaavamaarays.kuvaus_teksti IS NOT NULL
                THEN kaavamaarays.kuvaus_teksti
                ELSE '-'::text
        END
        AS "Kuvaus"*/
--      NULL::text AS version_loppumispvm
FROM
        yk_yleiskaava.kaavaobjekti_alue,
        yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
        yk_yleiskaava.kaavamaarays,
        yk_kuvaustekniikka.teema,
        yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
		yk_yleiskaava.yleiskaava
WHERE
        kaavaobjekti_alue.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue AND
        kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays AND
        teema.kuvaus = 'Kartta 1' AND
        teema.id = kaavaobjekti_teema_yhteys.id_teema AND
        kaavaobjekti_alue.id = kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue
		AND kaavaobjekti_alue.version_loppumispvm IS NULL
		AND yleiskaava.nimi = 'Kantakaupungin yleiskaava 2017 - 2021'
		AND yleiskaava.id = kaavaobjekti_alue.id_yleiskaava;

DROP VIEW IF EXISTS yk_yleiskaava.yk049_k1_taydentavat_aluekohteet_polygon;
CREATE VIEW yk_yleiskaava.yk049_k1_taydentavat_aluekohteet_polygon AS
SELECT
        row_number() OVER () as rnum,
        kaavaobjekti_alue_taydentava.geom,
		ST_Centroid(kaavaobjekti_alue_taydentava.geom) AS referenssipiste_geom,
        'Kantakaupungin yleiskaava luonnos, valtuustokausi 2017-2021'::varchar AS "Yleiskaavan nimi",
        kaavamaarays.kaavamaarays_otsikko,
		CASE WHEN kaavamaarays.maaraysteksti IS NOT NULL
                THEN kaavamaarays.maaraysteksti
                ELSE '-'::text
        END
        AS "Määräysteksti",
        '<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021/yleiskaavaluonnos/kaavakartat/kartta-1.html#'::text||kaavamaarays.kaavamaarays_url||'" target="_blank">Määräysteksti ja kuvaus</a>'::text AS "Määräysteksti ja kuvaus",
        '<img src="' || kaavamaarays.karttamerkinta_url || '">'::text AS " Karttamerkintä",
        kaavaobjekti_alue_taydentava.karttamerkinta_teksti,
		kaavaobjekti_alue_taydentava.paikan_nimi,
		kaavaobjekti_alue_taydentava.luokittelu/*,
		CASE WHEN kaavamaarays.kuvaus_teksti IS NOT NULL
                THEN kaavamaarays.kuvaus_teksti
                ELSE '-'::text
        END
        AS "Kuvaus"*/
--      NULL::text AS version_loppumispvm
FROM
        yk_yleiskaava.kaavaobjekti_alue_taydentava,
        yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
        yk_yleiskaava.kaavamaarays,
        yk_kuvaustekniikka.teema,
        yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
		yk_yleiskaava.yleiskaava
WHERE
        kaavaobjekti_alue_taydentava.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue_taydentava AND
        kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays AND
        teema.kuvaus = 'Kartta 1' AND
        teema.id = kaavaobjekti_teema_yhteys.id_teema AND
        kaavaobjekti_alue_taydentava.id = kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue_taydentava
		AND kaavaobjekti_alue_taydentava.version_loppumispvm IS NULL
		AND yleiskaava.nimi = 'Kantakaupungin yleiskaava 2017 - 2021'
		AND yleiskaava.id = kaavaobjekti_alue_taydentava.id_yleiskaava
		AND kaavamaarays.kaavamaarays_otsikko <> 'ALUEKESKUS'
		AND kaavamaarays.kaavamaarays_otsikko <> 'PAIKALLISKESKUS'
		AND kaavamaarays.kaavamaarays_otsikko <> 'KORKEAAN RAKENTAMISEEN SOVELTUVA VYÖHYKE';
		
DROP VIEW IF EXISTS yk_yleiskaava.yk049_k1_taydentavat_aluekohteet_alue_ja_paikalliskeskus;
CREATE VIEW yk_yleiskaava.yk049_k1_taydentavat_aluekohteet_alue_ja_paikalliskeskus AS
SELECT
        row_number() OVER () as rnum,
        kaavaobjekti_alue_taydentava.geom,
		ST_Centroid(kaavaobjekti_alue_taydentava.geom) AS referenssipiste_geom,
        'Kantakaupungin yleiskaava luonnos, valtuustokausi 2017-2021'::varchar AS "Yleiskaavan nimi",
        kaavamaarays.kaavamaarays_otsikko,
		CASE WHEN kaavamaarays.maaraysteksti IS NOT NULL
                THEN kaavamaarays.maaraysteksti
                ELSE '-'::text
        END
        AS "Määräysteksti",
        '<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021/yleiskaavaluonnos/kaavakartat/kartta-1.html#'::text||kaavamaarays.kaavamaarays_url||'" target="_blank">Määräysteksti ja kuvaus</a>'::text AS "Määräysteksti ja kuvaus",
        '<img src="' || kaavamaarays.karttamerkinta_url || '">'::text AS " Karttamerkintä",
        kaavaobjekti_alue_taydentava.karttamerkinta_teksti,
		kaavaobjekti_alue_taydentava.paikan_nimi,
		kaavaobjekti_alue_taydentava.luokittelu/*,
		CASE WHEN kaavamaarays.kuvaus_teksti IS NOT NULL
                THEN kaavamaarays.kuvaus_teksti
                ELSE '-'::text
        END
        AS "Kuvaus"*/
--      NULL::text AS version_loppumispvm
FROM
        yk_yleiskaava.kaavaobjekti_alue_taydentava,
        yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
        yk_yleiskaava.kaavamaarays,
        yk_kuvaustekniikka.teema,
        yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
		yk_yleiskaava.yleiskaava
WHERE
        kaavaobjekti_alue_taydentava.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue_taydentava AND
        kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays AND
        teema.kuvaus = 'Kartta 1' AND
        teema.id = kaavaobjekti_teema_yhteys.id_teema AND
        kaavaobjekti_alue_taydentava.id = kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue_taydentava
		AND kaavaobjekti_alue_taydentava.version_loppumispvm IS NULL
		AND yleiskaava.nimi = 'Kantakaupungin yleiskaava 2017 - 2021'
		AND yleiskaava.id = kaavaobjekti_alue_taydentava.id_yleiskaava
		AND (kaavamaarays.kaavamaarays_otsikko = 'ALUEKESKUS' OR
		kaavamaarays.kaavamaarays_otsikko = 'PAIKALLISKESKUS');

DROP VIEW IF EXISTS yk_yleiskaava.yk049_k1_taydentavat_aluekohteet_polygon_kork_rak_sov_vyoh;
CREATE VIEW yk_yleiskaava.yk049_k1_taydentavat_aluekohteet_polygon_kork_rak_sov_vyoh AS
SELECT
        row_number() OVER () as rnum,
        kaavaobjekti_alue_taydentava.geom,
		ST_Centroid(kaavaobjekti_alue_taydentava.geom) AS referenssipiste_geom,
        'Kantakaupungin yleiskaava luonnos, valtuustokausi 2017-2021'::varchar AS "Yleiskaavan nimi",
        kaavamaarays.kaavamaarays_otsikko,
		CASE WHEN kaavamaarays.maaraysteksti IS NOT NULL
                THEN kaavamaarays.maaraysteksti
                ELSE '-'::text
        END
        AS "Määräysteksti",
        '<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021/yleiskaavaluonnos/kaavakartat/kartta-1.html#'::text||kaavamaarays.kaavamaarays_url||'" target="_blank">Määräysteksti ja kuvaus</a>'::text AS "Määräysteksti ja kuvaus",
        '<img src="' || kaavamaarays.karttamerkinta_url || '">'::text AS " Karttamerkintä",
        kaavaobjekti_alue_taydentava.karttamerkinta_teksti,
		kaavaobjekti_alue_taydentava.paikan_nimi,
		kaavaobjekti_alue_taydentava.luokittelu,
		CASE
			WHEN dokumentti.linkki_data IS NOT NULL
                THEN
					'<a href="'::text || dokumentti.linkki_data || '" target="_blank">'::text || dokumentti.nimi || '</a>'::text
            ELSE ''::text
        END AS "Raportin suositukset"/*,
		CASE WHEN kaavamaarays.kuvaus_teksti IS NOT NULL
                THEN kaavamaarays.kuvaus_teksti
                ELSE '-'::text
        END
        AS "Kuvaus"*/
--      NULL::text AS version_loppumispvm
FROM
        yk_yleiskaava.kaavaobjekti_alue_taydentava,
        yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
        yk_yleiskaava.kaavamaarays,
        yk_kuvaustekniikka.teema,
        yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
		yk_yleiskaava.yleiskaava,
        yk_prosessi.dokumentti_yleiskaava_yhteys,
        yk_prosessi.dokumentti
WHERE
        kaavaobjekti_alue_taydentava.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue_taydentava AND
        kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays AND
		dokumentti.id = dokumentti_yleiskaava_yhteys.id_dokumentti AND
        kaavaobjekti_alue_taydentava.id = dokumentti_yleiskaava_yhteys.id_kaavaobjekti_alue_taydentava AND
        teema.kuvaus = 'Kartta 1' AND
        teema.id = kaavaobjekti_teema_yhteys.id_teema AND
        kaavaobjekti_alue_taydentava.id = kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue_taydentava
		AND kaavaobjekti_alue_taydentava.version_loppumispvm IS NULL
		AND yleiskaava.nimi = 'Kantakaupungin yleiskaava 2017 - 2021'
		AND yleiskaava.id = kaavaobjekti_alue_taydentava.id_yleiskaava
		AND kaavamaarays.kaavamaarays_otsikko = 'KORKEAAN RAKENTAMISEEN SOVELTUVA VYÖHYKE';

DROP VIEW IF EXISTS yk_yleiskaava.yk049_k1_pistekohteet_point;
CREATE VIEW yk_yleiskaava.yk049_k1_pistekohteet_point AS
SELECT
        row_number() OVER () as rnum,
        kaavaobjekti_piste.geom,
        'Kantakaupungin yleiskaava luonnos, valtuustokausi 2017-2021'::varchar AS "Yleiskaavan nimi",
        kaavamaarays.kaavamaarays_otsikko,
		CASE WHEN kaavamaarays.maaraysteksti IS NOT NULL
                THEN kaavamaarays.maaraysteksti
                ELSE '-'::text
        END
        AS "Määräysteksti",
        '<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021/yleiskaavaluonnos/kaavakartat/kartta-1.html#'::text||kaavamaarays.kaavamaarays_url||'" target="_blank">Määräysteksti ja kuvaus</a>'::text AS "Määräysteksti ja kuvaus",
        '<img src="' || kaavamaarays.karttamerkinta_url || '">'::text AS " Karttamerkintä",
        kaavaobjekti_piste.karttamerkinta_teksti,
		kaavaobjekti_piste.paikan_nimi,
		kaavaobjekti_piste.luokittelu/*,
		CASE WHEN kaavamaarays.kuvaus_teksti IS NOT NULL
                THEN kaavamaarays.kuvaus_teksti
                ELSE '-'::text
        END
        AS "Kuvaus"*/
--      NULL::text AS version_loppumispvm
FROM
        yk_yleiskaava.kaavaobjekti_piste,
        yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
        yk_yleiskaava.kaavamaarays,
        yk_kuvaustekniikka.teema,
        yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
		yk_yleiskaava.yleiskaava
WHERE
        kaavaobjekti_piste.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_piste AND
        kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays AND
        teema.kuvaus = 'Kartta 1' AND
        teema.id = kaavaobjekti_teema_yhteys.id_teema AND
        kaavaobjekti_piste.id = kaavaobjekti_teema_yhteys.id_kaavaobjekti_piste
		AND kaavaobjekti_piste.version_loppumispvm IS NULL
		AND yleiskaava.nimi = 'Kantakaupungin yleiskaava 2017 - 2021'
		AND yleiskaava.id = kaavaobjekti_piste.id_yleiskaava;

DROP VIEW IF EXISTS yk_yleiskaava.yk049_k1_viivakohteet_line;
CREATE VIEW yk_yleiskaava.yk049_k1_viivakohteet_line AS
SELECT
        row_number() OVER () as rnum,
        kaavaobjekti_viiva.geom,
        'Kantakaupungin yleiskaava luonnos, valtuustokausi 2017-2021'::varchar AS "Yleiskaavan nimi",
        kaavamaarays.kaavamaarays_otsikko,
		CASE WHEN kaavamaarays.maaraysteksti IS NOT NULL
                THEN kaavamaarays.maaraysteksti
                ELSE '-'::text
        END
        AS "Määräysteksti",
        '<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021/yleiskaavaluonnos/kaavakartat/kartta-1.html#'::text||kaavamaarays.kaavamaarays_url||'" target="_blank">Määräysteksti ja kuvaus</a>'::text AS "Määräysteksti ja kuvaus",
        '<img src="' || kaavamaarays.karttamerkinta_url || '">'::text AS " Karttamerkintä",
        kaavaobjekti_viiva.karttamerkinta_teksti,
		kaavaobjekti_viiva.paikan_nimi,
		kaavaobjekti_viiva.luokittelu/*,
		CASE WHEN kaavamaarays.kuvaus_teksti IS NOT NULL
                THEN kaavamaarays.kuvaus_teksti
                ELSE '-'::text
        END
        AS "Kuvaus"*/
--      NULL::text AS version_loppumispvm
FROM
        yk_yleiskaava.kaavaobjekti_viiva,
        yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
        yk_yleiskaava.kaavamaarays,
        yk_kuvaustekniikka.teema,
        yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
		yk_yleiskaava.yleiskaava
WHERE
        kaavaobjekti_viiva.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_viiva AND
        kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays AND
        teema.kuvaus = 'Kartta 1' AND
        teema.id = kaavaobjekti_teema_yhteys.id_teema AND
        kaavaobjekti_viiva.id = kaavaobjekti_teema_yhteys.id_kaavaobjekti_viiva
		AND kaavaobjekti_viiva.version_loppumispvm IS NULL
		AND yleiskaava.nimi = 'Kantakaupungin yleiskaava 2017 - 2021'
		AND yleiskaava.id = kaavaobjekti_viiva.id_yleiskaava;

---------------------------------------------

DROP VIEW IF EXISTS yk_yleiskaava.yk049_k2_aluevaraukset_polygon;
CREATE VIEW yk_yleiskaava.yk049_k2_aluevaraukset_polygon AS
SELECT
        row_number() OVER () as rnum,
        kaavaobjekti_alue.geom,
		ST_Centroid(kaavaobjekti_alue.geom) AS referenssipiste_geom,
        'Kantakaupungin yleiskaava luonnos, valtuustokausi 2017-2021'::varchar AS "Yleiskaavan nimi",
        kaavamaarays.kaavamaarays_otsikko,
        CASE WHEN kaavamaarays.maaraysteksti IS NOT NULL
                THEN kaavamaarays.maaraysteksti
                ELSE '-'::text
        END
        AS "Määräysteksti",
        '<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021/yleiskaavaluonnos/kaavakartat/kartta-2.html#'::text||kaavamaarays.kaavamaarays_url||'" target="_blank">Määräysteksti ja kuvaus</a>'::text AS "Määräysteksti ja kuvaus",
        '<img src="' || kaavamaarays.karttamerkinta_url || '">'::text AS " Karttamerkintä",
        kaavaobjekti_alue.karttamerkinta_teksti,
		kaavaobjekti_alue.paikan_nimi,
		kaavaobjekti_alue.luokittelu/*,
		CASE WHEN kaavamaarays.kuvaus_teksti IS NOT NULL
                THEN kaavamaarays.kuvaus_teksti
                ELSE '-'::text
        END
        AS "Kuvaus"*/
--      NULL::text AS version_loppumispvm
FROM
        yk_yleiskaava.kaavaobjekti_alue,
        yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
        yk_yleiskaava.kaavamaarays,
        yk_kuvaustekniikka.teema,
        yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
		yk_yleiskaava.yleiskaava
WHERE
        kaavaobjekti_alue.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue AND
        kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays AND
        teema.kuvaus = 'Kartta 2' AND
        teema.id = kaavaobjekti_teema_yhteys.id_teema AND
        kaavaobjekti_alue.id = kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue
		AND kaavaobjekti_alue.version_loppumispvm IS NULL
		AND yleiskaava.nimi = 'Kantakaupungin yleiskaava 2017 - 2021'
		AND yleiskaava.id = kaavaobjekti_alue.id_yleiskaava;

DROP VIEW IF EXISTS yk_yleiskaava.yk049_k2_taydentavat_aluekohteet_polygon;
CREATE VIEW yk_yleiskaava.yk049_k2_taydentavat_aluekohteet_polygon AS
SELECT
        row_number() OVER () as rnum,
        kaavaobjekti_alue_taydentava.geom,
		ST_Centroid(kaavaobjekti_alue_taydentava.geom) AS referenssipiste_geom,
        'Kantakaupungin yleiskaava luonnos, valtuustokausi 2017-2021'::varchar AS "Yleiskaavan nimi",
        kaavamaarays.kaavamaarays_otsikko,
        CASE WHEN kaavamaarays.maaraysteksti IS NOT NULL
                THEN kaavamaarays.maaraysteksti
                ELSE '-'::text
        END
        AS "Määräysteksti",
        '<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021/yleiskaavaluonnos/kaavakartat/kartta-2.html#'::text||kaavamaarays.kaavamaarays_url||'" target="_blank">Määräysteksti ja kuvaus</a>'::text AS "Määräysteksti ja kuvaus",
        '<img src="' || kaavamaarays.karttamerkinta_url || '">'::text AS " Karttamerkintä",
        kaavaobjekti_alue_taydentava.karttamerkinta_teksti,
		kaavaobjekti_alue_taydentava.paikan_nimi,
		kaavaobjekti_alue_taydentava.luokittelu/*,
		CASE WHEN kaavamaarays.kuvaus_teksti IS NOT NULL
                THEN kaavamaarays.kuvaus_teksti
                ELSE '-'::text
        END
        AS "Kuvaus"*/
--      NULL::text AS version_loppumispvm
FROM
        yk_yleiskaava.kaavaobjekti_alue_taydentava,
        yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
        yk_yleiskaava.kaavamaarays,
        yk_kuvaustekniikka.teema,
        yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
		yk_yleiskaava.yleiskaava
WHERE
        kaavaobjekti_alue_taydentava.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue_taydentava AND
        kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays AND
        teema.kuvaus = 'Kartta 2' AND
        teema.id = kaavaobjekti_teema_yhteys.id_teema AND
        kaavaobjekti_alue_taydentava.id = kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue_taydentava
		AND kaavaobjekti_alue_taydentava.version_loppumispvm IS NULL
		AND yleiskaava.nimi = 'Kantakaupungin yleiskaava 2017 - 2021'
		AND yleiskaava.id = kaavaobjekti_alue_taydentava.id_yleiskaava;

DROP VIEW IF EXISTS yk_yleiskaava.yk049_k2_pistekohteet_point;
CREATE VIEW yk_yleiskaava.yk049_k2_pistekohteet_point AS
SELECT
        row_number() OVER () as rnum,
        kaavaobjekti_piste.geom,
        'Kantakaupungin yleiskaava luonnos, valtuustokausi 2017-2021'::varchar AS "Yleiskaavan nimi",
        kaavamaarays.kaavamaarays_otsikko,
        CASE WHEN kaavamaarays.maaraysteksti IS NOT NULL
                THEN kaavamaarays.maaraysteksti
                ELSE '-'::text
        END
        AS "Määräysteksti",
        '<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021/yleiskaavaluonnos/kaavakartat/kartta-2.html#'::text||kaavamaarays.kaavamaarays_url||'" target="_blank">Määräysteksti ja kuvaus</a>'::text AS "Määräysteksti ja kuvaus",
        '<img src="' || kaavamaarays.karttamerkinta_url || '">'::text AS " Karttamerkintä",
        kaavaobjekti_piste.karttamerkinta_teksti,
		kaavaobjekti_piste.paikan_nimi,
		kaavaobjekti_piste.luokittelu/*,
		CASE WHEN kaavamaarays.kuvaus_teksti IS NOT NULL
                THEN kaavamaarays.kuvaus_teksti
                ELSE '-'::text
        END
        AS "Kuvaus"*/
--      NULL::text AS version_loppumispvm
FROM
        yk_yleiskaava.kaavaobjekti_piste,
        yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
        yk_yleiskaava.kaavamaarays,
        yk_kuvaustekniikka.teema,
        yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
		yk_yleiskaava.yleiskaava
WHERE
        kaavaobjekti_piste.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_piste AND
        kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays AND
        teema.kuvaus = 'Kartta 2' AND
        teema.id = kaavaobjekti_teema_yhteys.id_teema AND
        kaavaobjekti_piste.id = kaavaobjekti_teema_yhteys.id_kaavaobjekti_piste
		AND kaavaobjekti_piste.version_loppumispvm IS NULL
		AND yleiskaava.nimi = 'Kantakaupungin yleiskaava 2017 - 2021'
		AND yleiskaava.id = kaavaobjekti_piste.id_yleiskaava;

DROP VIEW IF EXISTS yk_yleiskaava.yk049_k2_viivakohteet_line;
CREATE VIEW yk_yleiskaava.yk049_k2_viivakohteet_line AS
SELECT
        row_number() OVER () as rnum,
        kaavaobjekti_viiva.geom,
        'Kantakaupungin yleiskaava luonnos, valtuustokausi 2017-2021'::varchar AS "Yleiskaavan nimi",
        kaavamaarays.kaavamaarays_otsikko,
        CASE WHEN kaavamaarays.maaraysteksti IS NOT NULL
                THEN kaavamaarays.maaraysteksti
                ELSE '-'::text
        END
        AS "Määräysteksti",
        '<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021/yleiskaavaluonnos/kaavakartat/kartta-2.html#'::text||kaavamaarays.kaavamaarays_url||'" target="_blank">Määräysteksti ja kuvaus</a>'::text AS "Määräysteksti ja kuvaus",
        '<img src="' || kaavamaarays.karttamerkinta_url || '">'::text AS " Karttamerkintä",
        kaavaobjekti_viiva.karttamerkinta_teksti,
		kaavaobjekti_viiva.paikan_nimi,
		kaavaobjekti_viiva.luokittelu/*,
		CASE WHEN kaavamaarays.kuvaus_teksti IS NOT NULL
                THEN kaavamaarays.kuvaus_teksti
                ELSE '-'::text
        END
        AS "Kuvaus"*/
--      NULL::text AS version_loppumispvm
FROM
        yk_yleiskaava.kaavaobjekti_viiva,
        yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
        yk_yleiskaava.kaavamaarays,
        yk_kuvaustekniikka.teema,
        yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
		yk_yleiskaava.yleiskaava
WHERE
        kaavaobjekti_viiva.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_viiva AND
        kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays AND
        teema.kuvaus = 'Kartta 2' AND
        teema.id = kaavaobjekti_teema_yhteys.id_teema AND
        kaavaobjekti_viiva.id = kaavaobjekti_teema_yhteys.id_kaavaobjekti_viiva
		AND kaavaobjekti_viiva.version_loppumispvm IS NULL
		AND yleiskaava.nimi = 'Kantakaupungin yleiskaava 2017 - 2021'
		AND yleiskaava.id = kaavaobjekti_viiva.id_yleiskaava;

--------------------------------------------------------------------------------

DROP VIEW IF EXISTS yk_yleiskaava.yk049_k3_aluevaraukset_polygon;
CREATE VIEW yk_yleiskaava.yk049_k3_aluevaraukset_polygon AS
SELECT
        row_number() OVER () as rnum,
        kaavaobjekti_alue.geom,
		ST_Centroid(kaavaobjekti_alue.geom) AS referenssipiste_geom,
        'Kantakaupungin yleiskaava luonnos, valtuustokausi 2017-2021'::varchar AS "Yleiskaavan nimi",
        kaavamaarays.kaavamaarays_otsikko,
        CASE WHEN kaavamaarays.maaraysteksti IS NOT NULL
                THEN kaavamaarays.maaraysteksti
                ELSE '-'::text
        END
        AS "Määräysteksti",
        '<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021/yleiskaavaluonnos/kaavakartat/kartta-3.html#'::text||kaavamaarays.kaavamaarays_url||'" target="_blank">Määräysteksti ja kuvaus</a>'::text AS "Määräysteksti ja kuvaus",
        '<img src="' || kaavamaarays.karttamerkinta_url || '">'::text AS " Karttamerkintä",
        kaavaobjekti_alue.karttamerkinta_teksti,
		kaavaobjekti_alue.paikan_nimi,
		kaavaobjekti_alue.luokittelu/*,
		CASE WHEN kaavamaarays.kuvaus_teksti IS NOT NULL
                THEN kaavamaarays.kuvaus_teksti
                ELSE '-'::text
        END
        AS "Kuvaus"*/
--      NULL::text AS version_loppumispvm
FROM
        yk_yleiskaava.kaavaobjekti_alue,
        yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
        yk_yleiskaava.kaavamaarays,
        yk_kuvaustekniikka.teema,
        yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
		yk_yleiskaava.yleiskaava
WHERE
        kaavaobjekti_alue.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue AND
        kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays AND
        teema.kuvaus = 'Kartta 3' AND
        teema.id = kaavaobjekti_teema_yhteys.id_teema AND
        kaavaobjekti_alue.id = kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue
		AND kaavaobjekti_alue.version_loppumispvm IS NULL
		AND yleiskaava.nimi = 'Kantakaupungin yleiskaava 2017 - 2021'
		AND yleiskaava.id = kaavaobjekti_alue.id_yleiskaava;

DROP VIEW IF EXISTS yk_yleiskaava.yk049_k3_taydentavat_aluekohteet_polygon;
CREATE VIEW yk_yleiskaava.yk049_k3_taydentavat_aluekohteet_polygon AS
SELECT
        row_number() OVER () as rnum,
        kaavaobjekti_alue_taydentava.geom,
		ST_Centroid(kaavaobjekti_alue_taydentava.geom) AS referenssipiste_geom,
        'Kantakaupungin yleiskaava luonnos, valtuustokausi 2017-2021'::varchar AS "Yleiskaavan nimi",
        kaavamaarays.kaavamaarays_otsikko,
        CASE WHEN kaavamaarays.maaraysteksti IS NOT NULL
                THEN kaavamaarays.maaraysteksti
                ELSE '-'::text
        END
        AS "Määräysteksti",
        '<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021/yleiskaavaluonnos/kaavakartat/kartta-3.html#'::text||kaavamaarays.kaavamaarays_url||'" target="_blank">Määräysteksti ja kuvaus</a>'::text AS "Määräysteksti ja kuvaus",
        '<img src="' || kaavamaarays.karttamerkinta_url || '">'::text AS " Karttamerkintä",
        kaavaobjekti_alue_taydentava.karttamerkinta_teksti,
        	kaavaobjekti_alue_taydentava.luokittelu,
		kaavaobjekti_alue_taydentava.paikan_nimi/*,
		CASE WHEN kaavamaarays.kuvaus_teksti IS NOT NULL
                THEN kaavamaarays.kuvaus_teksti
                ELSE '-'::text
        END
        AS "Kuvaus"*/
--      NULL::text AS version_loppumispvm
FROM
        yk_yleiskaava.kaavaobjekti_alue_taydentava,
        yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
        yk_yleiskaava.kaavamaarays,
        yk_kuvaustekniikka.teema,
        yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
		yk_yleiskaava.yleiskaava
WHERE
        kaavaobjekti_alue_taydentava.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue_taydentava AND
        kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays AND
        teema.kuvaus = 'Kartta 3' AND
        teema.id = kaavaobjekti_teema_yhteys.id_teema AND
        kaavaobjekti_alue_taydentava.id = kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue_taydentava
		AND kaavaobjekti_alue_taydentava.version_loppumispvm IS NULL
		AND yleiskaava.nimi = 'Kantakaupungin yleiskaava 2017 - 2021'
		AND yleiskaava.id = kaavaobjekti_alue_taydentava.id_yleiskaava;

/*DROP INDEX IF EXISTS yk_prosessi.lahtoaineisto_yleiskaava_yhteys_id_kaavaobjekti_piste_index;
CREATE INDEX lahtoaineisto_yleiskaava_yhteys_id_kaavaobjekti_piste_index ON yk_prosessi.lahtoaineisto_yleiskaava_yhteys(id_kaavaobjekti_piste);*/

DROP VIEW IF EXISTS yk_yleiskaava.yk049_k3_pistekohteet_point_lahtoaineistolinkilla;
CREATE VIEW yk_yleiskaava.yk049_k3_pistekohteet_point_lahtoaineistolinkilla AS
SELECT
        row_number() OVER () as rnum,
        kaavaobjekti_piste.geom,
        'Kantakaupungin yleiskaava luonnos, valtuustokausi 2017-2021'::varchar AS "Yleiskaavan nimi",
        kaavamaarays.kaavamaarays_otsikko,
        CASE WHEN kaavamaarays.maaraysteksti IS NOT NULL
                THEN kaavamaarays.maaraysteksti
                ELSE '-'::text
        END
        AS "Määräysteksti",
        '<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021/yleiskaavaluonnos/kaavakartat/kartta-3.html#'::text||kaavamaarays.kaavamaarays_url||'" target="_blank">Määräysteksti ja kuvaus</a>'::text AS "Määräysteksti ja kuvaus",
        '<img src="' || kaavamaarays.karttamerkinta_url || '">'::text AS " Karttamerkintä",
        kaavaobjekti_piste.karttamerkinta_teksti,
        kaavaobjekti_piste.luokittelu,
        CASE
			WHEN lahtoaineisto.linkki_data IS NOT NULL
                THEN
 					CASE
                        WHEN lahtoaineisto.linkitys_tyyppi = 'museovirasto'
                            THEN
                                '<a href="'::text || lahtoaineisto.linkki_data || '" target="_blank">Lisätietoja Museoviraston Kulttuuriympäristön palveluikkunassa</a>'::text
                        WHEN lahtoaineisto.linkitys_tyyppi = 'tre_siiri'
                            THEN
                                '<a href="'::text || lahtoaineisto.linkki_data || '" target="_blank">Lisätietoja Tampereen museoiden ja pirkanmaalaisten paikallismuseoiden Siiri-tietopalvelussa</a>'::text
                        ELSE ''::text
                    END 
            ELSE ''::text
        END AS "Linkki kohteeseen",
        kaavaobjekti_piste.paikan_nimi,
        kaavaobjekti_piste.lisatieto
        /*,
		CASE WHEN kaavamaarays.kuvaus_teksti IS NOT NULL
                THEN kaavamaarays.kuvaus_teksti
                ELSE '-'::text
        END
        AS "Kuvaus"*/
--      NULL::text AS version_loppumispvm
FROM
        yk_yleiskaava.kaavaobjekti_piste,
        yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
        yk_yleiskaava.kaavamaarays,
        yk_kuvaustekniikka.teema,
        yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
        yk_yleiskaava.yleiskaava,
        yk_prosessi.lahtoaineisto_yleiskaava_yhteys,
        yk_prosessi.lahtoaineisto
WHERE
        kaavaobjekti_piste.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_piste AND
        kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays AND
        lahtoaineisto.id = lahtoaineisto_yleiskaava_yhteys.id_lahtoaineisto AND
        kaavaobjekti_piste.id = lahtoaineisto_yleiskaava_yhteys.id_kaavaobjekti_piste AND
        teema.kuvaus = 'Kartta 3' AND
        teema.id = kaavaobjekti_teema_yhteys.id_teema AND
        kaavaobjekti_piste.id = kaavaobjekti_teema_yhteys.id_kaavaobjekti_piste
		AND kaavaobjekti_piste.version_loppumispvm IS NULL
		AND yleiskaava.nimi = 'Kantakaupungin yleiskaava 2017 - 2021'
		AND yleiskaava.id = kaavaobjekti_piste.id_yleiskaava AND
        (kaavamaarays.kaavamaarays_otsikko LIKE 'MUINAISJÄÄNNÖSKOHDE%' OR kaavamaarays.kaavamaarays_otsikko LIKE 'MUU ARKEOLOGINEN KULTTUURIPERINTÖKOHDE%');

DROP VIEW IF EXISTS yk_yleiskaava.yk049_k3_pistekohteet_point_ei_lahtoaineistolinkilla;
CREATE VIEW yk_yleiskaava.yk049_k3_pistekohteet_point_ei_lahtoaineistolinkilla AS
SELECT
        row_number() OVER () as rnum,
        kaavaobjekti_piste.geom,
        'Kantakaupungin yleiskaava luonnos, valtuustokausi 2017-2021'::varchar AS "Yleiskaavan nimi",
        kaavamaarays.kaavamaarays_otsikko,
        /*kaavaobjekti_piste.lisatieto,*/
        CASE WHEN kaavamaarays.maaraysteksti IS NOT NULL
                THEN kaavamaarays.maaraysteksti
                ELSE '-'::text
        END
        AS "Määräysteksti",
        '<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021/yleiskaavaluonnos/kaavakartat/kartta-3.html#'::text||kaavamaarays.kaavamaarays_url||'" target="_blank">Määräysteksti ja kuvaus</a>'::text AS "Määräysteksti ja kuvaus",
        '<img src="' || kaavamaarays.karttamerkinta_url || '">'::text AS " Karttamerkintä",
        kaavaobjekti_piste.karttamerkinta_teksti,
        kaavaobjekti_piste.luokittelu,
        kaavaobjekti_piste.paikan_nimi
        /*,
		CASE WHEN kaavamaarays.kuvaus_teksti IS NOT NULL
                THEN kaavamaarays.kuvaus_teksti
                ELSE '-'::text
        END
        AS "Kuvaus"*/
--      NULL::text AS version_loppumispvm
FROM
        yk_yleiskaava.kaavaobjekti_piste,
        yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
        yk_yleiskaava.kaavamaarays,
        yk_kuvaustekniikka.teema,
        yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
        yk_yleiskaava.yleiskaava
WHERE
        kaavaobjekti_piste.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_piste AND
        kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays AND
        teema.kuvaus = 'Kartta 3' AND
        teema.id = kaavaobjekti_teema_yhteys.id_teema AND
        kaavaobjekti_piste.id = kaavaobjekti_teema_yhteys.id_kaavaobjekti_piste
		AND kaavaobjekti_piste.version_loppumispvm IS NULL
		AND yleiskaava.nimi = 'Kantakaupungin yleiskaava 2017 - 2021'
		AND yleiskaava.id = kaavaobjekti_piste.id_yleiskaava AND
        kaavamaarays.kaavamaarays_otsikko NOT LIKE 'MUINAISJÄÄNNÖSKOHDE%' AND kaavamaarays.kaavamaarays_otsikko NOT LIKE 'MUU ARKEOLOGINEN KULTTUURIPERINTÖKOHDE%';

DROP VIEW IF EXISTS yk_yleiskaava.yk049_k3_viivakohteet_line;
CREATE VIEW yk_yleiskaava.yk049_k3_viivakohteet_line AS
SELECT
        row_number() OVER () as rnum,
        kaavaobjekti_viiva.geom,
        'Kantakaupungin yleiskaava luonnos, valtuustokausi 2017-2021'::varchar AS "Yleiskaavan nimi",
        kaavamaarays.kaavamaarays_otsikko,
        CASE WHEN kaavamaarays.maaraysteksti IS NOT NULL
                THEN kaavamaarays.maaraysteksti
                ELSE '-'::text
        END
        AS "Määräysteksti",
        '<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021/yleiskaavaluonnos/kaavakartat/kartta-3.html#'::text||kaavamaarays.kaavamaarays_url||'" target="_blank">Määräysteksti ja kuvaus</a>'::text AS "Määräysteksti ja kuvaus",
        '<img src="' || kaavamaarays.karttamerkinta_url || '">'::text AS " Karttamerkintä",
        kaavaobjekti_viiva.karttamerkinta_teksti,
		kaavaobjekti_viiva.paikan_nimi,
		kaavaobjekti_viiva.luokittelu/*,
		CASE WHEN kaavamaarays.kuvaus_teksti IS NOT NULL
                THEN kaavamaarays.kuvaus_teksti
                ELSE '-'::text
        END
        AS "Kuvaus"*/
--      NULL::text AS version_loppumispvm
FROM
        yk_yleiskaava.kaavaobjekti_viiva,
        yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
        yk_yleiskaava.kaavamaarays,
        yk_kuvaustekniikka.teema,
        yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
		yk_yleiskaava.yleiskaava
WHERE
        kaavaobjekti_viiva.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_viiva AND
        kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays AND
        teema.kuvaus = 'Kartta 3' AND
        teema.id = kaavaobjekti_teema_yhteys.id_teema AND
        kaavaobjekti_viiva.id = kaavaobjekti_teema_yhteys.id_kaavaobjekti_viiva
		AND kaavaobjekti_viiva.version_loppumispvm IS NULL
		AND yleiskaava.nimi = 'Kantakaupungin yleiskaava 2017 - 2021'
		AND yleiskaava.id = kaavaobjekti_viiva.id_yleiskaava;

--------------------------------------------------------------------------------

DROP VIEW IF EXISTS yk_yleiskaava.yk049_k4_aluevaraukset_polygon;
CREATE VIEW yk_yleiskaava.yk049_k4_aluevaraukset_polygon AS
SELECT
        row_number() OVER () as rnum,
        kaavaobjekti_alue.geom,
		ST_Centroid(kaavaobjekti_alue.geom) AS referenssipiste_geom,
        'Kantakaupungin yleiskaava luonnos, valtuustokausi 2017-2021'::varchar AS "Yleiskaavan nimi",
        kaavamaarays.kaavamaarays_otsikko,
        CASE WHEN kaavamaarays.maaraysteksti IS NOT NULL
                THEN kaavamaarays.maaraysteksti
                ELSE '-'::text
        END
        AS "Määräysteksti",
        '<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021/yleiskaavaluonnos/kaavakartat/kartta-4.html#'::text||kaavamaarays.kaavamaarays_url||'" target="_blank">Määräysteksti ja kuvaus</a>'::text AS "Määräysteksti ja kuvaus",
        '<img src="' || kaavamaarays.karttamerkinta_url || '">'::text AS " Karttamerkintä",
        kaavaobjekti_alue.karttamerkinta_teksti,
		kaavaobjekti_alue.paikan_nimi,
		kaavaobjekti_alue.luokittelu/*,
		CASE WHEN kaavamaarays.kuvaus_teksti IS NOT NULL
                THEN kaavamaarays.kuvaus_teksti
                ELSE '-'::text
        END
        AS "Kuvaus"*/
--      NULL::text AS version_loppumispvm
FROM
        yk_yleiskaava.kaavaobjekti_alue,
        yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
        yk_yleiskaava.kaavamaarays,
        yk_kuvaustekniikka.teema,
        yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
		yk_yleiskaava.yleiskaava
WHERE
        kaavaobjekti_alue.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue AND
        kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays AND
        teema.kuvaus = 'Kartta 4' AND
        teema.id = kaavaobjekti_teema_yhteys.id_teema AND
        kaavaobjekti_alue.id = kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue
		AND kaavaobjekti_alue.version_loppumispvm IS NULL
		AND yleiskaava.nimi = 'Kantakaupungin yleiskaava 2017 - 2021'
		AND yleiskaava.id = kaavaobjekti_alue.id_yleiskaava;

DROP VIEW IF EXISTS yk_yleiskaava.yk049_k4_taydentavat_aluekohteet_polygon;
CREATE VIEW yk_yleiskaava.yk049_k4_taydentavat_aluekohteet_polygon AS
SELECT
        row_number() OVER () as rnum,
        kaavaobjekti_alue_taydentava.geom,
		ST_Centroid(kaavaobjekti_alue_taydentava.geom) AS referenssipiste_geom,
        'Kantakaupungin yleiskaava luonnos, valtuustokausi 2017-2021'::varchar AS "Yleiskaavan nimi",
        kaavamaarays.kaavamaarays_otsikko,
        CASE WHEN kaavamaarays.maaraysteksti IS NOT NULL
                THEN kaavamaarays.maaraysteksti
                ELSE '-'::text
        END
        AS "Määräysteksti",
        '<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021/yleiskaavaluonnos/kaavakartat/kartta-4.html#'::text||kaavamaarays.kaavamaarays_url||'" target="_blank">Määräysteksti ja kuvaus</a>'::text AS "Määräysteksti ja kuvaus",
        '<img src="' || kaavamaarays.karttamerkinta_url || '">'::text AS " Karttamerkintä",
        kaavaobjekti_alue_taydentava.karttamerkinta_teksti,
        	kaavaobjekti_alue_taydentava.luokittelu,
                kaavaobjekti_alue_taydentava.lisatieto,
		kaavaobjekti_alue_taydentava.paikan_nimi/*,
		CASE WHEN kaavamaarays.kuvaus_teksti IS NOT NULL
                THEN kaavamaarays.kuvaus_teksti
                ELSE '-'::text
        END
        AS "Kuvaus"*/
--      NULL::text AS version_loppumispvm
FROM
        yk_yleiskaava.kaavaobjekti_alue_taydentava,
        yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
        yk_yleiskaava.kaavamaarays,
        yk_kuvaustekniikka.teema,
        yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
		yk_yleiskaava.yleiskaava
WHERE
        kaavaobjekti_alue_taydentava.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_alue_taydentava AND
        kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays AND
        teema.kuvaus = 'Kartta 4' AND
        teema.id = kaavaobjekti_teema_yhteys.id_teema AND
        kaavaobjekti_alue_taydentava.id = kaavaobjekti_teema_yhteys.id_kaavaobjekti_alue_taydentava
		AND kaavaobjekti_alue_taydentava.version_loppumispvm IS NULL
		AND yleiskaava.nimi = 'Kantakaupungin yleiskaava 2017 - 2021'
		AND yleiskaava.id = kaavaobjekti_alue_taydentava.id_yleiskaava;

DROP VIEW IF EXISTS yk_yleiskaava.yk049_k4_pistekohteet_point;
CREATE VIEW yk_yleiskaava.yk049_k4_pistekohteet_point AS
SELECT
        row_number() OVER () as rnum,
        kaavaobjekti_piste.geom,
        'Kantakaupungin yleiskaava luonnos, valtuustokausi 2017-2021'::varchar AS "Yleiskaavan nimi",
        kaavamaarays.kaavamaarays_otsikko,
        CASE WHEN kaavamaarays.maaraysteksti IS NOT NULL
                THEN kaavamaarays.maaraysteksti
                ELSE '-'::text
        END
        AS "Määräysteksti",
        '<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021/yleiskaavaluonnos/kaavakartat/kartta-4.html#'::text||kaavamaarays.kaavamaarays_url||'" target="_blank">Määräysteksti ja kuvaus</a>'::text AS "Määräysteksti ja kuvaus",
        '<img src="' || kaavamaarays.karttamerkinta_url || '">'::text AS " Karttamerkintä",
        kaavaobjekti_piste.karttamerkinta_teksti,
		kaavaobjekti_piste.paikan_nimi,
		kaavaobjekti_piste.luokittelu/*,
		CASE WHEN kaavamaarays.kuvaus_teksti IS NOT NULL
                THEN kaavamaarays.kuvaus_teksti
                ELSE '-'::text
        END
        AS "Kuvaus"*/
--      NULL::text AS version_loppumispvm
FROM
        yk_yleiskaava.kaavaobjekti_piste,
        yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
        yk_yleiskaava.kaavamaarays,
        yk_kuvaustekniikka.teema,
        yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
		yk_yleiskaava.yleiskaava
WHERE
        kaavaobjekti_piste.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_piste AND
        kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays AND
        teema.kuvaus = 'Kartta 4' AND
        teema.id = kaavaobjekti_teema_yhteys.id_teema AND
        kaavaobjekti_piste.id = kaavaobjekti_teema_yhteys.id_kaavaobjekti_piste
		AND kaavaobjekti_piste.version_loppumispvm IS NULL
		AND yleiskaava.nimi = 'Kantakaupungin yleiskaava 2017 - 2021'
		AND yleiskaava.id = kaavaobjekti_piste.id_yleiskaava;

DROP VIEW IF EXISTS yk_yleiskaava.yk049_k4_viivakohteet_line;
CREATE VIEW yk_yleiskaava.yk049_k4_viivakohteet_line AS
SELECT
        row_number() OVER () as rnum,
        kaavaobjekti_viiva.geom,
        'Kantakaupungin yleiskaava luonnos, valtuustokausi 2017-2021'::varchar AS "Yleiskaavan nimi",
        kaavamaarays.kaavamaarays_otsikko,
        CASE WHEN kaavamaarays.maaraysteksti IS NOT NULL
                THEN kaavamaarays.maaraysteksti
                ELSE '-'::text
        END
        AS "Määräysteksti",
        '<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021/yleiskaavaluonnos/kaavakartat/kartta-4.html#'::text||kaavamaarays.kaavamaarays_url||'" target="_blank">Määräysteksti ja kuvaus</a>'::text AS "Määräysteksti ja kuvaus",
        '<img src="' || kaavamaarays.karttamerkinta_url || '">'::text AS " Karttamerkintä",
        kaavaobjekti_viiva.karttamerkinta_teksti,
		kaavaobjekti_viiva.paikan_nimi,
		kaavaobjekti_viiva.luokittelu/*,
		CASE WHEN kaavamaarays.kuvaus_teksti IS NOT NULL
                THEN kaavamaarays.kuvaus_teksti
                ELSE '-'::text
        END
        AS "Kuvaus"*/
--      NULL::text AS version_loppumispvm
FROM
        yk_yleiskaava.kaavaobjekti_viiva,
        yk_yleiskaava.kaavaobjekti_kaavamaarays_yhteys,
        yk_yleiskaava.kaavamaarays,
        yk_kuvaustekniikka.teema,
        yk_kuvaustekniikka.kaavaobjekti_teema_yhteys,
		yk_yleiskaava.yleiskaava
WHERE
        kaavaobjekti_viiva.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavaobjekti_viiva AND
        kaavamaarays.id = kaavaobjekti_kaavamaarays_yhteys.id_kaavamaarays AND
        teema.kuvaus = 'Kartta 4' AND
        teema.id = kaavaobjekti_teema_yhteys.id_teema AND
        kaavaobjekti_viiva.id = kaavaobjekti_teema_yhteys.id_kaavaobjekti_viiva
		AND kaavaobjekti_viiva.version_loppumispvm IS NULL
		AND yleiskaava.nimi = 'Kantakaupungin yleiskaava 2017 - 2021'
		AND yleiskaava.id = kaavaobjekti_viiva.id_yleiskaava;

--------------------------------------------------------------------------------



GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA yk_yleiskaava, yk_koodiluettelot, yk_kuvaustekniikka, yk_suunnitteluparametrit, yk_prosessi, yk_mitoitus_varanto, yk_metatiedot, yk_inspire, yk_geoserver, yk_muutos TO avoin_yleiskaava;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA yk_yleiskaava, yk_koodiluettelot, yk_kuvaustekniikka, yk_suunnitteluparametrit, yk_prosessi, yk_mitoitus_varanto, yk_metatiedot, yk_inspire, yk_geoserver, yk_muutos TO avoin_yleiskaava;

--GRANT SELECT ON ALL TABLES IN SCHEMA yk_yleiskaava, yk_koodiluettelot, yk_kuvaustekniikka, yk_suunnitteluparametrit, yk_prosessi, yk_mitoitus_varanto, yk_metatiedot, yk_inspire, yk_geoserver TO gispo;
--GRANT SELECT ON ALL SEQUENCES IN SCHEMA yk_yleiskaava, yk_koodiluettelot, yk_kuvaustekniikka, yk_suunnitteluparametrit, yk_prosessi, yk_mitoitus_varanto, yk_metatiedot, yk_inspire, yk_geoserver TO gispo;



