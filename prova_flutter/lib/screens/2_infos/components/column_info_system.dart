import 'package:flutter/material.dart';
import 'package:prova_flutter/screens/2_infos/components/card_item_texto.dart';
import 'package:prova_flutter/screens/2_infos/components/input_texto.dart';
import 'package:prova_flutter/stores/item_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ColumnInfoSistemas extends StatelessWidget {
  const ColumnInfoSistemas({
    super.key,
    required this.itemStore,
    required this.myFocusNode,
    required this.controller,
  });

  final ItemStore itemStore;
  final FocusNode myFocusNode;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 300,
          width: double.maxFinite,
          child: Card(
            child: Observer(
              builder: (context) {
                if (itemStore.items.isNotEmpty) {
                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        buildCardItemTexto(itemStore, index, context),
                    separatorBuilder: (context, index) =>
                        const Divider(height: 1, color: Colors.black),
                    itemCount: itemStore.items.length,
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.format_list_numbered,
                          size: 80, color: Colors.grey.shade600),
                      const SizedBox(height: 12),
                      Text(
                        "Lista vazia!",
                        style: TextStyle(
                            fontSize: 32, color: Colors.grey.shade600),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Você ainda não salvou nenhum item",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
        const SizedBox(height: 24),
        InputTexto(
          myFocusNode: myFocusNode,
          itemStore: itemStore,
          controller: controller,
        ),
      ],
    );
  }

  buildCardItemTexto(ItemStore itemStore, int index, BuildContext context) =>
      CardItemTexto(
        itemStore: itemStore,
        index: index,
        onEdit: () {
          // Impede uma Edição caso esteja acontecendo uma ação de Edição
          if (itemStore.indexPointer == null) {
            controller.text = itemStore.items[index];
            itemStore.items[index] = "[ ${controller.text} ]";
            itemStore.setIndexPointer(index);
          } else {
            String msg = "Você já está editando um item";
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(msg),
              duration: const Duration(seconds: 2),
            ));
          }
        },
        onDelete: () {
          // Impede uma Exclusão caso esteja acontecendo uma ação de Edição
          if (itemStore.indexPointer == null) {
            showDialog(
              context: context,
              builder: (context) =>
                  buildExcluirDialog(itemStore, index, context),
            );
          } else {
            String msg = "Finalize a edição atual para poder excluir itens";
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(msg),
              duration: const Duration(seconds: 3),
            ));
          }
        },
      );

  buildExcluirDialog(ItemStore itemStore, int index, BuildContext context) =>
      AlertDialog(
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              itemStore.removeAtIndex(index);
              Navigator.pop(context);
            },
            child: const Text("Excluir"),
          ),
        ],
        elevation: 24,
        title: const Text('Excluir'),
        content: const Text('Tem certeza que deseja excluir este item?'),
      );
}
