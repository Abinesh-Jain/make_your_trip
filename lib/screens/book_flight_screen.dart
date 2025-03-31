import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import '../components/form_builder_drop_down_menu.dart';
import '../core/app_colors.dart';
import '../providers/flight_booking_provider.dart';
import '../utils/constants.dart';
import '../utils/form_keys.dart';
import '../utils/strings.dart';
import '../utils/textstyles.dart';

class BookFlightScreen extends StatelessWidget {
  const BookFlightScreen({super.key});

  static final searchFlightForm = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.flightSearch,
          style: Textstyles.f18w600,
        ),
        backgroundColor: AppColors.primary,
      ),
      body: FormBuilder(
        key: searchFlightForm,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            FormBuilderDropDownMenu(
              name: FormKeys.from,
              items: Constants.airports,
              label: Strings.from,
              leadingIcon: const Icon(Icons.flight_takeoff),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            const SizedBox(height: 12),
            FormBuilderDropDownMenu(
              name: FormKeys.to,
              items: Constants.airports,
              label: Strings.to,
              leadingIcon: const Icon(Icons.flight_land),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            const SizedBox(height: 12),
            FormBuilderDateTimePicker(
              name: FormKeys.departure,
              decoration: const InputDecoration(
                labelText: Strings.departure,
                prefixIcon: Icon(Icons.today),
              ),
              valueTransformer: (value) => value?.toIso8601String(),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            const SizedBox(height: 12),
            FormBuilderChoiceChip(
              name: FormKeys.flightClass,
              options: [
                ...Constants.flightClasses.map(
                  (flightClass) => FormBuilderChipOption(value: flightClass),
                )
              ],
              spacing: 5,
              decoration: const InputDecoration(
                labelText: Strings.flightClass,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            const SizedBox(height: 12),
            FormBuilderTextField(
              name: FormKeys.passengers,
              initialValue: '1',
              maxLength: 1,
              decoration: const InputDecoration(
                labelText: Strings.passengers,
                counterText: '',
                prefixIcon: Icon(Icons.person),
              ),
              keyboardType: TextInputType.number,
              valueTransformer: (value) => int.tryParse(value ?? ''),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.numeric(),
                FormBuilderValidators.min(1),
              ]),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context
                          .read<FlightBookingProvider>()
                          .searchFlights(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                    child: const Text(
                      Strings.searchFlights,
                      style: Textstyles.f16w600white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
