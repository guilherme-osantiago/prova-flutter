// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemStore on _ItemStore, Store {
  late final _$itemsAtom = Atom(name: '_ItemStore.items', context: context);

  @override
  ObservableList<String> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<String> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$editThisIndexAtom =
      Atom(name: '_ItemStore.editThisIndex', context: context);

  @override
  int? get indexPointer {
    _$editThisIndexAtom.reportRead();
    return super.indexPointer;
  }

  @override
  set indexPointer(int? value) {
    _$editThisIndexAtom.reportWrite(value, super.indexPointer, () {
      super.indexPointer = value;
    });
  }

  late final _$_ItemStoreActionController =
      ActionController(name: '_ItemStore', context: context);

  @override
  void setIndexPointer(int index) {
    final _$actionInfo =
        _$_ItemStoreActionController.startAction(name: '_ItemStore.editThis');
    try {
      return super.setIndexPointer(index);
    } finally {
      _$_ItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _editNothing() {
    final _$actionInfo = _$_ItemStoreActionController.startAction(
        name: '_ItemStore.editNothing');
    try {
      return super._editNothing();
    } finally {
      _$_ItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add(String item) {
    final _$actionInfo =
        _$_ItemStoreActionController.startAction(name: '_ItemStore.add');
    try {
      return super.add(item);
    } finally {
      _$_ItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeAtIndex(int index) {
    final _$actionInfo =
        _$_ItemStoreActionController.startAction(name: '_ItemStore.removeAt');
    try {
      return super.removeAtIndex(index);
    } finally {
      _$_ItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValueOfPointer(String newText) {
    final _$actionInfo =
        _$_ItemStoreActionController.startAction(name: '_ItemStore.editAt');
    try {
      return super.setValueOfPointer(newText);
    } finally {
      _$_ItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
editThisIndex: ${indexPointer}
    ''';
  }
}
