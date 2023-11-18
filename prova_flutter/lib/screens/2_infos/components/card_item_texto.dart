import 'package:flutter/material.dart';

class CardItemTexto extends StatelessWidget {
  const CardItemTexto({
    super.key,
    required this.texto,
  });

  final String texto;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        texto,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      contentPadding: const EdgeInsets.only(left: 16, right: 8),
      trailing: Wrap(
        spacing: 4,
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.border_color,
              color: Colors.black,
              size: 30,
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.cancel,
              color: Colors.red,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
