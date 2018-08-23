<!-- Tampereen kaupunki yleiskaavoitus, sld-tyylin testiversio tietomalli KDYK hankkeeseen. Tyylissä on kuvailtu yleiskaavan maankäytön käyttötarkoitusalueet Tampereen kantakaupungin alueelta-->
<!-- Jussi Tahvanainen, Tampereen kaupunki-->
<!-- luotu 19.6.2018 -->
<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.1.0" xmlns:xlink="http://www.w3.org/1999/xlink" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:se="http://www.opengis.net/se">
  <NamedLayer>
    <se:Name>Yhdyskuntarakenne_käyttötarkoitusalueet</se:Name>
    <UserStyle>
      <se:Name>Yhdyskuntarakenne_käyttötarkoitusalueet</se:Name>
      <se:FeatureTypeStyle>
        <se:Rule>
          <se:Name>ASUMISEN ALUE</se:Name>
          <se:Description>
            <se:Title>ASUMISEN ALUE</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>ASUMISEN ALUE</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:SvgParameter name="fill">#d1b5ad</se:SvgParameter>
              <se:SvgParameter name="fill-opacity">0.80</se:SvgParameter>
            </se:Fill>
            <se:Stroke>
              <se:SvgParameter name="stroke">#d1b5ad</se:SvgParameter>
              <se:SvgParameter name="stroke-opacity">0.60</se:SvgParameter>
              <se:SvgParameter name="stroke-width">0.26</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>ASUMISEN JA VIRKISTYKSEN SEKOITTUNUT ALUE</se:Name>
          <se:Description>
            <se:Title>ASUMISEN JA VIRKISTYKSEN SEKOITTUNUT ALUE</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>ASUMISEN JA VIRKISTYKSEN SEKOITTUNUT ALUE</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:SvgParameter name="fill">#cfb2aa</se:SvgParameter>
              <se:SvgParameter name="fill-opacity">0.80</se:SvgParameter>
            </se:Fill>
            <se:Stroke>
              <se:SvgParameter name="stroke">#000000</se:SvgParameter>
              <se:SvgParameter name="stroke-opacity">0.00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:GraphicFill>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>shape://slash</se:WellKnownName>
                    <se:Stroke>
                      <se:SvgParameter name="stroke">#c7e4be</se:SvgParameter>
                      <se:SvgParameter name="stroke-width">2</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>10</se:Size>
                  <se:Rotation>0</se:Rotation>
                </se:Graphic>
              </se:GraphicFill>
            </se:Fill>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>KESKUSPUISTOVERKOSTO</se:Name>
          <se:Description>
            <se:Title>KESKUSPUISTOVERKOSTO</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>KESKUSPUISTOVERKOSTO</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:SvgParameter name="fill">#c7e4be</se:SvgParameter>
              <se:SvgParameter name="fill-opacity">0.80</se:SvgParameter>
            </se:Fill>
            <se:Stroke>
              <se:SvgParameter name="stroke">#000000</se:SvgParameter>
              <se:SvgParameter name="stroke-opacity">0.00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">0.06</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>KESKUSTATOIMINTOJEN ALUE</se:Name>
          <se:Description>
            <se:Title>KESKUSTATOIMINTOJEN ALUE</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>KESKUSTATOIMINTOJEN ALUE</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:SvgParameter name="fill">#f5919b</se:SvgParameter>
              <se:SvgParameter name="fill-opacity">0.80</se:SvgParameter>
            </se:Fill>
            <se:Stroke>
              <se:SvgParameter name="stroke">#f5919b</se:SvgParameter>
              <se:SvgParameter name="stroke-width">0.26</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>LOMA-ASUNTOALUE</se:Name>
          <se:Description>
            <se:Title>LOMA-ASUNTOALUE</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>LOMA-ASUNTOALUE</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:SvgParameter name="fill">#f6ed35</se:SvgParameter>
              <se:SvgParameter name="fill-opacity">0.80</se:SvgParameter>
            </se:Fill>
            <se:Stroke>
              <se:SvgParameter name="stroke">#f6ed35</se:SvgParameter>
              <se:SvgParameter name="stroke-width">0.26</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>LUONNONSUOJELUALUE TAI -KOHDE</se:Name>
          <se:Description>
            <se:Title>LUONNONSUOJELUALUE TAI -KOHDE</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>LUONNONSUOJELUALUE TAI -KOHDE</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:SvgParameter name="fill">#4cc3d4</se:SvgParameter>
              <se:SvgParameter name="fill-opacity">0.80</se:SvgParameter>
            </se:Fill>
            <se:Stroke>
              <se:SvgParameter name="stroke">#000000</se:SvgParameter>
              <se:SvgParameter name="stroke-opacity">0.00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">0.26</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>PALVELUJEN JA TYÖPAIKKOJEN SEKOITTUNUT ALUE</se:Name>
          <se:Description>
            <se:Title>PALVELUJEN JA TYÖPAIKKOJEN SEKOITTUNUT ALUE</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>PALVELUJEN JA TYÖPAIKKOJEN SEKOITTUNUT ALUE</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:SvgParameter name="fill">#ebcb80</se:SvgParameter>
              <se:SvgParameter name="fill-opacity">0.80</se:SvgParameter>
            </se:Fill>
            <se:Stroke>
              <se:SvgParameter name="stroke">#ebcb80</se:SvgParameter>
              <se:SvgParameter name="stroke-width">0.26</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>PUOLUSTUSVOIMIEN ALUE</se:Name>
          <se:Description>
            <se:Title>PUOLUSTUSVOIMIEN ALUE</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>PUOLUSTUSVOIMIEN ALUE</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:SvgParameter name="fill">#deabce</se:SvgParameter>
              <se:SvgParameter name="fill-opacity">0.80</se:SvgParameter>
            </se:Fill>
            <se:Stroke>
              <se:SvgParameter name="stroke">#000000</se:SvgParameter>
              <se:SvgParameter name="stroke-opacity">0.00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">0.26</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>TYÖPAIKKOJEN JA ELINKEINOJEN ALUE</se:Name>
          <se:Description>
            <se:Title>TYÖPAIKKOJEN JA ELINKEINOJEN ALUE</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>TYÖPAIKKOJEN JA ELINKEINOJEN ALUE</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:SvgParameter name="fill">#c6c7c9</se:SvgParameter>
              <se:SvgParameter name="fill-opacity">0.80</se:SvgParameter>
            </se:Fill>
            <se:Stroke>
              <se:SvgParameter name="stroke">#c6c7c9</se:SvgParameter>
              <se:SvgParameter name="stroke-width">0.26</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>VESIALUE</se:Name>
          <se:Description>
            <se:Title>VESIALUE</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>VESIALUE</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:SvgParameter name="fill">#c7e9f0</se:SvgParameter>
              <se:SvgParameter name="fill-opacity">0.80</se:SvgParameter>
            </se:Fill>
            <se:Stroke>
              <se:SvgParameter name="stroke">#728584</se:SvgParameter>
              <se:SvgParameter name="stroke-width">0.25</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>YHTEISÖJEN LOMA-ASUNTOALUE</se:Name>
          <se:Description>
            <se:Title>YHTEISÖJEN LOMA-ASUNTOALUE</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>YHTEISÖJEN LOMA-ASUNTOALUE</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:SvgParameter name="fill">#f6ed35</se:SvgParameter>
              <se:SvgParameter name="fill-opacity">0.80</se:SvgParameter>
            </se:Fill>
            <se:Stroke>
              <se:SvgParameter name="stroke">#f6ed35</se:SvgParameter>
              <se:SvgParameter name="stroke-width">0.26</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
          <se:TextSymbolizer>
            <se:Geometry>
              <ogc:Function name="centroid">
                <ogc:PropertyName>geom</ogc:PropertyName>
              </ogc:Function>
            </se:Geometry>
            <se:Label>
              <ogc:PropertyName>yhdrak_rakennusoikeus</ogc:PropertyName>
            </se:Label>
            <!--<se:Fill>
              <se:SvgParameter name="fill">#000000</se:SvgParameter>
            </se:Fill>-->
            <se:Font>
              <se:SvgParameter name="font-family">Arial</se:SvgParameter>
              <se:SvgParameter name="font-size">8</se:SvgParameter>
              <se:SvgParameter name="font-style">normal</se:SvgParameter>
              <se:SvgParameter name="font-weight">normal</se:SvgParameter>
            </se:Font> 
          </se:TextSymbolizer>
         <!-- <se:MaxScaleDenominator>200000</se:MaxScaleDenominator> -->
        </se:Rule>
        <se:Rule>
          <se:Name>TYÖPAIKKOJEN JA ELINKEINOJEN ALUE, JOLLA YMPÄRISTÖ ASETTAA TOIMINNAN LAADULLE ERITYISIÄ VAATIMUKSIA</se:Name>
          <se:Description>
            <se:Title>TYÖPAIKKOJEN JA ELINKEINOJEN ALUE, JOLLA YMPÄRISTÖ ASETTAA TOIMINNAN LAADULLE ERITYISIÄ VAATIMUKSIA</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>TYÖPAIKKOJEN JA ELINKEINOJEN ALUE, JOLLA YMPÄRISTÖ ASETTAA TOIMINNAN LAADULLE ERITYISIÄ VAATIMUKSIA</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:SvgParameter name="fill">#c6c7c9</se:SvgParameter>
              <se:SvgParameter name="fill-opacity">0.80</se:SvgParameter>
            </se:Fill>
            <se:Stroke>
              <se:SvgParameter name="stroke">#c6c7c9</se:SvgParameter>
              <se:SvgParameter name="stroke-width">0.26</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:GraphicFill>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>circle</se:WellKnownName>
                    <se:Fill>
                      <se:SvgParameter name="fill">#515151</se:SvgParameter>
                    </se:Fill>
                    <se:Stroke>
                      <se:SvgParameter name="stroke">#000000</se:SvgParameter>
                      <se:SvgParameter name="stroke-opacity">0.00</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>1.9</se:Size>
                </se:Graphic>
              </se:GraphicFill>
            </se:Fill>
            <se:VendorOption name="graphic-margin">1</se:VendorOption>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>KESKUSTATOIMINTOJEN JA VIRKISTYKSEN SEKOITTUNUT ALUE</se:Name>
          <se:Description>
            <se:Title>KESKUSTATOIMINTOJEN JA VIRKISTYKSEN SEKOITTUNUT ALUEE</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>KESKUSTATOIMINTOJEN JA VIRKISTYKSEN SEKOITTUNUT ALUE</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:SvgParameter name="fill">#f5919b</se:SvgParameter>
              <se:SvgParameter name="fill-opacity">0.80</se:SvgParameter>
            </se:Fill>
            <se:Stroke>
              <se:SvgParameter name="stroke">#000000</se:SvgParameter>
              <se:SvgParameter name="stroke-opacity">0.00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:GraphicFill>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>shape://slash</se:WellKnownName>
                    <se:Stroke>
                      <se:SvgParameter name="stroke">#c7e4be</se:SvgParameter>
                      <se:SvgParameter name="stroke-width">2</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>8</se:Size>
                  <se:Rotation>45</se:Rotation>
                </se:Graphic>
              </se:GraphicFill>
            </se:Fill>
          </se:PolygonSymbolizer>
        </se:Rule>
      </se:FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
