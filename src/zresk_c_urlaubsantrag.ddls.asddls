@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View Urlaubsantrag'
@Metadata.allowExtensions: true
@Search.searchable: true

define view entity ZRESK_C_Urlaubsantrag
  as projection on ZRESK_R_Urlaubsantrag
{
  key UrlaubsantragUuid,
      AntragstellerUuid,
      @Search.defaultSearchElement: true
      AntragstellerName,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZRESK_I_MitarbeiterVH', element: 'MitarbeiterUuid' } }]
      GenehmigenderUuid,
      GenehmigenderName,
      
      @EndUserText.label: 'Startdatum'
      Startdatum,
      
      @EndUserText.label: 'Enddatum'
      Enddatum,
      
      @EndUserText.label: 'Urlaubsatage'
      Urlaubstage,
      
      @EndUserText.label: 'Kommentar'
      Kommentar,
      @ObjectModel.text.element: [ 'StatusText' ]
      Status,


      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      StatusText,

    


      // Administrative Data 
      _Antragsteller : redirected to parent ZRESK_C_Mitarbeiter,
      _Genehmigender : redirected to ZRESK_C_Mitarbeiter

}
