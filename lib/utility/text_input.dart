import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final String labelText;
  final TextInputType textInputType;

  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    this.hintText = '',
    required this.labelText,
    required this.textInputType,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    final inputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.green,
      ),
    );
    return TextField(
      cursorColor: Colors.green,
      controller: textEditingController,
      obscureText: isPass,
      decoration: InputDecoration(
        fillColor: Colors.red,
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.green,
        ),
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
      ),
      keyboardType: textInputType,
    );
  }
}
