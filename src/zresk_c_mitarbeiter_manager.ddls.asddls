@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Protection View Mitarbeiter Manager'
define root view entity ZRESK_C_Mitarbeiter_Manager
  provider contract transactional_query
  as projection on ZRESK_R_Mitarbeiter
{
  key MitarbeiterUuid,
      Mitarbeiternummer,
      Vorname,
      Nachname,
      Eintrittsdatum,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      MitarbeiterName,
      
      
      // Association
      _Antragsteller ,
      _Genehmigender ,
      _Urlaubsanspruch,
      _Urlaubsantrag : redirected to composition child ZRESK_C_URLAUBSANTRAEGE

    

}
