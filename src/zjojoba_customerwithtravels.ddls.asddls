@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'customers wit corresponding travel info'

@Metadata.ignorePropagatedAnnotations: false

define view entity ZJOJOBA_CustomerWithTravels
  as select from ZJOJOBA_Customer

  association [1..*] to ZJOJOBA_Travel as _Travels on $projection.CustomerId = _Travels.CustomerId

{
  key CustomerId,

      FirstName,
      LastName,
      Title,
      Street,
      PostalCode,
      City,

      _Travels
}
where CountryCode = 'DE'
