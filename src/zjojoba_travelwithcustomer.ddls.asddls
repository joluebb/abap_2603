@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel and Customer information'

@Metadata.ignorePropagatedAnnotations: false

define view entity ZJOJOBA_TravelWithCustomer
  as select from ZJOJOBA_Travel   as t

    inner join   ZJOJOBA_Customer as c on t.CustomerId = c.CustomerId

{
  key t.TravelId,

      c.FirstName,
      c.LastName,
      c.Title,
      c.Street,
      c.PostalCode,
      c.City,
      t.AgencyId,
      t.CustomerId,
      t.BeginDate,
      t.EndDate,
      t.BookingFee,
      t.TotalPrice,
      t.CurrencyCode,
      t.Description,
      t.Status
}
where c.CountryCode = 'DE'
