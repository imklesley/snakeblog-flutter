// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreatePostStore on CreatePostStoreBase, Store {
  final _$fileAtom = Atom(name: 'CreatePostStoreBase.file');

  @override
  File? get file {
    _$fileAtom.reportRead();
    return super.file;
  }

  @override
  set file(File? value) {
    _$fileAtom.reportWrite(value, super.file, () {
      super.file = value;
    });
  }

  final _$titleControllerAtom =
      Atom(name: 'CreatePostStoreBase.titleController');

  @override
  TextEditingController get titleController {
    _$titleControllerAtom.reportRead();
    return super.titleController;
  }

  @override
  set titleController(TextEditingController value) {
    _$titleControllerAtom.reportWrite(value, super.titleController, () {
      super.titleController = value;
    });
  }

  final _$bodyControllerAtom = Atom(name: 'CreatePostStoreBase.bodyController');

  @override
  TextEditingController get bodyController {
    _$bodyControllerAtom.reportRead();
    return super.bodyController;
  }

  @override
  set bodyController(TextEditingController value) {
    _$bodyControllerAtom.reportWrite(value, super.bodyController, () {
      super.bodyController = value;
    });
  }

  final _$tagControllerAtom = Atom(name: 'CreatePostStoreBase.tagController');

  @override
  TextEditingController get tagController {
    _$tagControllerAtom.reportRead();
    return super.tagController;
  }

  @override
  set tagController(TextEditingController value) {
    _$tagControllerAtom.reportWrite(value, super.tagController, () {
      super.tagController = value;
    });
  }

  final _$isHoverAtom = Atom(name: 'CreatePostStoreBase.isHover');

  @override
  bool get isHover {
    _$isHoverAtom.reportRead();
    return super.isHover;
  }

  @override
  set isHover(bool value) {
    _$isHoverAtom.reportWrite(value, super.isHover, () {
      super.isHover = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'CreatePostStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$CreatePostStoreBaseActionController =
      ActionController(name: 'CreatePostStoreBase');

  @override
  void setFile(File newFile) {
    final _$actionInfo = _$CreatePostStoreBaseActionController.startAction(
        name: 'CreatePostStoreBase.setFile');
    try {
      return super.setFile(newFile);
    } finally {
      _$CreatePostStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
file: ${file},
titleController: ${titleController},
bodyController: ${bodyController},
tagController: ${tagController},
isHover: ${isHover},
isLoading: ${isLoading}
    ''';
  }
}
