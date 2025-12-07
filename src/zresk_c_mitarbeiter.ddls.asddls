@EndUserText.label: 'Projection View Mitarbeiter'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZRESK_C_Mitarbeiter
  provider contract transactional_query
  as projection on ZRESK_R_Mitarbeiter
{
  key MitarbeiterUuid,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Mitarbeiternummer'
      Mitarbeiternummer,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      @EndUserText.label: 'Vorname'
      Vorname,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      @EndUserText.label: 'Nachname'
      Nachname,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Eintrittsdatum'
      Eintrittsdatum,



      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      
      
      _Urlaubsanspruch : redirected to composition child ZRESK_C_Urlaubsanspruch,
      _Urlaubsantrag   : redirected to composition child ZRESK_C_Urlaubsantrag
}
