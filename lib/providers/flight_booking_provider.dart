import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../core/app_routes.dart';
import '../data/models/flight.dart';
import '../data/models/flight_search.dart';
import '../data/repositories/flight_booking_repository.dart';
import '../features/payment/stripe_payment.dart';
import '../screens/book_flight_screen.dart';
import '../screens/flight_booking_details_screen.dart';
import '../utils/strings.dart';

class FlightBookingProvider extends ChangeNotifier {
  final _flightBookingRepository = FlightBookingRepository();
  final _stripePayment = StripePayment();

  FlightSearch? search;

  Flight? selectedFlight;

  List<Flight> flights = [];

  void searchFlights(BuildContext context) {
    final currentState = BookFlightScreen.searchFlightForm.currentState;
    final valid = currentState?.saveAndValidate() ?? false;
    if (valid) {
      final value = currentState?.value;
      search = FlightSearch.fromJson(value!);
      if (search?.from == search?.to) {
        Fluttertoast.showToast(
          msg: Strings.pleaseSelectDifferentDepartureAndArrivalAirports,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return;
      }
      flights.clear();
      flights = _flightBookingRepository.searchFlights(search!);
      Navigator.pushNamed(
        context,
        AppRoutes.availableFlights,
        arguments: search,
      );
    }
  }

  void onFlightSelected(BuildContext context, Flight flight) {
    selectedFlight = flight;
    Navigator.pushNamed(
      context,
      AppRoutes.flightBookingDetails,
      arguments: flight,
    );
  }

  void onBookNowPressed(BuildContext context) async {
    final currentState =
        FlightBookingDetailsScreen.flightBookingDetailsForm.currentState;
    final valid = currentState?.saveAndValidate() ?? false;
    if (!valid) return;
    final amount = (selectedFlight?.price ?? 0).toInt().toString();
    final status = await _stripePayment.makePayment(amount, 'INR');
    if (!context.mounted) return;
    switch (status) {
      case 'success':
        showAdaptiveDialog(
          context: context,
          builder: (context) => AlertDialog.adaptive(
            icon: const Icon(
              Icons.done,
              color: Colors.green,
              size: 50,
            ),
            title: const Text(Strings.paymentSuccessful),
            content: const Text(Strings.yourTicketIsBooked),
            actions: [
              TextButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.home,
                  (route) => false,
                ),
                child: const Text(Strings.ok),
              ),
            ],
          ),
        );
        break;
      case 'canceled':
        showAdaptiveDialog(
          context: context,
          builder: (context) => AlertDialog.adaptive(
            icon: const Icon(
              Icons.cancel,
              color: Colors.red,
              size: 50,
            ),
            title: const Text(Strings.paymentCanceled),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(Strings.ok),
              ),
            ],
          ),
        );
        break;
      case 'failed':
        showAdaptiveDialog(
          context: context,
          builder: (context) => AlertDialog.adaptive(
            icon: const Icon(
              Icons.error,
              color: Colors.red,
              size: 50,
            ),
            title: const Text(Strings.paymentFailed),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(Strings.ok),
              ),
            ],
          ),
        );
        break;
      default:
    }
  }
}
