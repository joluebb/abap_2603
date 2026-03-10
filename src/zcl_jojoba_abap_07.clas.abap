CLASS zcl_jojoba_abap_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_jojoba_abap_07 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT FROM ZJOJOBA_CustomerWithTravels
      FIELDS CustomerId,FirstName,LastName,Title,City,PostalCode,Street,\_Travels-AgencyId,\_Travels-BeginDate,\_Travels-BookingFee,\_Travels-CurrencyCode,\_Travels-Description,\_Travels-EndDate,\_Travels-Status,\_Travels-TotalPrice,\_Travels-TravelId
      INTO TABLE @DATA(customer_travels).

    out->write( customer_travels ).
  ENDMETHOD.
ENDCLASS.
