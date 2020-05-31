
DROP VIEW IF EXISTS yk_yleiskaava.yk049_k1_kaavan_ulkorajaus;
CREATE VIEW yk_yleiskaava.yk049_k1_kaavan_ulkorajaus AS
SELECT
    yleiskaava.nimi AS "Yleiskaavan nimi",
	teema.kuvaus || ' - ' || teema.nimi  AS "Kartta",
	kaavan_ulkorajaus AS geom,
	'YLEISMÄÄRÄYKSET'::text AS yleismaarays_otsikko,
	(SELECT string_agg('<p>' || maaraysteksti || '<p>', '<br>')
	 FROM
		(
		SELECT maaraysteksti
		FROM yk_yleiskaava.yleismaarays, yk_kuvaustekniikka.teema, yk_kuvaustekniikka.yleismaarays_teema_yhteys
		WHERE
		teema.kuvaus = 'Kartta 1' AND
		yleismaarays_teema_yhteys.id_teema = teema.id AND
		yleismaarays.id = yleismaarays_teema_yhteys.id_yleismaarays		
		ORDER BY jarjestys_nro) AS maaraystekstit
	) AS "Yleismääräykset",
	'<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021/yleiskaavaluonnos/kaavakartat/kartta-1.html#yleismaarays" target="_blank">Määräysteksti ja kuvaus</a>'::text AS "Määräysteksti ja kuvaus",
	'<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021.html" target="_blank">Kantakaupungin yleiskaava 2017 - 2021</a>'::text AS "Kaavan WWW-sivu",
	--'<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/pohjois-tampere.html" target="_blank">Kaavaselostus</a>'::text AS "Linkki selostukseen",
    --'<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/pohjois-tampere.html" target="_blank">Yleismääräystekstit ja kuvaukset</a>'::text AS "Linkki kuvauksiin",
	'<img src="' || yleiskaava.karttamerkinta_url || '">' AS "Yleiskaava-alueen raja"
FROM yk_yleiskaava.yleiskaava, yk_kuvaustekniikka.teema
WHERE teema.kuvaus = 'Kartta 1';

DROP VIEW IF EXISTS yk_yleiskaava.yk049_k2_kaavan_ulkorajaus;
CREATE VIEW yk_yleiskaava.yk049_k2_kaavan_ulkorajaus AS
SELECT
    yleiskaava.nimi AS "Yleiskaavan nimi",
	teema.kuvaus || ' - ' || teema.nimi  AS "Kartta",
	kaavan_ulkorajaus AS geom,
	'YLEISMÄÄRÄYKSET'::text AS yleismaarays_otsikko,
	(SELECT string_agg('<p>' || maaraysteksti || '<p>', '<br>')
	 FROM
		(
		SELECT maaraysteksti
		FROM yk_yleiskaava.yleismaarays, yk_kuvaustekniikka.teema, yk_kuvaustekniikka.yleismaarays_teema_yhteys
		WHERE
		teema.kuvaus = 'Kartta 2' AND
		yleismaarays_teema_yhteys.id_teema = teema.id AND
		yleismaarays.id = yleismaarays_teema_yhteys.id_yleismaarays		
		ORDER BY jarjestys_nro) AS maaraystekstit
	) AS "Yleismääräykset",
	'<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021/yleiskaavaluonnos/kaavakartat/kartta-2.html#yleismaarays" target="_blank">Määräysteksti ja kuvaus</a>'::text AS "Määräysteksti ja kuvaus",
	'<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021.html" target="_blank">Kantakaupungin yleiskaava 2017 - 2021</a>'::text AS "Kaavan WWW-sivu",
	--'<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/pohjois-tampere.html" target="_blank">Kaavaselostus</a>'::text AS "Linkki selostukseen",
    --'<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/pohjois-tampere.html" target="_blank">Yleismääräystekstit ja kuvaukset</a>'::text AS "Linkki kuvauksiin",
	'<img src="' || yleiskaava.karttamerkinta_url || '">' AS "Yleiskaava-alueen raja"
FROM yk_yleiskaava.yleiskaava, yk_kuvaustekniikka.teema
WHERE teema.kuvaus = 'Kartta 2';

DROP VIEW IF EXISTS yk_yleiskaava.yk049_k3_kaavan_ulkorajaus;
CREATE VIEW yk_yleiskaava.yk049_k3_kaavan_ulkorajaus AS
SELECT
    yleiskaava.nimi AS "Yleiskaavan nimi",
	teema.kuvaus || ' - ' || teema.nimi  AS "Kartta",
	kaavan_ulkorajaus AS geom,
	'YLEISMÄÄRÄYKSET'::text AS yleismaarays_otsikko,
	(SELECT string_agg('<p>' || maaraysteksti || '<p>', '<br>')
	 FROM
		(
		SELECT maaraysteksti
		FROM yk_yleiskaava.yleismaarays, yk_kuvaustekniikka.teema, yk_kuvaustekniikka.yleismaarays_teema_yhteys
		WHERE
		teema.kuvaus = 'Kartta 3' AND
		yleismaarays_teema_yhteys.id_teema = teema.id AND
		yleismaarays.id = yleismaarays_teema_yhteys.id_yleismaarays		
		ORDER BY jarjestys_nro) AS maaraystekstit
	) AS "Yleismääräykset",
	'<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021/yleiskaavaluonnos/kaavakartat/kartta-3.html#yleismaarays" target="_blank">Määräysteksti ja kuvaus</a>'::text AS "Määräysteksti ja kuvaus",
	'<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021.html" target="_blank">Kantakaupungin yleiskaava 2017 - 2021</a>'::text AS "Kaavan WWW-sivu",
	--'<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/pohjois-tampere.html" target="_blank">Kaavaselostus</a>'::text AS "Linkki selostukseen",
    --'<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/pohjois-tampere.html" target="_blank">Yleismääräystekstit ja kuvaukset</a>'::text AS "Linkki kuvauksiin",
	'<img src="' || yleiskaava.karttamerkinta_url || '">' AS "Yleiskaava-alueen raja"
FROM yk_yleiskaava.yleiskaava, yk_kuvaustekniikka.teema
WHERE teema.kuvaus = 'Kartta 3';

DROP VIEW IF EXISTS yk_yleiskaava.yk049_k4_kaavan_ulkorajaus;
CREATE VIEW yk_yleiskaava.yk049_k4_kaavan_ulkorajaus AS
SELECT
    yleiskaava.nimi AS "Yleiskaavan nimi",
	teema.kuvaus || ' - ' || teema.nimi  AS "Kartta",
	kaavan_ulkorajaus AS geom,
	'YLEISMÄÄRÄYKSET'::text AS yleismaarays_otsikko,
	(SELECT string_agg('<p>' || maaraysteksti || '<p>', '<br>')
	 FROM
		(
		SELECT maaraysteksti
		FROM yk_yleiskaava.yleismaarays, yk_kuvaustekniikka.teema, yk_kuvaustekniikka.yleismaarays_teema_yhteys
		WHERE
		teema.kuvaus = 'Kartta 4' AND
		yleismaarays_teema_yhteys.id_teema = teema.id AND
		yleismaarays.id = yleismaarays_teema_yhteys.id_yleismaarays		
		ORDER BY jarjestys_nro) AS maaraystekstit
	) AS "Yleismääräykset",
	'<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021/yleiskaavaluonnos/kaavakartat/kartta-4.html#yleismaaraykset" target="_blank">Määräysteksti ja kuvaus</a>'::text AS "1. Määräysteksti ja kuvaus",
	'<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021/yleiskaavaluonnos/kaavakartat/kartta-4.html#ymparistoterveys" target="_blank">Määräysteksti ja kuvaus</a>'::text AS "2. Määräysteksti ja kuvaus",
	'<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021/yleiskaavaluonnos/kaavakartat/kartta-4.html#jatehuolto" target="_blank">Määräysteksti ja kuvaus</a>'::text AS "3. Määräysteksti ja kuvaus",
	'<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/kantakaupungin-yleiskaava-2017-2021.html" target="_blank">Kantakaupungin yleiskaava 2017 - 2021</a>'::text AS "Kaavan WWW-sivu",
	--'<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/pohjois-tampere.html" target="_blank">Kaavaselostus</a>'::text AS "Linkki selostukseen",
    --'<a href="https://www.tampere.fi/asuminen-ja-ymparisto/kaavoitus/yleiskaavoitus/pohjois-tampere.html" target="_blank">Yleismääräystekstit ja kuvaukset</a>'::text AS "Linkki kuvauksiin",
	'<img src="' || yleiskaava.karttamerkinta_url || '">' AS "Yleiskaava-alueen raja"
FROM yk_yleiskaava.yleiskaava, yk_kuvaustekniikka.teema
WHERE teema.kuvaus = 'Kartta 4';


GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA yk_yleiskaava, yk_koodiluettelot, yk_kuvaustekniikka, yk_suunnitteluparametrit, yk_prosessi, yk_mitoitus_varanto, yk_metatiedot, yk_inspire, yk_tarkistus TO avoin_yleiskaava;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA yk_yleiskaava, yk_koodiluettelot, yk_kuvaustekniikka, yk_suunnitteluparametrit, yk_prosessi, yk_mitoitus_varanto, yk_metatiedot, yk_inspire, yk_tarkistus TO avoin_yleiskaava;

