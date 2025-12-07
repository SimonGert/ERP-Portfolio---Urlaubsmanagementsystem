@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Mitarbeiter Value Help'
define view entity ZRESK_I_MitarbeiterVH
  as select from zresk_arbeiter
{
  key mitarbeiter_uuid                          as MitarbeiterUuid,
      @EndUserText.label: 'Mitarbeiternummer'
      mitarbeiternummer                         as Mitarbeiternummer,
      @EndUserText.label: 'Vorname'
      vorname                                   as Vorname,
      @EndUserText.label: 'Nachname'
      nachname                                  as Nachname,
      concat_with_space( vorname, nachname, 1 ) as Name

}
