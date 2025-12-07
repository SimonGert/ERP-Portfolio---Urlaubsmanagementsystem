CLASS zresk_cm_mitarbeiter DEFINITION PUBLIC
  INHERITING FROM cx_static_check FINAL CREATE PUBLIC.

  PUBLIC SECTION.

    " Interfaces
    INTERFACES if_abap_behv_message.
    INTERFACES if_t100_message.
    INTERFACES if_t100_dyn_msg.


    " Nachrichten
CONSTANTS:
      BEGIN OF antrag_ablehnen,
        msgid TYPE symsgid      VALUE 'ZRESK_MITARBEITER',
        msgno TYPE symsgno      VALUE '001',
        attr1 TYPE scx_attrname VALUE 'Comment',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF antrag_ablehnen.


    CONSTANTS:
      BEGIN OF antrag_bereits_abgelehnt,
        msgid TYPE symsgid      VALUE 'ZRESK_MITARBEITER',
        msgno TYPE symsgno      VALUE '002',
        attr1 TYPE scx_attrname VALUE 'Comment',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF antrag_bereits_abgelehnt.


    CONSTANTS:
      BEGIN OF antrag_angenommen,
        msgid TYPE symsgid      VALUE 'ZRESK_MITARBEITER',
        msgno TYPE symsgno      VALUE '003',
        attr1 TYPE scx_attrname VALUE 'Comment',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF antrag_angenommen.


    CONSTANTS:
      BEGIN OF antrag_bereits_angenommen,
        msgid TYPE symsgid      VALUE 'ZRESK_MITARBEITER',
        msgno TYPE symsgno      VALUE '004',
        attr1 TYPE scx_attrname VALUE 'Comment',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF antrag_bereits_angenommen.


  CONSTANTS:
      BEGIN OF enddatum_vor_startdatum,
        msgid TYPE symsgid      VALUE 'ZRESK_MITARBEITER',
        msgno TYPE symsgno      VALUE '005',
        attr1 TYPE scx_attrname VALUE 'Comment',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF enddatum_vor_startdatum.


    CONSTANTS:
      BEGIN OF nicht_genuegend_urlaubstage,
        msgid TYPE symsgid      VALUE 'ZRESK_MITARBEITER',
        msgno TYPE symsgno      VALUE '006',
        attr1 TYPE scx_attrname VALUE 'Comment',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF nicht_genuegend_urlaubstage .


    CONSTANTS:
      BEGIN OF antrag_start_vorbei,
        msgid TYPE symsgid      VALUE 'ZRESK_MITARBEITER',
        msgno TYPE symsgno      VALUE '007',
        attr1 TYPE scx_attrname VALUE 'Comment',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF antrag_start_vorbei.



    " Attribute
    DATA Comment TYPE zresk_kommentar.

    "Konstruktor
    METHODS constructor
      IMPORTING severity  TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
                textid    LIKE if_t100_message=>t100key         DEFAULT if_t100_message=>default_textid
                !previous LIKE previous                         OPTIONAL
                Comment   TYPE zresk_kommentar                   OPTIONAL.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.




CLASS ZRESK_CM_MITARBEITER IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).

    if_t100_message~t100key = textid.
    if_abap_behv_message~m_severity = severity.
    me->Comment = Comment.
  ENDMETHOD.
ENDCLASS.
