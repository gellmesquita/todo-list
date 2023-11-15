// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _LoginControllerBase, Store {
  late final _$usernameAtom =
      Atom(name: '_LoginControllerBase.username', context: context);

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_LoginControllerBase.isLoading', context: context);

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

  late final _$visiblePasswordAtom =
      Atom(name: '_LoginControllerBase.visiblePassword', context: context);

  @override
  bool get visiblePassword {
    _$visiblePasswordAtom.reportRead();
    return super.visiblePassword;
  }

  @override
  set visiblePassword(bool value) {
    _$visiblePasswordAtom.reportWrite(value, super.visiblePassword, () {
      super.visiblePassword = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_LoginControllerBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$erroAuthAtom =
      Atom(name: '_LoginControllerBase.erroAuth', context: context);

  @override
  String get erroAuth {
    _$erroAuthAtom.reportRead();
    return super.erroAuth;
  }

  @override
  set erroAuth(String value) {
    _$erroAuthAtom.reportWrite(value, super.erroAuth, () {
      super.erroAuth = value;
    });
  }

  late final _$errorUsernameAtom =
      Atom(name: '_LoginControllerBase.errorUsername', context: context);

  @override
  String get errorUsername {
    _$errorUsernameAtom.reportRead();
    return super.errorUsername;
  }

  @override
  set errorUsername(String value) {
    _$errorUsernameAtom.reportWrite(value, super.errorUsername, () {
      super.errorUsername = value;
    });
  }

  late final _$errorPasswordAtom =
      Atom(name: '_LoginControllerBase.errorPassword', context: context);

  @override
  String get errorPassword {
    _$errorPasswordAtom.reportRead();
    return super.errorPassword;
  }

  @override
  set errorPassword(String value) {
    _$errorPasswordAtom.reportWrite(value, super.errorPassword, () {
      super.errorPassword = value;
    });
  }

  late final _$validDataAtom =
      Atom(name: '_LoginControllerBase.validData', context: context);

  @override
  bool get validData {
    _$validDataAtom.reportRead();
    return super.validData;
  }

  @override
  set validData(bool value) {
    _$validDataAtom.reportWrite(value, super.validData, () {
      super.validData = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_LoginControllerBase.login', context: context);

  @override
  Future<bool> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase', context: context);

  @override
  void onChangeUsername(String text) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.onChangeUsername');
    try {
      return super.onChangeUsername(text);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVisiblePassword() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setVisiblePassword');
    try {
      return super.setVisiblePassword();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setLoading');
    try {
      return super.setLoading();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErrorAuth(String message) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setErrorAuth');
    try {
      return super.setErrorAuth(message);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onChangePassword(String text) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.onChangePassword');
    try {
      return super.onChangePassword(text);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateData() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.validateData');
    try {
      return super.validateData();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
username: ${username},
isLoading: ${isLoading},
visiblePassword: ${visiblePassword},
password: ${password},
erroAuth: ${erroAuth},
errorUsername: ${errorUsername},
errorPassword: ${errorPassword},
validData: ${validData}
    ''';
  }
}
