@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View Urlaubsanspruch'
@Metadata.allowExtensions: true

define view entity ZRESK_C_Urlaubsanspruch
  as projection on ZRESK_R_Urlaubsanspruch
{
  key UrlaubsanspruchUuid,
      MitarbeiterUuid,
      @EndUserText.label: 'Jahr'
      Jahr,
      @EndUserText.label: 'Urlaubstage'
      Urlaubstage,
      MitarbeiterName,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      GeplanteUrlaubstage,
      VerbrauchteUrlaubstage,
      VerfuegbareUrlaubstage,


      _Mitarbeiter : redirected to parent ZRESK_C_Mitarbeiter


}
