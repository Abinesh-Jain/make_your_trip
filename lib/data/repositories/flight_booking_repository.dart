import '../models/flight.dart';
import '../models/flight_search.dart';
import '../services/flight_booking_service.dart';

class FlightBookingRepository {
  final FlightBookingService _flightBookingService = FlightBookingService();
  List<Flight> searchFlights(FlightSearch flightSearch) {
    return _flightBookingService
        .searchFlights(
          from: flightSearch.from,
          to: flightSearch.to,
          departure: flightSearch.departure,
          cLass: flightSearch.cLass,
          passengers: flightSearch.passengers,
        )
        .map((e) => Flight.fromJson(e))
        .toList();
  }
}
