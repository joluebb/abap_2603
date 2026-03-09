@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel and Customer information'

@Metadata.ignorePropagatedAnnotations: false

define view entity ZJOJOBA_TravelWithCustomer
  as select from ZJOJOBA_Travel   as t

    inner join   ZJOJOBA_Customer as c on t.CustomerId = c.CustomerId

{
  key t.TravelId,

      t.AgencyId,
      t.BeginDate,
      t.EndDate,

      @EndUserText.label: 'Duration'
      @EndUserText.quickInfo: 'Duration of the travel'
      cast(t.EndDate as abap.int4(10)) - cast(t.BeginDate as abap.int4(10))        as Duration,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      t.BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      t.TotalPrice,

      cast('EUR' as /dmo/currency_code)                                            as CurrencyCode,
      t.Description,
      t.Status,
      c.CustomerId,

      @EndUserText.label: 'Customer Name'
      @EndUserText.quickInfo: 'Customer Name'
      concat_with_space(concat_with_space(c.Title, c.FirstName, 1), c.LastName, 1) as CustomerName,

      // c.FirstName,
      // c.LastName,
      // c.Title,
      c.Street,
      c.PostalCode,
      c.City
}

where c.CountryCode = 'DE'
