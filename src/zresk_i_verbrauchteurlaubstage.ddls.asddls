@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text Element verbrauchte Urlaubstage'

define view entity ZRESK_I_VerbrauchteUrlaubstage as select from zresk_uanspruch
association to Zresk_I_VerbrauchteUrlaubtagei as _verbrauchteurlaubstage on $projection.MitarbeiterUuid = _verbrauchteurlaubstage.AntragstellerUuid
{
    key urlaubsanspruch_uuid     as UrlaubsanspruchUuid,
      mitarbeiter_uuid                 as MitarbeiterUuid,
      sum( _verbrauchteurlaubstage.FilteredDays ) as VerbrauchteUrlaubstage
      
}
where
  _verbrauchteurlaubstage.RequestYear = jahr
group by
  urlaubsanspruch_uuid,
  mitarbeiter_uuid
    
