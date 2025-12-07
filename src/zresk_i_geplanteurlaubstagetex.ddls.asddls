@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Geplante Urlaubstage'

define view entity ZRESK_I_GeplanteUrlaubstageTex as select from zresk_uanspruch
 association to ZRESK_I_GeplanteUrlaubstage as _geplanteurlaubstage on $projection.MitarbeiterUuid = _geplanteurlaubstage.AntragstellerUuid
{
    key urlaubsanspruch_uuid        as UrlaubsanspruchUuid,
      mitarbeiter_uuid                    as MitarbeiterUuid,
      sum( _geplanteurlaubstage.FilteredDays ) as GeplanteUrlaubstage
      
}
where
  _geplanteurlaubstage.RequestYear = jahr
group by
  urlaubsanspruch_uuid,
  mitarbeiter_uuid
