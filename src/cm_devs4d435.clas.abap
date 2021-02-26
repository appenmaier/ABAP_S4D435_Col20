CLASS cm_devs4d435 DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cm_frw
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CONSTANTS:
      BEGIN OF cancel_success,
        msgid TYPE symsgid VALUE 'DEVS4D435',
        msgno TYPE symsgno VALUE '120',
        attr1 TYPE scx_attrname VALUE 'TRAVEL_NUMBER',
        attr2 TYPE scx_attrname VALUE 'START_DATE_TXT',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF cancel_success .
    CONSTANTS:
      BEGIN OF already_cancelled,
        msgid TYPE symsgid VALUE 'DEVS4D435',
        msgno TYPE symsgno VALUE '130',
        attr1 TYPE scx_attrname VALUE 'TRAVEL_NUMBER',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF already_cancelled .

    CONSTANTS:
      BEGIN OF customer_not_exist,
        msgid TYPE symsgid VALUE 'DEVS4D435',
        msgno TYPE symsgno VALUE '200',
        attr1 TYPE scx_attrname VALUE 'CUSTOMER',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF customer_not_exist.

    CONSTANTS:
      BEGIN OF dates_wrong_sequence,
        msgid TYPE symsgid VALUE 'DEVS4D435',
        msgno TYPE symsgno VALUE '210',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF dates_wrong_sequence.

    CONSTANTS:
      BEGIN OF end_date_past,
        msgid TYPE symsgid VALUE 'DEVS4D435',
        msgno TYPE symsgno VALUE '220',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF end_date_past.

    CONSTANTS:
      BEGIN OF start_date_past,
        msgid TYPE symsgid VALUE 'DEVS4D435',
        msgno TYPE symsgno VALUE '230',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF start_date_past.

    CONSTANTS:
      BEGIN OF class_invalid,
        msgid TYPE symsgid VALUE 'DEVS4D435',
        msgno TYPE symsgno VALUE '300',
        attr1 TYPE scx_attrname VALUE 'FLIGHTCLASS',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF class_invalid.

    CONSTANTS:
      BEGIN OF flight_date_past,
        msgid TYPE symsgid VALUE 'DEVS4D435',
        msgno TYPE symsgno VALUE '310',
        attr1 TYPE scx_attrname VALUE ' ',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF flight_date_past.

    CONSTANTS:
      BEGIN OF flight_not_exist,
        msgid TYPE symsgid VALUE 'DEVS4D435',
        msgno TYPE symsgno VALUE '320',
        attr1 TYPE scx_attrname VALUE 'AIRLINEID',
        attr2 TYPE scx_attrname VALUE 'CONNECTIONNUMBER',
        attr3 TYPE scx_attrname VALUE 'FLIGHTDATE_TXT',
        attr4 TYPE scx_attrname VALUE '',
      END OF flight_not_exist.

    METHODS constructor
      IMPORTING
        !textid                  LIKE if_t100_message=>t100key OPTIONAL
        !previous                LIKE previous OPTIONAL
        !severity                TYPE ty_message_severity OPTIONAL
        !symptom                 TYPE ty_message_symptom OPTIONAL
        !lifetime                TYPE ty_message_lifetime DEFAULT co_lifetime_transition
        !ms_origin_location      TYPE /bobf/s_frw_location OPTIONAL
        !mt_environment_location TYPE /bobf/t_frw_location OPTIONAL
        !mv_act_key              TYPE /bobf/act_key OPTIONAL
        !mv_assoc_key            TYPE /bobf/obm_assoc_key OPTIONAL
        !mv_bopf_location        TYPE /bobf/conf_key OPTIONAL
        !mv_det_key              TYPE /bobf/det_key OPTIONAL
        !mv_query_key            TYPE /bobf/obm_query_key OPTIONAL
        !mv_val_key              TYPE /bobf/val_key OPTIONAL
        !travelnumber            TYPE s_travelid OPTIONAL
        !startdate               TYPE s_stdat OPTIONAL
        !customer                TYPE s_customer OPTIONAL
        !flightclass             type s_class OPTIONAL
        !airlineID               type s_Carr_id OPTIONAL
        !connectionnumber        type s_conn_id OPTIONAL
        !flightdate              type s_date    OPTIONAL.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA travelnumber  TYPE s_travelid .
    DATA startdate_txt TYPE char10 .

    DATA customer       TYPE s_customer.

    data flightclass    type s_class.

    data airlineid type s_carr_id.
    data connectionnumber type s_conn_id.
    data flightdate_txt     type c length 10.

ENDCLASS.



CLASS CM_DEVS4D435 IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous                = previous
        severity                = severity
        symptom                 = symptom
        lifetime                = lifetime
        ms_origin_location      = ms_origin_location
        mt_environment_location = mt_environment_location
        mv_act_key              = mv_act_key
        mv_assoc_key            = mv_assoc_key
        mv_bopf_location        = mv_bopf_location
        mv_det_key              = mv_det_key
        mv_query_key            = mv_query_key
        mv_val_key              = mv_val_key.
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

    me->travelnumber = travelnumber.
*    WRITE startdate TO me->startdate_txt.
    me->startdate_txt = |{ startdate DATE = USER }|.

    me->customer =  customer.

    me->flightclass = flightclass.

    me->airlineid = airlineid.
    me->connectionnumber = connectionnumber.
    me->flightdate_txt = |{ flightdate date = user }|.

  ENDMETHOD.
ENDCLASS.
