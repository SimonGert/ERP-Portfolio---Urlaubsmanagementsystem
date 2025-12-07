@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View Mitarbeiter'
define root view entity ZRESK_R_Mitarbeiter
  as select from zresk_arbeiter
  composition [0..*] of ZRESK_R_Urlaubsanspruch        as _Urlaubsanspruch
  composition [0..*] of ZRESK_R_Urlaubsantrag          as _Urlaubsantrag
  association [1..1] to ZRESK_I_MitarbeiterText        as _MitarbeiterText on $projection.MitarbeiterUuid = _MitarbeiterText.MitarbeiterUuid
  association [1..*] to ZRESK_R_Urlaubsantrag          as _Antragsteller on $projection.MitarbeiterUuid = _Antragsteller.AntragstellerUuid
  association [1..*] to ZRESK_R_Urlaubsantrag          as _Genehmigender on $projection.MitarbeiterUuid = _Genehmigender.GenehmigenderUuid
  
  
{
  @ObjectModel.text.element: ['MitarbeiterName']
  key mitarbeiter_uuid                   as MitarbeiterUuid,
      mitarbeiternummer                  as Mitarbeiternummer,
      vorname                            as Vorname,
      nachname                           as Nachname,
      eintrittsdatum                     as Eintrittsdatum,

      created_by                         as CreatedBy,
      created_at                         as CreatedAt,
      last_changed_by                    as LastChangedBy,
      last_changed_at                    as LastChangedAt,

      _Urlaubsanspruch,
      _Antragsteller,
      _Genehmigender,
      _Urlaubsantrag,
      
      _MitarbeiterText.Name as MitarbeiterName
        
}
