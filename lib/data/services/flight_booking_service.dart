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
      },
      {
        'name': 'Vistara',
        'time': '6:00 AM',
        'duration': '3h 00m',
        'price': 5800 * passengers,
      },
      {
        'name': 'GoAir',
        'time': '9:45 AM',
        'duration': '2h 20m',
        'price': 4700 * passengers,
      },
      {
        'name': 'AirAsia',
        'time': '12:30 PM',
        'duration': '3h 15m',
        'price': 5500 * passengers,
      },
      {
        'name': 'Emirates',
        'time': '3:00 PM',
        'duration': '4h 10m',
        'price': 12000 * passengers,
      },
      {
        'name': 'Qatar Airways',
        'time': '5:45 PM',
        'duration': '4h 00m',
        'price': 11500 * passengers,
      },
      {
        'name': 'Singapore Airlines',
        'time': '8:00 PM',
        'duration': '3h 50m',
        'price': 11000 * passengers,
      },
      {
        'name': 'Etihad Airways',
        'time': '11:00 PM',
        'duration': '3h 30m',
        'price': 10800 * passengers,
      },
    ];
  }
}
