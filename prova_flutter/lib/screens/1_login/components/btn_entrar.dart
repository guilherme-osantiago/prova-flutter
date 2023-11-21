import 'package:flutter/material.dart';
import 'package:prova_flutter/screens/1_login/components/funct_loading.dart';

class BtnEntrar extends StatelessWidget {
  const BtnEntrar({
    super.key,
    required this.usuarioControl,
    required this.senhaControl,
    required this.formKey,
  });

  final TextEditingController usuarioControl;
  final TextEditingController senhaControl;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () async {
          await loading(usuarioControl, senhaControl, formKey, context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff44BD6E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 32,
          ),
          child: Text(
            'Entrar',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
