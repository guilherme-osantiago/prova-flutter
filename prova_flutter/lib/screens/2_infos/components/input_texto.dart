import 'package:flutter/material.dart';
import 'package:prova_flutter/stores/item_store.dart';

class InputTexto extends StatelessWidget {
  final FocusNode myFocusNode;
  final ItemStore itemStore;
  final TextEditingController controller;

  const InputTexto({
    required this.myFocusNode,
    required this.itemStore,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Card(
      child: Form(
        key: formKey,
        child: TextFormField(
          key: UniqueKey(),
          controller: controller,
          decoration: const InputDecoration(
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.5),
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
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Preencha este campo';
            }
            return null;
          },
          onFieldSubmitted: (value) {
            if (formKey.currentState!.validate()) {
              if (itemStore.editThisIndex == null) {
                itemStore.add(value);
                controller.clear();
              } else {
                itemStore.editTo(value);
                controller.clear();
              }
            }
            myFocusNode.requestFocus();
          },
          focusNode: myFocusNode,
          maxLines: 1,
        ),
      ),
    );
  }
}
