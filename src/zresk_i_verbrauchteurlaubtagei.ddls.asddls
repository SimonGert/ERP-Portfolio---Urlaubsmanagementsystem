@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View verbrauchte Urlaubstage'
define view entity ZRESK_I_VerbrauchteUrlaubtagei
  as select from zresk_uantrag
{
  key urlaubsantrag_uuid          as UrlaubsantragUuid,
      antragsteller_uuid          as AntragstellerUuid,
      substring(startdatum, 1, 4) as RequestYear,
      urlaubstage                 as FilteredDays

}
where
      enddatum < $session.system_date
  and status   != 'A'
