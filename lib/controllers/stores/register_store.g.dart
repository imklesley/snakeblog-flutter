// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterStore on RegisterStoreBase, Store {
  Computed<bool>? _$isPasswordsIdenticalComputed;

  @override
  bool get isPasswordsIdentical => (_$isPasswordsIdenticalComputed ??=
          Computed<bool>(() => super.isPasswordsIdentical,
              name: 'RegisterStoreBase.isPasswordsIdentical'))
      .value;

  final _$isLoadingAtom = Atom(name: 'RegisterStoreBase.isLoading');

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

  final _$formKeyAtom = Atom(name: 'RegisterStoreBase.formKey');

  @override
  GlobalKey<FormState> get formKey {
    _$formKeyAtom.reportRead();
    return super.formKey;
  }

  @override
  set formKey(GlobalKey<FormState> value) {
    _$formKeyAtom.reportWrite(value, super.formKey, () {
      super.formKey = value;
    });
  }

  final _$firstNameControllerAtom =
      Atom(name: 'RegisterStoreBase.firstNameController');

  @override
  TextEditingController get firstNameController {
    _$firstNameControllerAtom.reportRead();
    return super.firstNameController;
  }

  @override
  set firstNameController(TextEditingController value) {
    _$firstNameControllerAtom.reportWrite(value, super.firstNameController, () {
      super.firstNameController = value;
    });
  }

  final _$emailControllerAtom = Atom(name: 'RegisterStoreBase.emailController');

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  final _$cpfControllerAtom = Atom(name: 'RegisterStoreBase.cpfController');

  @override
  TextEditingController get cpfController {
    _$cpfControllerAtom.reportRead();
    return super.cpfController;
  }

  @override
  set cpfController(TextEditingController value) {
    _$cpfControllerAtom.reportWrite(value, super.cpfController, () {
      super.cpfController = value;
    });
  }

  final _$usernameControllerAtom =
      Atom(name: 'RegisterStoreBase.usernameController');

  @override
  TextEditingController get usernameController {
    _$usernameControllerAtom.reportRead();
    return super.usernameController;
  }

  @override
  set usernameController(TextEditingController value) {
    _$usernameControllerAtom.reportWrite(value, super.usernameController, () {
      super.usernameController = value;
    });
  }

  final _$passwordController1Atom =
      Atom(name: 'RegisterStoreBase.passwordController1');

  @override
  TextEditingController get passwordController1 {
    _$passwordController1Atom.reportRead();
    return super.passwordController1;
  }

  @override
  set passwordController1(TextEditingController value) {
    _$passwordController1Atom.reportWrite(value, super.passwordController1, () {
      super.passwordController1 = value;
    });
  }

  final _$passwordController2Atom =
      Atom(name: 'RegisterStoreBase.passwordController2');

  @override
  TextEditingController get passwordController2 {
    _$passwordController2Atom.reportRead();
    return super.passwordController2;
  }

  @override
  set passwordController2(TextEditingController value) {
    _$passwordController2Atom.reportWrite(value, super.passwordController2, () {
      super.passwordController2 = value;
    });
  }

  final _$registerAsyncAction = AsyncAction('RegisterStoreBase.register');

  @override
  Future<UserModel?> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
formKey: ${formKey},
firstNameController: ${firstNameController},
emailController: ${emailController},
cpfController: ${cpfController},
usernameController: ${usernameController},
passwordController1: ${passwordController1},
passwordController2: ${passwordController2},
isPasswordsIdentical: ${isPasswordsIdentical}
    ''';
  }
}
