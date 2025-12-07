@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View Urlaubsanspruch'
define view entity ZRESK_R_Urlaubsanspruch
  as select from zresk_uanspruch
  association        to parent ZRESK_R_Mitarbeiter      as _Mitarbeiter            on $projection.MitarbeiterUuid = _Mitarbeiter.MitarbeiterUuid
  association [1..1] to ZRESK_I_MitarbeiterText         as _MitarbeiterText        on $projection.MitarbeiterUuid = _MitarbeiterText.MitarbeiterUuid
  association        to ZRESK_I_VerbrauchteUrlaubstage as _verbrauchteurlaubstage on $projection.UrlaubsanspruchUuid = _verbrauchteurlaubstage.UrlaubsanspruchUuid
  association        to ZRESK_I_GeplanteUrlaubstageTex as _geplanteUrlaubstage    on $projection.UrlaubsanspruchUuid = _geplanteUrlaubstage.UrlaubsanspruchUuid


{
  key urlaubsanspruch_uuid          as UrlaubsanspruchUuid,
      mitarbeiter_uuid              as MitarbeiterUuid,
      jahr                          as Jahr,
      urlaubstage                   as Urlaubstage,

      created_at                    as CreatedAt,
      created_by                    as CreatedBy,
    
      last_changed_by               as LastChangedBy,
      last_changed_at               as LastChangedAt,

      _MitarbeiterText.Name         as MitarbeiterName,
      _Mitarbeiter,

      _verbrauchteurlaubstage.VerbrauchteUrlaubstage       as VerbrauchteUrlaubstage,
      _geplanteUrlaubstage.GeplanteUrlaubstage             as GeplanteUrlaubstage,

      urlaubstage - coalesce(_verbrauchteurlaubstage.VerbrauchteUrlaubstage, 0) - coalesce(  _geplanteUrlaubstage.GeplanteUrlaubstage, 0) as VerfuegbareUrlaubstage

}
