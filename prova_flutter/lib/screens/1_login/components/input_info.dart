import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputInfo extends StatelessWidget {
  final String titulo;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final IconData icon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;

  const InputInfo({
    required this.titulo,
    required this.controller,
    required this.validator,
    required this.icon,
    this.inputFormatters,
    this.textInputAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 4),
          child: Text(
            titulo,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            // child: textFormField,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                icon: Icon(icon, color: Colors.black),
                border: InputBorder.none,
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
              validator: validator,
              inputFormatters: inputFormatters,
              textInputAction: textInputAction ?? TextInputAction.done,
            ),
          ),
        ),
      ],
    );
  }
}
