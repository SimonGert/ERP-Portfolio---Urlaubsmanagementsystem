@AbapCatalog.sqlViewName: 'ZRESK_I_UANTRAG'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Urlaubsantrag Value Help'
define view ZRESK_I_UrlaubsantragVH
  as select from zresk_uantrag
{

  key urlaubsantrag_uuid as UrlaubsantragUuid,
      antragsteller_uuid as AntragstellerUuid,
      genehmigender_uuid as GenehmigenderUuid,
      startdatum         as Startdatum,
      enddatum           as Enddatum,
      urlaubstage        as Urlaubstage,
      kommentar          as Kommentar,
      status             as Status,
      created_by         as CreatedBy,
      created_at         as CreatedAt,
      last_changed_by    as LastChangedBy,
      last_changed_at    as LastChangedAt
}
