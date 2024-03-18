import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.hintStyle,
    this.hintText,
    this.labelText,
    this.textInputAction,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? hintStyle;
  final String? labelText;
  final TextInputAction? textInputAction;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
        labelText: labelText,
      ),
      textInputAction: TextInputAction.next,
    );
  }
}
