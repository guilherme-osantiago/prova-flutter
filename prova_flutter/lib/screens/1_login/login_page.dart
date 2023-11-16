import 'package:flutter/material.dart';
import 'package:prova_flutter/pages/layout_page.dart';
import 'package:prova_flutter/screens/1_login/components/btn_entrar.dart';
import 'package:prova_flutter/screens/1_login/components/input_info.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutPage(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputInfo(
              titulo: "Usuário",
              textFormField: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person, color: Colors.black),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            InputInfo(
              titulo: "Senha",
              textFormField: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.lock, color: Colors.black),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const BtnEntrar(),
          ],
        ),
      ),
    );
  }
}
