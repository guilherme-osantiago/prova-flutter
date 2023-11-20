import 'package:flutter/material.dart';
import 'package:prova_flutter/stores/item_store.dart';

class CardItemTexto extends StatelessWidget {
  final ItemStore itemStore;
  final int index;
  final Function() onEdit, onDelete;

  const CardItemTexto({
    required this.itemStore,
    required this.index,
    required this.onEdit,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isCardForEdited =
        itemStore.indexPointer != null && itemStore.indexPointer == index;

    return ListTile(
      title: Text(
        itemStore.items[index],
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isCardForEdited ? Colors.grey.shade600 : Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      contentPadding: const EdgeInsets.only(left: 16, right: 8),
      trailing: Wrap(
        spacing: 4,
        children: <Widget>[
          // Icon Edit
          InkWell(
            onTap: () => onEdit(),
            child: const Icon(
              Icons.border_color,
              color: Colors.black,
              size: 30,
            ),
          ),
          // Icon Delete
          InkWell(
            onTap: () => onDelete(),
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
