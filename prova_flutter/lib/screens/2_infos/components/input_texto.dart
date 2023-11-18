import 'package:flutter/material.dart';

class InputTexto extends StatelessWidget {
  const InputTexto({
    super.key,
    required this.myFocusNode,
  });

  final FocusNode myFocusNode;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          hintText: 'Digite seu texto',
          hintStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        onTapOutside: (event) => myFocusNode.requestFocus(),
        onEditingComplete: () => myFocusNode.requestFocus(),
        onFieldSubmitted: (value) {
          myFocusNode.requestFocus();
          debugPrint(value);
        },
        focusNode: myFocusNode,
        maxLines: 1,
      ),
    );
  }
}
