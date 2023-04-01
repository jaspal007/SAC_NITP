import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class MyDropDown extends StatefulWidget {
  final List items;
  final String hint;
  final IconData icon;
  const MyDropDown({
    super.key,
    required this.items,
    required this.hint,
    required this.icon,
  });

  @override
  State<MyDropDown> createState() => MyDropDownState();
}

class MyDropDownState extends State<MyDropDown> {
  get items => List;
  get icon => IconData;
  get hint => String;

  @override
  Widget build(BuildContext context) {
    String? dropDownValue;
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        dropdownMaxHeight: 150,
        icon: Icon(
          icon,
        ),
        iconEnabledColor: Colors.teal,
        underline: Container(
          height: 2,
          color: Colors.teal,
        ),
        hint: Text(
          hint,
        ),
        items: items
            .map(
              (item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                ),
              ),
            )
            .toList(),
        value: dropDownValue,
        onChanged: (value) {
          setState(() {
            dropDownValue = value as String;
          });
        },
      ),
    );
  }
}
