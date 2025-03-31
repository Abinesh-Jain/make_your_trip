class FlightBookingService {
  List<Map<String, dynamic>> searchFlights({
    required String from,
    required String to,
    required String departure,
    required String cLass,
    required int passengers,
  }) {
    return [
      {
        'name': 'IndiGo',
        'time': '10:00 AM',
        'duration': '2h 30m',
        'price': 4500 * passengers,
      },
      {
        'name': 'Air India',
        'time': '1:00 PM',
        'duration': '3h 10m',
        'price': 6200 * passengers,
      },
      {
        'name': 'SpiceJet',
        'time': '4:30 PM',
        'duration': '2h 45m',
        'price': 5100 * passengers,
      }
    ];
  }
}
