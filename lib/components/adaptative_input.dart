import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeInput extends StatelessWidget {

  final String label;
  final TextEditingController fieldController;
  final TextInputType keyboardTypeValue;
  final Function(String) submitMethod;

  AdaptativeInput({
    Key? key, 
    required this.label,
    required this.fieldController,
    required this.submitMethod,
    this.keyboardTypeValue = TextInputType.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
    ? Padding(
      padding: const EdgeInsets.only(
        bottom: 10
      ),
      child: CupertinoTextField(
          controller: fieldController,
          onSubmitted: submitMethod,
          keyboardType: keyboardTypeValue,
          placeholder: label,
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 12
          ),
        ),
    )
    : TextField(
        controller: fieldController,
        onSubmitted: submitMethod,
        decoration: InputDecoration(
          labelText: label,
        ),
        keyboardType: keyboardTypeValue
      );
  }
}