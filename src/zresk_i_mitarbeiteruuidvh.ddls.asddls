@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help Mitarbeiter UUID'

define view entity ZRESK_I_MitarbeiterUuidVH
  as select from zresk_arbeiter
{
      @EndUserText: { label: 'Mitarbeiter Uuid', quickInfo: 'MitarbeiterUuid' }
  key mitarbeiter_uuid  as MitarbeiterUuid,

      @EndUserText: { label: 'Mitarbeiternummer', quickInfo: 'Mitarbeiternummer' }
      mitarbeiternummer as Mitarbeiternummer,

      @EndUserText: { label: 'Vorname', quickInfo: 'Vorname' }
      vorname           as Vorname,

      @EndUserText: { label: 'Nachname', quickInfo: 'Nachname' }
      nachname          as Nachname
}
