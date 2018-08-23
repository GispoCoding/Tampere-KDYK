<!-- Tampereen kaupunki yleiskaavoitus, sld-tyylin testiversio tietomalli KDYK hankkeeseen. Tyylissä on kuvailtu strategiset kehittämisperiaatemerkinnät sekä erityisominaisuus alueet-->
<!-- Jussi Tahvanainen, Tampereen kaupunki-->
<!-- luotu 19.6.2018 -->
<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.1.0" xmlns:xlink="http://www.w3.org/1999/xlink" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:se="http://www.opengis.net/se">
  <NamedLayer>
    <se:Name>Ohj_keskuspuistoverkoston_ja_liikenneverkon_kehittäminen</se:Name>
    <UserStyle>
      <se:Name>Ohj_keskuspuistoverkoston_ja_liikenneverkon_kehittäminen</se:Name>
      <se:FeatureTypeStyle>
        <se:Rule>
          <se:Name>OHJEELLINEN KESKUSPUISTOVERKOSTON KEHITTÄMISTARVEALUE</se:Name>
          <se:Description>
            <se:Title>OHJEELLINEN KESKUSPUISTOVERKOSTON KEHITTÄMISTARVEALUE</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>OHJEELLINEN KESKUSPUISTOVERKOSTON KEHITTÄMISTARVEALUE</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
           <se:MaxScaleDenominator>100000</se:MaxScaleDenominator>
          <se:PolygonSymbolizer>  
            <se:Stroke>
              <se:SvgParameter name="stroke">#000000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">0.25</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">4 2</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
           <se:TextSymbolizer>
            <se:Geometry><ogc:Function name="boundary"> 
              <ogc:PropertyName>geom</ogc:PropertyName> 
              </ogc:Function> 
            </se:Geometry> 
            <se:Label>
              <ogc:PropertyName>karttamerkinta</ogc:PropertyName>
            </se:Label>
            <se:Font>
              <se:SvgParameter name="font-family">Arial</se:SvgParameter>
              <se:SvgParameter name="font-size">11</se:SvgParameter>
              <se:SvgParameter name="font-style">normal</se:SvgParameter>
              <se:SvgParameter name="font-weight">normal</se:SvgParameter>
            </se:Font>
            <se:Halo>
              <se:Radius>1</se:Radius>
              <se:Fill>
                <se:SvgParameter name="fill">#ffffff</se:SvgParameter>
              </se:Fill> 
            </se:Halo>
            <se:VendorOption name="followLine">true</se:VendorOption> 
            <se:VendorOption name="repeat">250</se:VendorOption> 
            <se:VendorOption name="maxAngleDelta">45</se:VendorOption> 
          </se:TextSymbolizer>   
        </se:Rule>
        <se:Rule>
          <se:Name>OHJEELLINEN LIIKENNEVERKON KEHITTÄMISEN KOHDEALUE</se:Name>
          <se:Description>
            <se:Title>OHJEELLINEN LIIKENNEVERKON KEHITTÄMISEN KOHDEALUE</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>OHJEELLINEN LIIKENNEVERKON KEHITTÄMISEN KOHDEALUE</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
           <se:MaxScaleDenominator>100000</se:MaxScaleDenominator>
          <se:PolygonSymbolizer>         
            <se:Stroke>
              <se:SvgParameter name="stroke">#000000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">0.25</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">4 2</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
           <se:TextSymbolizer>
            <se:Geometry><ogc:Function name="boundary"> 
              <ogc:PropertyName>geom</ogc:PropertyName> 
              </ogc:Function> 
            </se:Geometry> 
            <se:Label>
              <ogc:PropertyName>karttamerkinta</ogc:PropertyName>
            </se:Label>
            <se:Font>
              <se:SvgParameter name="font-family">Arial</se:SvgParameter>
              <se:SvgParameter name="font-size">11</se:SvgParameter>
              <se:SvgParameter name="font-style">normal</se:SvgParameter>
              <se:SvgParameter name="font-weight">normal</se:SvgParameter>
            </se:Font>
            <se:Halo>
              <se:Radius>1</se:Radius>
              <se:Fill>
                <se:SvgParameter name="fill">#ffffff</se:SvgParameter>
              </se:Fill>                       
            </se:Halo>
            <se:VendorOption name="followLine">true</se:VendorOption> 
            <se:VendorOption name="repeat">200</se:VendorOption> 
            <se:VendorOption name="maxAngleDelta">45</se:VendorOption> 
          </se:TextSymbolizer>      
        </se:Rule>
        <se:Rule>
          <se:Name>KORKEAAN RAKENTAMISEEN SOVELTUVA VYÖHYKE</se:Name>
          <se:Description>
            <se:Title>KORKEAAN RAKENTAMISEEN SOVELTUVA VYÖHYKE</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>KORKEAAN RAKENTAMISEEN SOVELTUVA VYÖHYKE</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#525252</se:SvgParameter>
              <se:SvgParameter name="stroke-width">5</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">3 5</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>NÄSIJÄRVEN JA PYHÄJÄRVEN RANTOJEN KEHITTÄMISVYÖHYKKEET</se:Name>
          <se:Description>
            <se:Title>NÄSIJÄRVEN JA PYHÄJÄRVEN RANTOJEN KEHITTÄMISVYÖHYKKEET</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>KESKUSTAN RANTOJEN KEHITTÄMISVYÖHYKKEET</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#bcbddc</se:SvgParameter>
              <se:SvgParameter name="stroke-width">4</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:GraphicStroke>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>circle</se:WellKnownName>
                    <se:Fill>
                      <se:SvgParameter name="fill">#2171b5</se:SvgParameter>
                    </se:Fill>
                    <se:Stroke>
                      <se:SvgParameter name="stroke">#2171b5</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>4</se:Size>
                </se:Graphic>
              </se:GraphicStroke>
              <se:SvgParameter name="stroke-dasharray">4 3</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>YDINKESKUSTAN KEHITTÄMISVYÖHYKE</se:Name>
          <se:Description>
            <se:Title>YDINKESKUSTAN KEHITTÄMISVYÖHYKE</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>YDINKESKUSTA</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#d35244</se:SvgParameter>
              <se:SvgParameter name="stroke-width">4</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
      </se:FeatureTypeStyle>
	    <se:FeatureTypeStyle>
        <se:Rule>
          <se:Name>ALUEKESKUS</se:Name>
          <se:Description>
            <se:Title>ALUEKESKUS</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>ALUEKESKUS</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>          
            <se:Stroke>
              <se:SvgParameter name="stroke">#000000</se:SvgParameter>
              <se:SvgParameter name="stroke-opacity">0.00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">0.20</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:GraphicStroke>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>triangle</se:WellKnownName>
                    <se:Fill>
                      <se:SvgParameter name="fill">#000000</se:SvgParameter>
                    </se:Fill>
                    <se:Stroke>
                      <se:SvgParameter name="stroke">#000000</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>6</se:Size>
                </se:Graphic>
              <se:Gap>10.5</se:Gap>  
              </se:GraphicStroke>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>PAIKALLISKESKUS</se:Name>
          <se:Description>
            <se:Title>PAIKALLISKESKUS</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>PAIKALLISKESKUS</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>          
            <se:Stroke>
              <se:SvgParameter name="stroke">#000000</se:SvgParameter>
              <se:SvgParameter name="stroke-opacity">0.00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">0.20</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:GraphicStroke>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>triangle</se:WellKnownName>
                    <se:Fill>
                      <se:SvgParameter name="fill">#000000</se:SvgParameter>
                    </se:Fill>
                    <se:Stroke>
                      <se:SvgParameter name="stroke">#000000</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>6</se:Size>
                </se:Graphic>
                <se:Gap>10.5</se:Gap>
              </se:GraphicStroke>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
         <se:Rule>
          <se:Name>VAK-RATAPIHA</se:Name>
          <se:Description>
            <se:Title>VAK-RATAPIHA</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>VAK-RATAPIHA</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
       <se:TextSymbolizer> 
         <se:Label>
           <ogc:PropertyName>karttamerkinta</ogc:PropertyName>
         </se:Label>
         <se:Font>
           <se:SvgParameter name="font-family">Arial</se:SvgParameter>
           <se:SvgParameter name="font-size">30</se:SvgParameter>
           <se:SvgParameter name="font-style">normal</se:SvgParameter>
           <se:SvgParameter name="font-weight">bold</se:SvgParameter>
         </se:Font>
         <se:Fill>
           <se:SvgParameter name="fill">#000000</se:SvgParameter>
         </se:Fill>        
       </se:TextSymbolizer>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:GraphicFill>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>shape://slash</se:WellKnownName>
                    <se:Stroke>
                      <se:SvgParameter name="stroke">#000000</se:SvgParameter>
                      <se:SvgParameter name="stroke-width">0.2</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>3</se:Size>
                  <se:Rotation>0</se:Rotation>
                </se:Graphic>
              </se:GraphicFill>
            </se:Fill>
          </se:PolygonSymbolizer>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#000000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">0.2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">4 2 1 2</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
      </se:FeatureTypeStyle>
	   <se:FeatureTypeStyle>
         <se:Rule>
          <se:Name>KASVUN VYÖHYKE</se:Name>
          <se:Description>
            <se:Title>KASVUN VYÖHYKE</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>KASVUN VYÖHYKE</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
         <se:LineSymbolizer>
                <se:Stroke>
                  <se:SvgParameter name="stroke">#d67474</se:SvgParameter>
                  <se:SvgParameter name="stroke-width">5</se:SvgParameter>
                  <se:SvgParameter name="stroke-dasharray">2 2</se:SvgParameter>
                </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>      
        <se:Rule>
          <se:Name>ELINVOIMAN VYÖHYKE</se:Name>
          <se:Description>
            <se:Title>ELINVOIMAN VYÖHYKE</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>ELINVOIMAN VYÖHYKE</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:GraphicFill>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>shape://plus</se:WellKnownName>
                    <se:Stroke>
                      <se:SvgParameter name="stroke">#92969a</se:SvgParameter>
                      <se:SvgParameter name="stroke-width">0.8</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>3</se:Size>          
                </se:Graphic>
              </se:GraphicFill>
            </se:Fill>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>ETELÄN KASVUSUUNTA</se:Name>
          <se:Description>
            <se:Title>ETELÄN KASVUSUUNTA</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>ETELÄN KASVUSUUNTA</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:GraphicFill>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>shape://slash</se:WellKnownName>
                    <se:Stroke>
                      <se:SvgParameter name="stroke">#fafafa</se:SvgParameter>
                      <se:SvgParameter name="stroke-width">0.8</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>5</se:Size>
                  <se:Rotation>0</se:Rotation>
                </se:Graphic>
              </se:GraphicFill>
            </se:Fill>
          </se:PolygonSymbolizer>
         <se:LineSymbolizer>
                <se:Stroke>
                  <se:SvgParameter name="stroke">#fafafa</se:SvgParameter>
                  <se:SvgParameter name="stroke-width">3</se:SvgParameter>
                  <se:SvgParameter name="stroke-dasharray">2 2</se:SvgParameter>
                </se:Stroke>
              </se:LineSymbolizer>
        </se:Rule>
      </se:FeatureTypeStyle>
	   <se:FeatureTypeStyle>
        <se:Rule>
          <se:Name>ALUE, JOLLE SAA SIJOITTAA SEUDULLISTA PALJON TILAA VAATIVAA KAUPPAA</se:Name>
          <se:Description>
            <se:Title>ALUE, JOLLE SAA SIJOITTAA SEUDULLISTA PALJON TILAA VAATIVAA KAUPPAA</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>ALUE, JOLLE SAA SIJOITTAA SEUDULLISTA PALJON TILAA VAATIVAA KAUPPAA</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:GraphicFill>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>shape://vertline</se:WellKnownName>
                    <se:Stroke>
                      <se:SvgParameter name="stroke">#d78009</se:SvgParameter>
                      <se:SvgParameter name="stroke-width">3</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>5</se:Size>
                  <se:Rotation>0</se:Rotation>
                  <se:Displacement>
                    <se:DisplacementX>0</se:DisplacementX>
                    <se:DisplacementY>0</se:DisplacementY>
                  </se:Displacement>
                </se:Graphic>
              </se:GraphicFill>
            </se:Fill>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>LAAJENTUVA KESKUSTA</se:Name>
          <se:Description>
            <se:Title>LAAJENTUVA KESKUSTA</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>LAAJENTUVA KESKUSTA</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#000000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">0.56</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">4 2 1 2</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>     
             <se:TextSymbolizer>
				<se:Geometry>
					<ogc:Function name="centroid">
						<ogc:PropertyName>geom</ogc:PropertyName>
					</ogc:Function>
				</se:Geometry>
			<se:Label>
				<ogc:PropertyName>karttamerkinta</ogc:PropertyName>
			</se:Label>
         <se:Font>
           <se:SvgParameter name="font-family">Arial</se:SvgParameter>
           <se:SvgParameter name="font-size">10</se:SvgParameter>
           <se:SvgParameter name="font-style">normal</se:SvgParameter>
           <se:SvgParameter name="font-weight">bold</se:SvgParameter>
         </se:Font>   
         <se:Fill>
           <se:SvgParameter name="fill">#000000</se:SvgParameter>
         </se:Fill>
       </se:TextSymbolizer>        
        </se:Rule>
        <se:Rule>
          <se:Name>UUDISTUVA KESKUSTA</se:Name>
          <se:Description>
            <se:Title>UUDISTUVA KESKUSTA</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>UUDISTUVA KESKUSTA</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#000000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">0.56</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">4 2 1 2</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>        
             <se:TextSymbolizer>
				<se:Geometry>
					<ogc:Function name="centroid">
						<ogc:PropertyName>geom</ogc:PropertyName>
					</ogc:Function>
				</se:Geometry>
         <se:Label>
           <ogc:PropertyName>karttamerkinta</ogc:PropertyName>
         </se:Label>
         <se:Font>
           <se:SvgParameter name="font-family">Arial</se:SvgParameter>
           <se:SvgParameter name="font-size">10</se:SvgParameter>
           <se:SvgParameter name="font-style">normal</se:SvgParameter>
           <se:SvgParameter name="font-weight">bold</se:SvgParameter>
         </se:Font>
         <se:Fill>
           <se:SvgParameter name="fill">#000000</se:SvgParameter>
         </se:Fill>        
       </se:TextSymbolizer>        
        </se:Rule>
        <se:Rule>
          <se:Name>TÄYDENTYVÄ KESKUSTA</se:Name>
          <se:Description>
            <se:Title>TÄYDENTYVÄ KESKUSTA</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>kayttotarkoitus_nimi</ogc:PropertyName>
              <ogc:Literal>TÄYDENTYVÄ KESKUSTA</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#000000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">0.56</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">4 2 1 2</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>   
             <se:TextSymbolizer>
				<se:Geometry>
					<ogc:Function name="centroid">
						<ogc:PropertyName>geom</ogc:PropertyName>
					</ogc:Function>
				</se:Geometry>
         <se:Label>
           <ogc:PropertyName>karttamerkinta</ogc:PropertyName>
         </se:Label>
         <se:Font>
           <se:SvgParameter name="font-family">Arial</se:SvgParameter>
           <se:SvgParameter name="font-size">10</se:SvgParameter>
           <se:SvgParameter name="font-style">normal</se:SvgParameter>
           <se:SvgParameter name="font-weight">bold</se:SvgParameter>
         </se:Font>
         <se:Fill>
           <se:SvgParameter name="fill">#000000</se:SvgParameter>
         </se:Fill>       
       </se:TextSymbolizer>     
        </se:Rule>
      </se:FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
