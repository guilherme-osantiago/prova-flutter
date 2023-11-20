import 'package:mobx/mobx.dart';
part 'item_store.g.dart';

// ignore: library_private_types_in_public_api
class ItemStore = _ItemStore with _$ItemStore;

abstract class _ItemStore with Store {
  @observable
  ObservableList<String> items = ObservableList<String>();

  @observable
  int? indexPointer;

  @action

  /// Informa o index que será editado
  ///
  /// Método criado para ser utilizado no Icon de edição
  void setIndexPointer(int index) => indexPointer = index;

  /// Após uma edição bem sucedida, chamar este método
  @action
  void _editNothing() => indexPointer = null;

  @action
  void add(String item) => items.add(item);

  /// Método chamado ao pressionar 'Sim' no AlertDialog de excluir item
  @action
  void removeAtIndex(int index) => items.removeAt(index);

  /// Informa o novo valor do index
  ///
  /// Método criado para ser utilizado no TextInput
  @action
  void setValueOfPointer(String newText) {
    items.insert(indexPointer!, newText);
    items.removeAt(indexPointer! + 1);
    _editNothing();
  }
}
