CLASS lhc_mitarbeiter DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS autorisierung_mitarbeiter FOR INSTANCE AUTHORIZATION
      IMPORTING key REQUEST requested_authorization FOR ZRESK_R_Mitarbeiter RESULT result.

    METHODS autorisierung_urlaubsantrag FOR INSTANCE AUTHORIZATION
      IMPORTING key REQUEST requested_authorization FOR ZRESK_R_Urlaubsantrag RESULT result.

    METHODS urlaubstage_bestimmen
      FOR DETERMINE ON MODIFY
      IMPORTING keys FOR ZRESK_R_Urlaubsantrag~BestimmeUrlaubstage.

    METHODS antrag_genehmigen FOR MODIFY
      IMPORTING keys FOR ACTION ZRESK_r_urlaubsantrag~GenehmigeUrlaubsantrag RESULT result.

    METHODS antrag_ablehnen FOR MODIFY
      IMPORTING keys FOR ACTION ZRESK_r_urlaubsantrag~AblehnenUrlaubsantrag RESULT result.

    METHODS datum_pruefen
      FOR VALIDATE ON SAVE
      IMPORTING keys FOR ZRESK_R_Urlaubsantrag~BestaetigeDatum.

    METHODS urlaubstage_pruefen
      FOR VALIDATE ON SAVE
      IMPORTING keys FOR ZRESK_R_Urlaubsantrag~BestaetigeUrlaubstage.

    METHODS status_vorbelegen
      FOR DETERMINE ON MODIFY
      IMPORTING keys FOR ZRESK_R_Urlaubsantrag~BestimmeStatus.

ENDCLASS.



CLASS lhc_mitarbeiter IMPLEMENTATION.

  METHOD autorisierung_mitarbeiter.
    " Autorisierung für Mitarbeiter
  ENDMETHOD.

  METHOD autorisierung_urlaubsantrag.
    " Autorisierung für Urlaubsanträge
  ENDMETHOD.


  METHOD antrag_genehmigen.
    DATA lo_meldung TYPE REF TO zresk_cm_mitarbeiter.

    " Anträge lesen
    READ ENTITY IN LOCAL MODE ZRESK_r_urlaubsantrag
      FIELDS ( Status Kommentar )
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_urlaubsantraege).

    " Antrag prüfen
    LOOP AT lt_urlaubsantraege REFERENCE INTO DATA(lr_urlaubsantrag).

      CASE lr_urlaubsantrag->Status.

        WHEN 'A'.
          " Bereits abgelehnt
          lo_meldung = NEW zresk_cm_mitarbeiter(
            textid   = zresk_cm_mitarbeiter=>antrag_bereits_abgelehnt
            severity = if_abap_behv_message=>severity-error
            comment  = lr_urlaubsantrag->Kommentar ).

          APPEND VALUE #(
            %tky = lr_urlaubsantrag->%tky
            %msg = lo_meldung )
            TO reported-ZRESK_r_urlaubsantrag.

          APPEND VALUE #( %tky = lr_urlaubsantrag->%tky )
            TO failed-ZRESK_r_urlaubsantrag.

          CONTINUE.

        WHEN 'G'.
          " Bereits genehmigt
          lo_meldung = NEW zresk_cm_mitarbeiter(
            textid   = zresk_cm_mitarbeiter=>antrag_bereits_angenommen
            severity = if_abap_behv_message=>severity-error
            comment  = lr_urlaubsantrag->Kommentar ).

          APPEND VALUE #(
            %tky = lr_urlaubsantrag->%tky
            %msg = lo_meldung )
            TO reported-ZRESK_r_urlaubsantrag.

          APPEND VALUE #( %tky = lr_urlaubsantrag->%tky )
            TO failed-ZRESK_r_urlaubsantrag.

          CONTINUE.

        WHEN OTHERS.
          " Antrag genehmigen
          lr_urlaubsantrag->Status = 'G'.

          lo_meldung = NEW zresk_cm_mitarbeiter(
            textid   = zresk_cm_mitarbeiter=>antrag_angenommen
            severity = if_abap_behv_message=>severity-success
            comment  = lr_urlaubsantrag->Kommentar ).

          APPEND VALUE #(
            %tky = lr_urlaubsantrag->%tky
            %msg = lo_meldung )
            TO reported-ZRESK_r_urlaubsantrag.

      ENDCASE.

    ENDLOOP.

    " Statusänderung schreiben
    MODIFY ENTITY IN LOCAL MODE ZRESK_r_urlaubsantrag
      UPDATE FIELDS ( Status )
      WITH VALUE #(
        FOR lr_ua IN lt_urlaubsantraege
        ( %tky  = lr_ua-%tky
          Status = lr_ua-Status ) ).

    " Ergebnis für Action zurückgeben
    result = VALUE #(
      FOR lr_ua IN lt_urlaubsantraege
      ( %tky   = lr_ua-%tky
        %param = lr_ua ) ).
  ENDMETHOD.



  METHOD antrag_ablehnen.
    DATA lo_meldung TYPE REF TO zresk_cm_mitarbeiter.

    " Anträge lesen
    READ ENTITY IN LOCAL MODE ZRESK_r_urlaubsantrag
      FIELDS ( Status Kommentar )
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_urlaubsantraege).

    "Antrag prüfen
    LOOP AT lt_urlaubsantraege REFERENCE INTO DATA(lr_urlaubsantrag).

      CASE lr_urlaubsantrag->Status.

        WHEN 'A'.
          "Bereits abgelehnt
          lo_meldung = NEW zresk_cm_mitarbeiter(
            textid   = zresk_cm_mitarbeiter=>antrag_bereits_abgelehnt
            severity = if_abap_behv_message=>severity-error
            comment  = lr_urlaubsantrag->Kommentar ).

          APPEND VALUE #(
            %tky = lr_urlaubsantrag->%tky
            %msg = lo_meldung )
            TO reported-ZRESK_r_urlaubsantrag.

          APPEND VALUE #( %tky = lr_urlaubsantrag->%tky )
            TO failed-ZRESK_r_urlaubsantrag.

          CONTINUE.

        WHEN 'G'.
          " Bereits genehmigt
          lo_meldung = NEW zresk_cm_mitarbeiter(
            textid   = zresk_cm_mitarbeiter=>antrag_bereits_angenommen
            severity = if_abap_behv_message=>severity-error
            comment  = lr_urlaubsantrag->Kommentar ).

          APPEND VALUE #(
            %tky = lr_urlaubsantrag->%tky
            %msg = lo_meldung )
            TO reported-ZRESK_r_urlaubsantrag.

          APPEND VALUE #( %tky = lr_urlaubsantrag->%tky )
            TO failed-ZRESK_r_urlaubsantrag.

          CONTINUE.

        WHEN OTHERS.
          " Antrag ablehnen
          lr_urlaubsantrag->Status = 'A'.

          lo_meldung = NEW zresk_cm_mitarbeiter(
            textid   = zresk_cm_mitarbeiter=>antrag_ablehnen
            severity = if_abap_behv_message=>severity-success
            comment  = lr_urlaubsantrag->Kommentar ).

          APPEND VALUE #(
            %tky = lr_urlaubsantrag->%tky
            %msg = lo_meldung )
            TO reported-ZRESK_r_urlaubsantrag.

      ENDCASE.

    ENDLOOP.

    " Statusänderung schreiben
    MODIFY ENTITY IN LOCAL MODE ZRESK_r_urlaubsantrag
      UPDATE FIELDS ( Status )
      WITH VALUE #(
        FOR lr_ua IN lt_urlaubsantraege
        ( %tky  = lr_ua-%tky
          Status = lr_ua-Status ) ).

    " Ergebnis für Action zurückgeben
    result = VALUE #(
      FOR lr_ua IN lt_urlaubsantraege
      ( %tky   = lr_ua-%tky
        %param = lr_ua ) ).
  ENDMETHOD.



  METHOD status_vorbelegen.
    " Anträge lesen
    READ ENTITY IN LOCAL MODE ZRESK_R_Urlaubsantrag
      FIELDS ( Status )
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_urlaubsantraege).

    " Status auf 'B' setzen
    MODIFY ENTITY IN LOCAL MODE ZRESK_R_Urlaubsantrag
      UPDATE FIELDS ( Status )
      WITH VALUE #(
        FOR ls_ua IN lt_urlaubsantraege
        ( %tky   = ls_ua-%tky
          Status = 'B' ) ).
  ENDMETHOD.



  METHOD urlaubstage_bestimmen.
    " Start- und Enddatum lesen
    READ ENTITY IN LOCAL MODE ZRESK_r_urlaubsantrag
      FIELDS ( Startdatum Enddatum )
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_urlaubsantraege).

    DATA lv_arbeitstage TYPE i.

    " Urlaubstage je Antrag berechnen
    LOOP AT lt_urlaubsantraege INTO DATA(ls_urlaubsantrag).

      " Startdatum für Kalender anpassen
      DATA(lv_startdatum) = ls_urlaubsantrag-Startdatum.
      lv_startdatum = lv_startdatum - 1.

      TRY.
          DATA(lo_kalender) = cl_fhc_calendar_runtime=>create_factorycalendar_runtime( 'SAP_DE_BW' ).
          lv_arbeitstage = lo_kalender->calc_workingdays_between_dates(
                             iv_start = lv_startdatum
                             iv_end   = ls_urlaubsantrag-Enddatum ).
        CATCH cx_fhc_runtime.
          " Bei Fehler alten Wert lassen
      ENDTRY.

      " Urlaubstage im Antrag setzen
      MODIFY ENTITY IN LOCAL MODE ZRESK_r_urlaubsantrag
        UPDATE FIELDS ( Urlaubstage )
        WITH VALUE #(
          FOR ls_update IN lt_urlaubsantraege
          ( %tky        = ls_update-%tky
            urlaubstage = lv_arbeitstage ) ).

    ENDLOOP.
  ENDMETHOD.



  METHOD datum_pruefen.
    DATA lo_meldung       TYPE REF TO zresk_cm_mitarbeiter.
    DATA(lo_context_info) = NEW cl_abap_context_info( ).
    DATA(lv_heute)        = lo_context_info->get_system_date( ).

    " Datumsfelder
    READ ENTITY IN LOCAL MODE ZRESK_R_Urlaubsantrag
      FIELDS ( Startdatum Enddatum )
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_urlaubsantraege).

    " Datumsprüfung je Antrag
    LOOP AT lt_urlaubsantraege INTO DATA(ls_urlaubsantrag).

      " Enddatum nach Startdatum?
      IF ls_urlaubsantrag-Enddatum < ls_urlaubsantrag-Startdatum.
        lo_meldung = NEW zresk_cm_mitarbeiter(
          textid   = zresk_cm_mitarbeiter=>enddatum_vor_startdatum
          severity = if_abap_behv_message=>severity-error ).

        APPEND VALUE #(
          %tky = ls_urlaubsantrag-%tky
          %msg = lo_meldung )
          TO reported-ZRESK_r_urlaubsantrag.

        APPEND VALUE #( %tky = ls_urlaubsantrag-%tky )
          TO failed-ZRESK_r_urlaubsantrag.
      ENDIF.

      " Startdatum darf nicht in der Vergangenheit liegen
      IF ls_urlaubsantrag-Startdatum < lv_heute.
        lo_meldung = NEW zresk_cm_mitarbeiter(
          textid   = zresk_cm_mitarbeiter=>antrag_start_vorbei
          severity = if_abap_behv_message=>severity-error ).

        APPEND VALUE #(
          %tky = ls_urlaubsantrag-%tky
          %msg = lo_meldung )
          TO reported-ZRESK_r_urlaubsantrag.

        APPEND VALUE #( %tky = ls_urlaubsantrag-%tky )
          TO failed-ZRESK_r_urlaubsantrag.
      ENDIF.

    ENDLOOP.
  ENDMETHOD.



  METHOD urlaubstage_pruefen.
    DATA lo_meldung TYPE REF TO zresk_cm_mitarbeiter.

    " Alle relevanten Felder lesen
    READ ENTITY IN LOCAL MODE ZRESK_r_urlaubsantrag
      ALL FIELDS
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_urlaubsantraege).

    " Je Antrag verfügbare Tage prüfen
    LOOP AT lt_urlaubsantraege INTO DATA(ls_urlaubsantrag).

      TRY.
          " Arbeitstage im Zeitraum berechnen
          DATA(lo_kalender) = cl_fhc_calendar_runtime=>create_factorycalendar_runtime( 'SAP_DE_BW' ).
          DATA(lv_urlaubstage) = lo_kalender->calc_workingdays_between_dates(
                                   iv_start = ls_urlaubsantrag-Startdatum
                                   iv_end   = ls_urlaubsantrag-Enddatum ) + 1.
        CATCH cx_fhc_runtime.
          " Bei Fehler nächsten Antrag prüfen
          CONTINUE.
      ENDTRY.

      " Verfügbare Urlaubstage lesen
      SELECT SINGLE VerfuegbareUrlaubstage
        FROM ZRESK_r_urlaubsanspruch
        WHERE MitarbeiterUuid = @ls_urlaubsantrag-AntragstellerUuid
          AND Jahr            = @ls_urlaubsantrag-Startdatum+0(4)
        INTO @DATA(lv_verfuegbare_urlaubstage).

      " Prüfen, ob genug Urlaub vorhanden ist
      IF lv_verfuegbare_urlaubstage < lv_urlaubstage.

        lo_meldung = NEW zresk_cm_mitarbeiter(
          textid   = zresk_cm_mitarbeiter=>nicht_genuegend_urlaubstage
          severity = if_abap_behv_message=>severity-error ).

        APPEND VALUE #(
          %tky = ls_urlaubsantrag-%tky
          %msg = lo_meldung )
          TO reported-ZRESK_r_urlaubsantrag.

        APPEND VALUE #( %tky = ls_urlaubsantrag-%tky )
          TO failed-ZRESK_r_urlaubsantrag.
      ENDIF.

    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
