@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Statistics of Customers'

@Metadata.ignorePropagatedAnnotations: false

define view entity ZJOJOBA_CustomerKPIs
  as select from ZJOJOBA_TravelWithCustomer as t

{
  key t.CustomerId,

      t.CustomerName,
      t.Street,
      t.PostalCode,
      t.City,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum(t.TotalPrice)                 as TotalRevenue,

      t.CurrencyCode,
      avg(t.Duration as abap.dec(16,2)) as AverageDuration,
      count(distinct t.AgencyId)        as NumberOfDifferentAgencies
}

group by t.CustomerId,
         t.CustomerName,
         t.Street,
         t.PostalCode,
         t.CurrencyCode,
         t.City

having sum(t.TotalPrice) >= 5000
