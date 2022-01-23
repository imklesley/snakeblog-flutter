// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_menu_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WebMenuStore on WebMenuStoreBase, Store {
  final _$selectedIndexAtom = Atom(name: 'WebMenuStoreBase.selectedIndex');

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  final _$menuItemsAtom = Atom(name: 'WebMenuStoreBase.menuItems');

  @override
  List<String> get menuItems {
    _$menuItemsAtom.reportRead();
    return super.menuItems;
  }

  @override
  set menuItems(List<String> value) {
    _$menuItemsAtom.reportWrite(value, super.menuItems, () {
      super.menuItems = value;
    });
  }

  final _$WebMenuStoreBaseActionController =
      ActionController(name: 'WebMenuStoreBase');

  @override
  void updateIndex(int newIndex) {
    final _$actionInfo = _$WebMenuStoreBaseActionController.startAction(
        name: 'WebMenuStoreBase.updateIndex');
    try {
      return super.updateIndex(newIndex);
    } finally {
      _$WebMenuStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex},
menuItems: ${menuItems}
    ''';
  }
}
