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

  DATA travels TYPE TABLE of /DMO/I_TRAVEL_D.

  SELECT FROM /DMO/I_TRAVEL_D
   FIELDS *
   into table @travels.

   out->write( travels ).

  ENDMETHOD.
ENDCLASS.
