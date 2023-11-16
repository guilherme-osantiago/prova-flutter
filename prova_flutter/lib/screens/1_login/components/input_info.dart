import 'package:flutter/material.dart';

class InputInfo extends StatelessWidget {
  final String titulo;
  final TextFormField textFormField;

  const InputInfo({
    required this.titulo,
    required this.textFormField,
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
            child: textFormField,
          ),
        ),
      ],
    );
  }
}
