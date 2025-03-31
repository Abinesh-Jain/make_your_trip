import '../screens/available_flights_screen.dart';
import '../screens/book_flight_screen.dart';
import '../screens/book_hotel_screen.dart';
import '../screens/flight_booking_details_screen.dart';
import '../screens/home_screen.dart';
import '../screens/offers_screen.dart';
import 'app_routes.dart';

class AppScreens {
  static final routes = {
    AppRoutes.home: (context) => const HomeScreen(),
    AppRoutes.bookFlight: (context) => const BookFlightScreen(),
    AppRoutes.availableFlights: (context) => const AvailableFlightsScreen(),
    AppRoutes.flightBookingDetails: (context) =>
        const FlightBookingDetailsScreen(),
    AppRoutes.offers: (context) => const OffersScreen(),
    AppRoutes.bookHotel: (context) => const BookHotelScreen(),
  };
}
