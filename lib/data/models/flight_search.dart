class FlightSearch {
  final String from;
  final String to;
  final String departure;
  final String cLass;
  final int passengers;

  FlightSearch({
    required this.from,
    required this.to,
    required this.departure,
    required this.cLass,
    required this.passengers,
  });

  factory FlightSearch.fromJson(Map<String, dynamic> json) {
    return FlightSearch(
      from: json['from'],
      to: json['to'],
      departure: json['departure'],
      cLass: json['class'],
      passengers: json['passengers'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from,
      'to': to,
      'departure': departure,
      'classType': cLass,
      'passengers': passengers,
    };
  }

  String get header => '$from to $to';

  String get date => departure.substring(0, 10);
}
