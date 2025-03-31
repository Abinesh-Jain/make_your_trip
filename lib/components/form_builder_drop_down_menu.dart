import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormBuilderDropDownMenu<T> extends StatelessWidget {
  const FormBuilderDropDownMenu({
    super.key,
    required this.name,
    this.items = const [],
    this.label,
    this.builder,
    this.leadingIcon,
    this.validator,
  });

  final String name;

  final Iterable<T> items;

  final String? label;

  final String Function(T item)? builder;

  final Widget? leadingIcon;

  final FormFieldValidator<T>? validator;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: name,
      builder: (field) => DropdownMenu(
        width: double.infinity,
        leadingIcon: leadingIcon,
        label: label != null ? Text(label!) : null,
        errorText: field.errorText,
        selectedTrailingIcon: const Icon(Icons.location_on),
        dropdownMenuEntries: [
          ...items.map((item) => DropdownMenuEntry(
                label: builder?.call(item) ?? item.toString(),
                value: item,
              ))
        ],
        requestFocusOnTap: true,
        searchCallback: (entries, query) {
          final index = entries.indexWhere(
            (entry) => entry.label.toLowerCase().contains(query.toLowerCase()),
          );
          return index != -1 ? index : null;
        },
        onSelected: field.didChange,
      ),
      validator: validator,
    );
  }
}
