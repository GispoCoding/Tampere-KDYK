<!-- Tampereen kaupunki yleiskaavoitus, sld-tyylin testiversio tietomalli KDYK hankkeeseen. Tyylissä on kuvailtu yhdyskuntarakenteeseen liittyvät pistemäiset kohdeobjektit-->
<!-- Jussi Tahvanainen, Tampereen kaupunki-->
<!-- luotu 19.6.2018 -->
<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.1.0" xmlns:xlink="http://www.w3.org/1999/xlink" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:se="http://www.opengis.net/se">
  <NamedLayer>
    <se:Name>Yhdyskuntarakenne_kohteet</se:Name>
    <UserStyle>
      <se:Name>Yhdyskuntarakenne_kohteet</se:Name>
      <se:FeatureTypeStyle>
        <se:Rule>
          <se:Name>JOUKKOLIIKENTEEN VAIHTOPYSÄKKI</se:Name>
          <se:Description>
            <se:Title>JOUKKOLIIKENTEEN VAIHTOPYSÄKKI</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>JOUKKOLIIKENTEEN VAIHTOPYSÄKKI</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
           <se:MaxScaleDenominator>80000</se:MaxScaleDenominator>
          <se:PointSymbolizer>
            <se:Graphic>
              <se:ExternalGraphic>
                <se:OnlineResource xlink:type="simple" xlink:href=  "http://karttapalvelu.tampere.fi/www/kanta_yk2040/svg/jolin_vaihtopysakki_valk.svg"/>
                <se:Format>image/svg+xml</se:Format>
              </se:ExternalGraphic>
              <se:Size>30</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>JOUKKOLIIKENTEEN VAIHTOPYSÄKKI_</se:Name>
          <se:Description>
            <se:Title>JOUKKOLIIKENTEEN VAIHTOPYSÄKKI_</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>JOUKKOLIIKENTEEN VAIHTOPYSÄKKI_</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
           <se:MaxScaleDenominator>80000</se:MaxScaleDenominator>
          <se:PointSymbolizer>
            <se:Graphic>
              <se:ExternalGraphic>
                <se:OnlineResource xlink:type="simple" xlink:href="http://karttapalvelu.tampere.fi/www/kanta_yk2040/svg/jolin_vaihtopysakki.svg"/>
                <se:Format>image/svg+xml</se:Format>
              </se:ExternalGraphic>
              <se:Size>30</se:Size>
              <se:Displacement>
                <se:DisplacementX>-0.4</se:DisplacementX>
                <se:DisplacementY>-0.2</se:DisplacementY>
              </se:Displacement>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>LÄHIJUNAPYSÄKKI</se:Name>
          <se:Description>
            <se:Title>LÄHIJUNAPYSÄKKI</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>LÄHIJUNAPYSÄKKI</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:MaxScaleDenominator>80000</se:MaxScaleDenominator>
          <se:PointSymbolizer>
            <se:Graphic>
              <se:ExternalGraphic>
                <se:OnlineResource xlink:type="simple" xlink:href="http://karttapalvelu.tampere.fi/www/kanta_yk2040/svg/lahijuna_asema_kelt.svg"/>
                <se:Format>image/svg+xml</se:Format>
              </se:ExternalGraphic>
              <se:Size>25</se:Size>
              <se:Displacement>
                <se:DisplacementX>-0.6</se:DisplacementX>
                <se:DisplacementY>-0.4</se:DisplacementY>
              </se:Displacement>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>MATKAKESKUS</se:Name>
          <se:Description>
            <se:Title>MATKAKESKUS</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>MATKAKESKUS</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:MaxScaleDenominator>80000</se:MaxScaleDenominator>
          <se:PointSymbolizer>
            <se:Graphic>
              <se:ExternalGraphic>
                <se:OnlineResource xlink:type="simple" xlink:href="http://karttapalvelu.tampere.fi/www/kanta_yk2040/svg/lahijuna_asema_musta.svg"/>
                <se:Format>image/svg+xml</se:Format>
              </se:ExternalGraphic>
              <se:Size>25</se:Size>
              <se:Displacement>
                <se:DisplacementX>5.55112e-17</se:DisplacementX>
                <se:DisplacementY>0</se:DisplacementY>
              </se:Displacement>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>UUSI HENKILÖLIIKENTEEN ASEMA</se:Name>
          <se:Description>
            <se:Title>UUSI HENKILÖLIIKENTEEN ASEMA</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>UUSI HENKILÖLIIKENTEEN ASEMA</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:MaxScaleDenominator>80000</se:MaxScaleDenominator>
          <se:PointSymbolizer>
            <se:Graphic>
              <se:ExternalGraphic>
                <se:OnlineResource xlink:type="simple" xlink:href="http://karttapalvelu.tampere.fi/www/kanta_yk2040/svg/lahijuna_asema.svg"/>   
                <se:Format>image/svg+xml</se:Format>
              </se:ExternalGraphic>
              <se:Size>25</se:Size>
              <se:Displacement>
                <se:DisplacementX>0.6</se:DisplacementX>
                <se:DisplacementY>0</se:DisplacementY>
              </se:Displacement>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>JÄTEVEDENPUHDISTAMO</se:Name>
          <se:Description>
            <se:Title>JÄTEVEDENPUHDISTAMO</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>JÄTEVEDENPUHDISTAMO</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:MaxScaleDenominator>80000</se:MaxScaleDenominator>
          <se:PointSymbolizer>
            <se:Graphic>
              <se:ExternalGraphic>
                <se:OnlineResource xlink:type="simple" xlink:href="http://karttapalvelu.tampere.fi/www/kanta_yk2040/svg/jatevedenpuhdistamo_uusi.svg"/>
                <se:Format>image/svg+xml</se:Format>
              </se:ExternalGraphic>
              <se:Size>30</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
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
          <se:MaxScaleDenominator>80000</se:MaxScaleDenominator>
          <se:PointSymbolizer>
            <se:Graphic>
              <se:Mark>
                <se:WellKnownName>square</se:WellKnownName>
                <se:Fill>
                  <se:SvgParameter name="fill">#4cc3d4</se:SvgParameter>
                </se:Fill>
                <se:Stroke>
                  <se:SvgParameter name="stroke">#4cc3d4</se:SvgParameter>
                </se:Stroke>
              </se:Mark>
              <se:Size>10</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>MAATILAN TALOUSKESKUS</se:Name>
          <se:Description>
            <se:Title>MAATILAN TALOUSKESKUS</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>MAATILAN TALOUSKESKUS</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:MaxScaleDenominator>80000</se:MaxScaleDenominator>
         <se:PointSymbolizer>
            <se:Graphic>
              <se:Mark>
                <se:WellKnownName>triangle</se:WellKnownName>
                <se:Fill>
                  <se:SvgParameter name="fill">#000000</se:SvgParameter>
                  <se:SvgParameter name="fill-opacity">0.00</se:SvgParameter>
                </se:Fill>
                <se:Stroke>
                  <se:SvgParameter name="stroke">#000000</se:SvgParameter>
                  <se:SvgParameter name="stroke-width">1</se:SvgParameter>
                </se:Stroke>
              </se:Mark>
              <se:Size>10</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
          <se:PointSymbolizer>
            <se:Graphic>
              <se:Mark>
                <se:WellKnownName>circle</se:WellKnownName>
                <se:Fill>
                  <se:SvgParameter name="fill">#000000</se:SvgParameter>
                </se:Fill>
                <se:Stroke>
                  <se:SvgParameter name="stroke">#000000</se:SvgParameter>
                </se:Stroke>
              </se:Mark>
              <se:Size>3</se:Size>
              <se:Displacement>
                <se:DisplacementX>0</se:DisplacementX>
                <se:DisplacementY>0.4</se:DisplacementY>
              </se:Displacement>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>PALVELUJEN JA TYÖPAIKKOJEN SEKOITTUNUT ALUE TAI KOHDE</se:Name>
          <se:Description>
            <se:Title>PALVELUJEN JA TYÖPAIKKOJEN SEKOITTUNUT ALUE TAI KOHDE</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>PALVELUJEN JA TYÖPAIKKOJEN SEKOITTUNUT ALUE TAI KOHDE</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:MaxScaleDenominator>80000</se:MaxScaleDenominator>
          <se:PointSymbolizer>
            <se:Graphic>
              <se:Mark>
                <se:WellKnownName>square</se:WellKnownName>
                <se:Fill>
                  <se:SvgParameter name="fill">#e4b74d</se:SvgParameter>
                </se:Fill>
                <se:Stroke>
                  <se:SvgParameter name="stroke">#6a6a6a</se:SvgParameter>
                </se:Stroke>
              </se:Mark>
              <se:Size>10</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>KEHITETTÄVÄ INNOVAATIOYMPÄRISTÖ</se:Name>
          <se:Description>
            <se:Title>KEHITETTÄVÄ INNOVAATIOYMPÄRISTÖ</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>KEHITETTÄVÄ INNOVAATIOYMPÄRISTÖ</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:MaxScaleDenominator>80000</se:MaxScaleDenominator>
          <se:PointSymbolizer>
            <se:Graphic>
              <se:ExternalGraphic>
                <se:OnlineResource xlink:type="simple" xlink:href="http://karttapalvelu.tampere.fi/www/kanta_yk2040/svg/innovaatio_keskus.svg"/>
                <se:Format>image/svg+xml</se:Format>
              </se:ExternalGraphic>
              <se:Size>35</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
      </se:FeatureTypeStyle>
       <se:FeatureTypeStyle>
         <se:Rule> 
           <se:Name>Eritasoliittymä</se:Name>
          <se:Description>
            <se:Title>Eritasoliittymä</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>Eritasoliittymä</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
            <se:MaxScaleDenominator>100000</se:MaxScaleDenominator>
          <se:PointSymbolizer>
            <se:Graphic>
              <se:Mark>
                <se:WellKnownName>circle</se:WellKnownName>
                <se:Fill>
                  <se:SvgParameter name="fill">#ffffff</se:SvgParameter>
                </se:Fill>
                <se:Stroke>
                  <se:SvgParameter name="stroke">#000000</se:SvgParameter>
                  <se:SvgParameter name="stroke-width">1.4</se:SvgParameter>
                </se:Stroke>
              </se:Mark>
              <se:Size>10</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Kehitettävä liittymä_</se:Name>
          <se:Description>
            <se:Title>Kehitettävä liittymä_</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>Kehitettävä liittymä_</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:MaxScaleDenominator>100000</se:MaxScaleDenominator>
        <se:PointSymbolizer>
            <se:Graphic>
              <se:Mark>
                <se:WellKnownName>star</se:WellKnownName>
                <se:Fill>
                  <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
                </se:Fill>
                <se:Stroke>
                  <se:SvgParameter name="stroke">#ff0000</se:SvgParameter>
                </se:Stroke>
              </se:Mark>
              <se:Size>8</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
         <se:Rule>
          <se:Name>Kehitettävä liittymä</se:Name>
          <se:Description>
            <se:Title>Kehitettävä liittymä</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>Kehitettävä liittymä</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
           <se:MaxScaleDenominator>100000</se:MaxScaleDenominator>
          <se:PointSymbolizer>
            <se:Graphic>
              <se:ExternalGraphic>
                <se:OnlineResource xlink:type="simple" xlink:href="http://karttapalvelu.tampere.fi/www/kanta_yk2040/svg/kehitettava_liittyma.svg"/>
                <se:Format>image/svg+xml</se:Format>
              </se:ExternalGraphic>
              <se:Size>15</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Maanalainen eritasoliittymä</se:Name>
          <se:Description>
            <se:Title>Maanalainen eritasoliittymä</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>Maanalainen eritasoliittymä</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:MaxScaleDenominator>100000</se:MaxScaleDenominator>
          <se:PointSymbolizer>
            <se:Graphic>
              <se:Mark>
                <se:WellKnownName>circle</se:WellKnownName>
                 <se:Fill>
                  <se:SvgParameter name="fill">#000000</se:SvgParameter>
                  <se:SvgParameter name="fill-opacity">0.00</se:SvgParameter>
                </se:Fill>                            
                <se:Stroke>
                  <se:SvgParameter name="stroke">#000000</se:SvgParameter>
                  <se:SvgParameter name="stroke-width">2.2</se:SvgParameter>
                  <se:SvgParameter name="stroke-dasharray">2 2</se:SvgParameter>
                </se:Stroke>
              </se:Mark>
              <se:Size>12</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Uusi eritasoliittymä</se:Name>
          <se:Description>
            <se:Title>Uusi eritasoliittymä</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>Uusi eritasoliittymä</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:MaxScaleDenominator>100000</se:MaxScaleDenominator>
           <se:PointSymbolizer>
            <se:Graphic>
              <se:Mark>
                <se:WellKnownName>circle</se:WellKnownName>
                <se:Fill>
                  <se:SvgParameter name="fill">#ffffff</se:SvgParameter>
                </se:Fill>
                <se:Stroke>
                  <se:SvgParameter name="stroke">#fb0000</se:SvgParameter>
                  <se:SvgParameter name="stroke-width">1.4</se:SvgParameter>
                </se:Stroke>
              </se:Mark>
              <se:Size>10</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Suuntaisliittymä</se:Name>
          <se:Description>
            <se:Title>Suuntaisliittymä</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>Suuntaisliittymä</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:MaxScaleDenominator>100000</se:MaxScaleDenominator>
            <se:PointSymbolizer>
            <se:Graphic>
              <se:ExternalGraphic>
                <se:OnlineResource xlink:type="simple" xlink:href="http://karttapalvelu.tampere.fi/www/kanta_yk2040/svg/Suuntais_05.svg"/>
                <se:Format>image/svg</se:Format>
              </se:ExternalGraphic>
              <se:Size>10</se:Size>
              <se:Rotation>190</se:Rotation>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Suuntaisliittymä</se:Name>
          <se:Description>
            <se:Title>Suuntaisliittymä</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>Suuntaisliittymä_2</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:MaxScaleDenominator>100000</se:MaxScaleDenominator>
          <se:PointSymbolizer>
            <se:Graphic>
              <se:ExternalGraphic>
                <se:OnlineResource xlink:type="simple" xlink:href="http://karttapalvelu.tampere.fi/www/kanta_yk2040/svg/Suuntais_07.svg"/>
                <se:Format>image/svg</se:Format>
              </se:ExternalGraphic>
              <se:Size>12</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Uusi suuntaisliittymä</se:Name>
          <se:Description>
            <se:Title>Uusi suuntaisliittymä</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>Uusi suuntaisliittymä</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:MaxScaleDenominator>100000</se:MaxScaleDenominator>
          <se:PointSymbolizer>
            <se:Graphic>
              <se:ExternalGraphic>
                <se:OnlineResource xlink:type="simple" xlink:href="http://karttapalvelu.tampere.fi/www/kanta_yk2040/svg/Suuntais_06.svg"/>
                <se:Format>image/svg</se:Format>
              </se:ExternalGraphic>
              <se:Size>10</se:Size>
              <se:Rotation>20</se:Rotation>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
      </se:FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
