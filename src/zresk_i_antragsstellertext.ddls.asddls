@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view Mitarbeiter Text'
define view entity ZRESK_I_AntragsstellerText as select from zresk_uantrag
{
        key antragsteller_uuid as AntragstellerUuid,
    genehmigender_uuid as Genehmigender,
    startdatum as Startdatum
}
