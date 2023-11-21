import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'item_store.g.dart';

// ignore: library_private_types_in_public_api
class ItemStore = _ItemStore with _$ItemStore;

abstract class _ItemStore with Store {
  late SharedPreferences _prefs;
  late List<String> _itemsAsList;

  @observable
  ObservableList<String> items = ObservableList<String>();
  @observable
  int? indexPointer;

  _ItemStore() {
    _readSavedList();
  }

  /// Lendo informações salvas em disk
  void _readSavedList() async {
    _prefs = await SharedPreferences.getInstance();
    _itemsAsList = _prefs.getStringList('itemsList') ?? [];
    for (var itemString in _itemsAsList) {
      items.add(itemString);
    }
  }

  /// Atualiza a lista de persistência a partir da lsita de observáveis
  _updatePersistList() {
    _itemsAsList.clear();
    for (var item in items) {
      _itemsAsList.add(item);
    }
    _prefs.setStringList('itemsList', _itemsAsList);
  }

  @action
  void add(String item) {
    items.add(item);
    _updatePersistList();
  }

  /// Método chamado ao pressionar 'Sim' no AlertDialog de excluir item
  @action
  void removeAtIndex(int index) {
    items.removeAt(index);
    _updatePersistList();
  }

  /// Informa o index que será editado
  ///
  /// Método criado para ser utilizado no Icon de edição
  @action
  void setIndexPointer(int index) => indexPointer = index;

  /// Informa o novo valor do index
  ///
  /// Método criado para ser utilizado no TextInput
  @action
  void setValueOfPointer(String newText) {
    items.insert(indexPointer!, newText);
    items.removeAt(indexPointer! + 1);
    _editNothing();
    _updatePersistList();
  }

  /// Após uma edição bem sucedida, chamar este método
  @action
  void _editNothing() => indexPointer = null;
}
