import 'package:flutter/material.dart';
import 'package:prova_flutter/pages/layout_page.dart';
import 'package:prova_flutter/screens/2_infos/components/column_info_system.dart';
import 'package:prova_flutter/stores/item_store.dart';

class InfosPage extends StatelessWidget {
  const InfosPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final itemStore = ItemStore();
    var controller = TextEditingController();

    FocusNode myFocusNode = FocusNode();
    myFocusNode.requestFocus();

    return LayoutPage(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ColumnInfoSistemas(
          itemStore: itemStore,
          myFocusNode: myFocusNode,
          controller: controller,
        ),
      ),
    );
  }
}
