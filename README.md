# Tampere-KDYK
KIRA-digi project on planned land use in collaboration with City of Tampere and Gispo

## The documents

The documents published here are backround information for creating future general land use plan for City of Tampere. The documentation contains these documents:

-Conceptual model for the future general land use plan of city of Tampere, containing different reference documents, data sources, decitions, code lists and monitoring. The model is in Finnish and it does not contain all possible information. The meaning of the document is to give enough information for the actual database modelling process.

-Core terms used in Finnish land use planning. Since there have not existed one publically available "Yleiskaavoitus" term document  before, this originally for internal use aimed document can be useful more broadly.

-Test data transfer instructions that describes how to prepare and transfer the Tampere planned land use test data to the open data model database.

## The SLD styles

The database model has been tested with the test database data and SLD styles provided by city of Tampere. See the [SLD_styles folder](SLD_styles) for further description.

## The database model

The database model is work in progress and is to be utilized in Tampere after finished. There are the following schemas in the database:

### yk_yleiskaava

The zoning plan scheme that contains the core tables of the model. Besides the table for the plan there are tables for the zoning objects and regulations, official documentation, diary numbers and background map. The tables contain also many fields required by INSPIRE.

### yk_prosessi

The tables in this scheme contain connections to the data that are needed in the zoning plan process. For example, there are tables for links to the documents in other systems as well as connections to other level spatial plans.

### yk_kuvaustekniikka

This scheme helps in creating visualization of the database data. Since there can be several theme maps in the published zoning plan, there is a table for theming. There are also geometry tables and connecting tables.

### yk_geoserver

This provides views created from multiple tables to be used in GeoServer map layers.

### yk_suunnitteluparametrit

The scheme contains parameters useful for carrying out the planning process correctly.

### yk_mitoitus_varanto

There is a system that provides great visualizations for dimensioning indication values, so the connections to that system are to be done via this scheme.

### yk_koodiluettelot

Various codings especially related to INSPIRE ones that already exist but also ones that are under creation process in Finland nationally.

### yk_inspire

Tables to related to INSPIRE.

### yk_metatiedot

When the zoning plan is published, for example, in Paikkatietoikkuna that is Finnish national map service, then data in meta data table is used.
