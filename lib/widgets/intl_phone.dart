import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class IntlPhone extends StatefulWidget {
  final void Function(PhoneNumber) onInputChanged;
  const IntlPhone({Key? key, required this.onInputChanged}) : super(key: key);

  @override
  State<IntlPhone> createState() => _IntlPhoneState();
}

class _IntlPhoneState extends State<IntlPhone> {
  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
        autoValidateMode: AutovalidateMode.onUserInteraction,
        initialValue: PhoneNumber(dialCode: '+91', isoCode: 'IN'),
        inputBorder: const OutlineInputBorder(),
        onInputChanged: widget.onInputChanged);
  }
}
