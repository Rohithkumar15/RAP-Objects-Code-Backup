@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Virtual Element'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CDS_VIRTUAL_ELEMENT
  as select from /DMO/C_Flight_R
{
  key AirlineID,
  key ConnectionID,
  key FlightDate,
      AirlineName,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      PlaneType,
      MaximumSeats,
      OccupiedSeats,
      OccupiedSeatsForChart,
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VIRTUAL_ELEMENT_CALC'
      @EndUserText.label: 'Available Seats'
      cast( 0 as abap.int4 )     as SeatsAvailable,
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VIRTUAL_ELEMENT_CALC'
      @EndUserText.label: 'Week Day'
      cast( '' as abap.char(9) ) as dayOfTheFlight
}
