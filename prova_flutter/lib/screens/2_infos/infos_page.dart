import 'package:flutter/material.dart';
import 'package:prova_flutter/pages/layout_page.dart';
import 'package:prova_flutter/screens/2_infos/components/card_item_texto.dart';
import 'package:prova_flutter/screens/2_infos/components/input_texto.dart';

class InfosPage extends StatelessWidget {
  const InfosPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    FocusNode myFocusNode = FocusNode();
    myFocusNode.requestFocus();

    List<String> listTexto = [
      "Abacate",
      "Beterraba",
      "Couve flor",
      "Danoninho",
      // "Ervilha",
      // "Faca",
      // 'Garfo',
      // "Humus",
      // 'Iguana'
    ];

    return LayoutPage(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                child: Card(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        CardItemTexto(texto: listTexto[index]),
                    separatorBuilder: (context, index) =>
                        const Divider(height: 1, color: Colors.black),
                    itemCount: listTexto.length,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              InputTexto(myFocusNode: myFocusNode),
            ],
          ),
        ),
      ),
    );
  }
}
