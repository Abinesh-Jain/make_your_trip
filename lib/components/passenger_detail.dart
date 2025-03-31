import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../utils/form_keys.dart';
import '../utils/strings.dart';

class PassengerDetail extends StatelessWidget {
  const PassengerDetail({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration:
          InputDecoration(labelText: '${Strings.passenger} ${index + 1}'),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: FormBuilderTextField(
                  name: FormKeys.name,
                  decoration: const InputDecoration(labelText: Strings.name),
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FormBuilderTextField(
                  name: FormKeys.age,
                  decoration: const InputDecoration(labelText: Strings.age),
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                    FormBuilderValidators.min(1),
                    FormBuilderValidators.max(100),
                  ]),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: FormKeys.email,
                  decoration: const InputDecoration(labelText: Strings.email),
                  keyboardType: TextInputType.emailAddress,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FormBuilderTextField(
                  name: FormKeys.phone,
                  decoration: const InputDecoration(labelText: Strings.phone),
                  keyboardType: TextInputType.phone,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.phoneNumber(),
                  ]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
