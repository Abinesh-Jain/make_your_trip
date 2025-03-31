import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/flight_booking_provider.dart';

class AvailableFlightsScreen extends StatelessWidget {
  const AvailableFlightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FlightBookingProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text('${value.search?.header}'),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text('${value.search?.date}'),
            ),
          ],
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(5),
          itemCount: value.flights.length,
          itemBuilder: (context, index) {
            final flight = value.flights[index];
            return ListTile(
              onTap: () => value.onFlightSelected(context, flight),
              title: Text(flight.name),
              subtitle: Text('${flight.time} - ${flight.duration}'),
              trailing: Text('${flight.price} INR'),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}
