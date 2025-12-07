CLASS zresk_cl_mitarbeiter_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS Zresk_CL_MITARBEITER_GENERATOR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA mitarbeiter  TYPE Zresk_arbeiter.
    DATA mitarbeitende TYPE TABLE OF Zresk_arbeiter.


    DATA urlaubsanspruch TYPE Zresk_Uanspruch.
    DATA urlaubsansprueche TYPE TABLE OF Zresk_Uanspruch.


    DATA urlaubsantrag TYPE Zresk_Uantrag.
    DATA urlaubsantraege TYPE TABLE OF Zresk_Uantrag.



    " Mitarbeiter Löschen
    DELETE FROM zresk_arbeiter.
    out->write( |Gelöschte Mitarbeiter: { sy-dbcnt }| ).

    " Urlaubsantrage löschen
    DELETE FROM zresk_uantrag.
    out->write( |Gelöschte Urlaubsanträge: { sy-dbcnt }| ).

    " Urlaubsansprüche löschen
    DELETE FROM zresk_uanspruch.
    out->write( |Gelöschte Urlaubsansprüche: { sy-dbcnt }| ).


    " Mitarbeiter erstellen
    mitarbeiter-client = sy-mandt.
    mitarbeiter-mitarbeiternummer = '000001'.
    mitarbeiter-mitarbeiter_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    mitarbeiter-vorname = 'Hans'.
    mitarbeiter-nachname = 'Maier'.
    mitarbeiter-eintrittsdatum = '20000501'.
    GET TIME STAMP FIELD mitarbeiter-created_at.
    GET TIME STAMP FIELD mitarbeiter-last_changed_at.
    mitarbeiter-created_by = 'GENERATOR'.
    mitarbeiter-last_changed_by = 'GENERATOR'.
    APPEND mitarbeiter TO mitarbeitende.

    mitarbeiter-client = sy-mandt.
    mitarbeiter-mitarbeiternummer = '000002'.
    mitarbeiter-mitarbeiter_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    mitarbeiter-vorname = 'Lisa'.
    mitarbeiter-nachname = 'Müller'.
    mitarbeiter-eintrittsdatum = '20100701'.
    GET TIME STAMP FIELD mitarbeiter-created_at.
    GET TIME STAMP FIELD mitarbeiter-last_changed_at.
    mitarbeiter-created_by = 'GENERATOR'.
    mitarbeiter-last_changed_by = 'GENERATOR'.
    APPEND mitarbeiter TO mitarbeitende.

    mitarbeiter-client = sy-mandt.
    mitarbeiter-mitarbeiternummer = '000003'.
    mitarbeiter-mitarbeiter_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    mitarbeiter-vorname = 'Petra'.
    mitarbeiter-nachname = 'Schmid'.
    mitarbeiter-eintrittsdatum = '20231001'.
    GET TIME STAMP FIELD mitarbeiter-created_at.
    GET TIME STAMP FIELD mitarbeiter-last_changed_at.
    mitarbeiter-created_by = 'GENERATOR'.
    mitarbeiter-last_changed_by = 'GENERATOR'.
    APPEND mitarbeiter TO mitarbeitende.




    INSERT zresk_arbeiter FROM TABLE @mitarbeitende.
    out->write( |Eingefügte Mitarbeiter: { sy-dbcnt }| ).

    DATA(lv_emp_hans)  = mitarbeitende[ mitarbeiternummer = '000001' ]-mitarbeiter_uuid.
    DATA(lv_emp_lisa)  = mitarbeitende[ mitarbeiternummer = '000002' ]-mitarbeiter_uuid.
    DATA(lv_emp_petra) = mitarbeitende[ mitarbeiternummer = '000003' ]-mitarbeiter_uuid.



    "Urlaubsantrag erstellen
    urlaubsantrag-urlaubsantrag_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    urlaubsantrag-antragsteller_uuid = lv_emp_hans.
    urlaubsantrag-genehmigender_uuid = lv_emp_lisa.
    urlaubsantrag-startdatum = '20250701'.
    urlaubsantrag-enddatum = '20250710'.
    urlaubsantrag-urlaubstage = 8.
    urlaubsantrag-kommentar = 'Sommerurlaub'.
    urlaubsantrag-status = 'G'.
    GET TIME STAMP FIELD urlaubsantrag-created_at.
    GET TIME STAMP FIELD urlaubsantrag-last_changed_at.
    urlaubsantrag-created_by = 'GENERATOR'.
    urlaubsantrag-last_changed_by = 'GENERATOR'.
    APPEND urlaubsantrag TO urlaubsantraege.

    urlaubsantrag-urlaubsantrag_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    urlaubsantrag-antragsteller_uuid = lv_emp_hans.
    urlaubsantrag-genehmigender_uuid = lv_emp_lisa.
    urlaubsantrag-startdatum = '20251227'.
    urlaubsantrag-enddatum = '20251230'.
    urlaubsantrag-urlaubstage = 4.
    urlaubsantrag-kommentar = 'Weihnachtsurlaub'.
    urlaubsantrag-status = 'A'.
    GET TIME STAMP FIELD urlaubsantrag-created_at.
    GET TIME STAMP FIELD urlaubsantrag-last_changed_at.
    urlaubsantrag-created_by = 'GENERATOR'.
    urlaubsantrag-last_changed_by = 'GENERATOR'.
    APPEND urlaubsantrag TO urlaubsantraege.

    urlaubsantrag-urlaubsantrag_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    urlaubsantrag-antragsteller_uuid = lv_emp_hans.
    urlaubsantrag-genehmigender_uuid = lv_emp_lisa.
    urlaubsantrag-startdatum = '20251228'.
    urlaubsantrag-enddatum = '20251230'.
    urlaubsantrag-urlaubstage = 3.
    urlaubsantrag-kommentar = 'Weihnachtsurlaub (2.Versuch)'.
    urlaubsantrag-status = 'G'.
    GET TIME STAMP FIELD urlaubsantrag-created_at.
    GET TIME STAMP FIELD urlaubsantrag-last_changed_at.
    urlaubsantrag-created_by = 'GENERATOR'.
    urlaubsantrag-last_changed_by = 'GENERATOR'.
    APPEND urlaubsantrag TO urlaubsantraege.

    urlaubsantrag-urlaubsantrag_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    urlaubsantrag-antragsteller_uuid = lv_emp_hans.
    urlaubsantrag-genehmigender_uuid = lv_emp_lisa.
    urlaubsantrag-startdatum = '20260527'.
    urlaubsantrag-enddatum = '20260614'.
    urlaubsantrag-urlaubstage = 14.
    urlaubsantrag-kommentar = ''.
    urlaubsantrag-status = 'G'.
    GET TIME STAMP FIELD urlaubsantrag-created_at.
    GET TIME STAMP FIELD urlaubsantrag-last_changed_at.
    urlaubsantrag-created_by = 'GENERATOR'.
    urlaubsantrag-last_changed_by = 'GENERATOR'.
    APPEND urlaubsantrag TO urlaubsantraege.

    urlaubsantrag-urlaubsantrag_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    urlaubsantrag-antragsteller_uuid = lv_emp_hans.
    urlaubsantrag-genehmigender_uuid = lv_emp_lisa.
    urlaubsantrag-startdatum = '20261220'.
    urlaubsantrag-enddatum = '20261231'.
    urlaubsantrag-urlaubstage = 8.
    urlaubsantrag-kommentar = 'Winterurlaub'.
    urlaubsantrag-status = 'B'.
    GET TIME STAMP FIELD urlaubsantrag-created_at.
    GET TIME STAMP FIELD urlaubsantrag-last_changed_at.
    urlaubsantrag-created_by = 'GENERATOR'.
    urlaubsantrag-last_changed_by = 'GENERATOR'.
    APPEND urlaubsantrag TO urlaubsantraege.

    urlaubsantrag-urlaubsantrag_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    urlaubsantrag-antragsteller_uuid = lv_emp_petra.
    urlaubsantrag-genehmigender_uuid = lv_emp_hans.
    urlaubsantrag-startdatum = '20251227'.
    urlaubsantrag-enddatum = '20251231'.
    urlaubsantrag-urlaubstage = 3.
    urlaubsantrag-kommentar = 'Weihnachtsurlaub'.
    urlaubsantrag-status = 'B'.
    GET TIME STAMP FIELD urlaubsantrag-created_at.
    GET TIME STAMP FIELD urlaubsantrag-last_changed_at.
    urlaubsantrag-created_by = 'GENERATOR'.
    urlaubsantrag-last_changed_by = 'GENERATOR'.
    APPEND urlaubsantrag TO urlaubsantraege.



    INSERT zresk_uantrag FROM TABLE @urlaubsantraege.
    out->write( |Eingefügte Urlaubsantraege: { sy-dbcnt }| ).




    "Urlaubsanspruch erstellen

    urlaubsanspruch-urlaubsanspruch_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    urlaubsanspruch-mitarbeiter_uuid = lv_emp_hans.
    urlaubsanspruch-urlaubstage = 30.
    urlaubsanspruch-jahr = 2025.
    GET TIME STAMP FIELD urlaubsanspruch-created_at.
    GET TIME STAMP FIELD urlaubsanspruch-last_changed_at.
    urlaubsanspruch-created_by = 'GENERATOR'.
    urlaubsanspruch-last_changed_by = 'GENERATOR'.
    APPEND urlaubsanspruch TO urlaubsansprueche.

    urlaubsanspruch-urlaubsanspruch_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    urlaubsanspruch-mitarbeiter_uuid = lv_emp_hans.
    urlaubsanspruch-urlaubstage = 30.
    urlaubsanspruch-jahr = 2026.
    GET TIME STAMP FIELD urlaubsanspruch-created_at.
    GET TIME STAMP FIELD urlaubsanspruch-last_changed_at.
    urlaubsanspruch-created_by = 'GENERATOR'.
    urlaubsanspruch-last_changed_by = 'GENERATOR'.
    APPEND urlaubsanspruch TO urlaubsansprueche.

    urlaubsanspruch-urlaubsanspruch_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    urlaubsanspruch-mitarbeiter_uuid = lv_emp_lisa.
    urlaubsanspruch-urlaubstage = 30.
    urlaubsanspruch-jahr = 2025.
    GET TIME STAMP FIELD urlaubsanspruch-created_at.
    GET TIME STAMP FIELD urlaubsanspruch-last_changed_at.
    urlaubsanspruch-created_by = 'GENERATOR'.
    urlaubsanspruch-last_changed_by = 'GENERATOR'.
    APPEND urlaubsanspruch TO urlaubsansprueche.

    urlaubsanspruch-urlaubsanspruch_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    urlaubsanspruch-mitarbeiter_uuid = lv_emp_petra.
    urlaubsanspruch-urlaubstage = 7.
    urlaubsanspruch-jahr = 2025.
    GET TIME STAMP FIELD urlaubsanspruch-created_at.
    GET TIME STAMP FIELD urlaubsanspruch-last_changed_at.
    urlaubsanspruch-created_by = 'GENERATOR'.
    urlaubsanspruch-last_changed_by = 'GENERATOR'.
    APPEND urlaubsanspruch TO urlaubsansprueche.



    INSERT zresk_uanspruch FROM TABLE @urlaubsansprueche.
    out->write( |Eingefügte Urlaubsansprüche: { sy-dbcnt }| ).


  ENDMETHOD.
ENDCLASS.
