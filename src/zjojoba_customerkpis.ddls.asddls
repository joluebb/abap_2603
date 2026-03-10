@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Statistics of Customers'

@Metadata.ignorePropagatedAnnotations: false

define view entity ZJOJOBA_CustomerKPIs with parameters CityID : abap.char(40)
  as select from ZJOJOBA_TravelWithCustomer as t

{

  key t.CustomerId,

      t.CustomerName,
      t.Street,
      t.PostalCode,
      t.City,

      @EndUserText.label: 'Total Revenue'
      @EndUserText.quickInfo: 'Total Revenue'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum(t.TotalPrice + t.BookingFee)                 as TotalRevenue,

      t.CurrencyCode,
      @EndUserText.label: 'Average Duration'
      @EndUserText.quickInfo: 'Average Duration'
      avg(t.Duration as abap.dec(16,2)) as AverageDuration,
      @EndUserText.label: 'Number of different Agencies'
      @EndUserText.quickInfo: 'Number of different Agencies'
      count(distinct t.AgencyId)        as NumberOfDifferentAgencies
}
where t.City = $parameters.CityID
group by t.CustomerId,
         t.CustomerName,
         t.Street,
         t.PostalCode,
         t.CurrencyCode,
         t.City

having sum(t.TotalPrice + t.BookingFee) >= 5000
