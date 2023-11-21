import 'package:flutter/material.dart';
import 'package:prova_flutter/api/user_api.dart';
import 'package:prova_flutter/screens/2_infos/infos_page.dart';

Future<void> loading(
    TextEditingController usuarioControl,
    TextEditingController senhaControl,
    GlobalKey<FormState> formKey,
    BuildContext context) async {
  usuarioControl.text = usuarioControl.text.trim();
  senhaControl.text = senhaControl.text.trim();

  if (formKey.currentState!.validate()) {
    FocusManager.instance.primaryFocus?.unfocus();
    await login(
      usuarioControl.text,
      senhaControl.text,
    ).then((response) {
      switch (response) {
        case 0:
          String msg = "Usuário ou senha incorretos";
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(msg)));
          break;
        case 1:
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const InfosPage(),
              ));
          break;
        default:
          String msg = "Request fracassou com o status $response";
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(msg)));
      }
      return null;
    });
  }
}
