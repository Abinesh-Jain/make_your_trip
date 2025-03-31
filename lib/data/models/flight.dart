class Flight {
  final int? id;
  final String name;
  final String time;
  final String duration;
  final double price;

  Flight({
    this.id,
    required this.name,
    required this.time,
    required this.duration,
    required this.price,
  });

  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      id: json['id'],
      name: json['name'],
      time: json['time'],
      duration: json['duration'],
      price: json['price'] != null ? double.parse('${json['price']}') : 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'time': time,
      'duration': duration,
      'price': price,
    };
  }
}
