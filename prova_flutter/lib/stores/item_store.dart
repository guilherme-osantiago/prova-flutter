import 'package:mobx/mobx.dart';
part 'item_store.g.dart';

// ignore: library_private_types_in_public_api
class ItemStore = _ItemStore with _$ItemStore;

abstract class _ItemStore with Store {
  @observable
  ObservableList<String> items = ObservableList<String>();

  @observable
  int? editThisIndex;

  @action

  /// Informa o index que será editado
  ///
  /// Método criado para ser utilizado no Icon de edição
  void editThis(int index) => editThisIndex = index;

  /// Após uma edição bem sucedida, chamar este método
  @action
  void _editNothing() => editThisIndex = null;

  @action
  void add(String item) => items.add(item);

  @action
  void removeAt(int index) => items.removeAt(index);

  /// Informa o novo valor do index
  ///
  /// Método criado para ser utilizado no TextInput
  @action
  void editTo(String newText) {
    items.insert(editThisIndex!, newText);
    items.removeAt(editThisIndex! + 1);
    _editNothing();
  }
}
