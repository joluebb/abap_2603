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
      dats_days_between(t.BeginDate, t.EndDate) + 1                                    as Duration,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(amount             => t.BookingFee,
                          source_currency    => t.CurrencyCode,
                          target_currency    => cast('EUR' as /dmo/currency_code),
                          exchange_rate_date => $session.system_date,
                          error_handling     => 'KEEP_UNCONVERTED')                as BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(amount             => t.TotalPrice,
                          source_currency    => t.CurrencyCode,
                          target_currency    => cast('EUR' as /dmo/currency_code),
                          exchange_rate_date => $session.system_date,
                          error_handling     => 'KEEP_UNCONVERTED')                as TotalPrice,

      cast('EUR' as /dmo/currency_code)                                            as CurrencyCode,
      t.Description,
      t.Status,
      case t.Status when 'N' then 'Normal'
                    when 'P' then 'Pending'
                    when 'B' then 'Boarding'
                    else 'Error'
      end as StatusText,
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
