CLASS zcl_jojoba_abap_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_jojoba_abap_06 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*    DATA customers_kpi TYPE TABLE OF ZJOJOBA_CustomerKPIs.
    DATA customer_kpi TYPE TABLE OF ZJOJOBA_CustomerKPIs.

    SELECT
      FROM ZJOJOBA_CustomerKPIs( P_CityID = 'Mainz' )
      FIELDS CustomerID, CustomerName, TotalRevenue
      ORDER BY TotalRevenue DESCENDING
      INTO TABLE @DATA(customers_kpi).

    out->write( customers_kpi ).
  ENDMETHOD.
ENDCLASS.
