import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../components/passenger_detail.dart';
import '../core/app_colors.dart';
import '../providers/flight_booking_provider.dart';
import '../utils/strings.dart';

class FlightBookingDetailsScreen extends StatelessWidget {
  const FlightBookingDetailsScreen({super.key});

  static final flightBookingDetailsForm = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<FlightBookingProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(title: const Text(Strings.flightBookingDetails)),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(5),
                children: [
                  ListTile(
                    title: Text('${value.search?.header}'),
                    subtitle: Text(
                        '${value.selectedFlight?.name} - ${value.search?.date} - ${value.selectedFlight?.time}'),
                  ),
                  FormBuilder(
                    key: flightBookingDetailsForm,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: value.search?.passengers ?? 0,
                      itemBuilder: (_, index) => PassengerDetail(index: index),
                      separatorBuilder: (_, index) =>
                          const SizedBox(height: 10),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: () => value.onBookNowPressed(context),
              title: Text(
                  '${Strings.totalPrice} ${value.selectedFlight?.price} INR'),
              subtitle: const Text(Strings.bookNow),
              trailing: const Icon(Icons.arrow_forward),
              tileColor: AppColors.primary,
              textColor: Colors.white,
              iconColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
