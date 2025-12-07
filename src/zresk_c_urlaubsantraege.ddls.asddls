@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View Urlaubsantraege'
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity ZRESK_C_URLAUBSANTRAEGE
  as projection on ZRESK_R_Urlaubsantrag
{
  key UrlaubsantragUuid,
  
      @EndUserText.label: 'Atragssteller'
      AntragstellerUuid,
      
      GenehmigenderUuid,
      
      @EndUserText.label: 'Startdatum'
      Startdatum,
      
      @EndUserText.label: 'Enddatum'
      Enddatum,
      
      @EndUserText.label: 'Kommentar'
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Kommentar,
      
      @EndUserText.label: 'Status'
      Status,
      
      StatusText,
      Urlaubstage,

      // Administrative Data 
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,

      GenehmigenderName,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZRESK_I_MitarbeiterText', element: 'Name' } }]
      AntragstellerName,
      StatusKritikalitaet,


      //Assoiation
      _Antragsteller : redirected to parent ZRESK_C_Mitarbeiter_Manager,
      _Genehmigender : redirected to ZRESK_C_Mitarbeiter_Manager




}
