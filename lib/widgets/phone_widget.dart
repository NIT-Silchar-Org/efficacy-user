import 'package:flutter/material.dart';

class PhoneWidget extends StatefulWidget {
  final TextEditingController controller;
  const PhoneWidget({Key? key, required this.controller}) : super(key: key);
  @override
  _PhoneWidgetState createState() => _PhoneWidgetState();
}

class _PhoneWidgetState extends State<PhoneWidget> {
  String _selectedCountryCode = '+91';
  final List<String> _countryCodes = ['+91', '+23'];

  @override
  Widget build(BuildContext context) {
    var countryDropDown = Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        border: Border(
          right: BorderSide(width: 1, color: Colors.blueGrey),
        ),
      ),
      height: 45.0,
      margin: const EdgeInsets.all(3.0),
      //width: 300.0,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            value: _selectedCountryCode,
            items: _countryCodes.map((String value) {
              return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 12.0),
                  ));
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedCountryCode = value as String;
              });
            },
          ),
        ),
      ),
    );
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: TextFormField(
        controller: widget.controller,
        validator: (value) {
          if (value!.isEmpty) {
            return 'phone number should not be empty';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Color.fromRGBO(43, 158, 179, 0.19),
              width: 0.1,
            ),
          ),
          fillColor: Colors.transparent,
          prefixIcon: countryDropDown,
          labelText: 'Phone Number',
        ),
      ),
    );
  }
}
