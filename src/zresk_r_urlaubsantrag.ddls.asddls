@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View Urlaubsantrag'
define view entity ZRESK_R_Urlaubsantrag
  as select from zresk_uantrag
  association        to parent ZRESK_R_Mitarbeiter as _Antragsteller     on $projection.AntragstellerUuid = _Antragsteller.MitarbeiterUuid
  association [1..1] to ZRESK_R_Mitarbeiter        as _Genehmigender     on $projection.GenehmigenderUuid = _Genehmigender.MitarbeiterUuid
  association [1..1] to ZRESK_I_MitarbeiterText    as _GenehmigenderName on $projection.GenehmigenderUuid = _GenehmigenderName.MitarbeiterUuid
  association [1..1] to ZRESK_I_MitarbeiterText    as _AntragstellerName on $projection.AntragstellerUuid = _AntragstellerName.MitarbeiterUuid
  association        to ZRESK_I_StatusText         as _statustext        on $projection.UrlaubsantragUuid = _statustext.urlaubsantrag_uuid

{
  key urlaubsantrag_uuid      as UrlaubsantragUuid,
      antragsteller_uuid      as AntragstellerUuid,
      genehmigender_uuid      as GenehmigenderUuid,
      startdatum              as Startdatum,
      enddatum                as Enddatum,
      urlaubstage             as Urlaubstage,
      kommentar               as Kommentar,
      status                  as Status,

      @Semantics.user.createdBy: true
      created_by              as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at              as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by         as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at         as LastChangedAt,

      case status when 'G' then 3
                  when 'B' then 2
                  when 'A' then 1
                  else 0
            end               as StatusKritikalitaet,

      
      _GenehmigenderName.Name as GenehmigenderName,
      _AntragstellerName.Name as AntragstellerName,
      _statustext.StatusText  as StatusText,


      // Associations 
      _Antragsteller,
      _Genehmigender

}
