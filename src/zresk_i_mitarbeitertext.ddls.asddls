@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Mitarbeiter Textelement'

define view entity ZRESK_I_MitarbeiterText as select from zresk_arbeiter
{
    key mitarbeiter_uuid as MitarbeiterUuid,
    vorname as Vorname, 
    nachname as Nachname,
    
     concat_with_space(vorname, nachname, 1) as Name
    
}
