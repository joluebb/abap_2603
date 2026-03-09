CLASS zcl_jojoba_demo_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_jojoba_demo_01 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA travels TYPE TABLE OF /DMO/C_Booking_Approver_M.

    SELECT FROM /DMO/C_Booking_Approver_M
      FIELDS *
      WHERE CarrierID = 'LH' AND ConnectionID = 0400
      INTO TABLE @travels.


    out->write( travels ).
  ENDMETHOD.
ENDCLASS.
