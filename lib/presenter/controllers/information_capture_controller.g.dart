// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_capture_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InformationCaptureController
    on _InformationCaptureControllerBase, Store {
  late final _$editLoadingAtom = Atom(
      name: '_InformationCaptureControllerBase.editLoading', context: context);

  @override
  bool get editLoading {
    _$editLoadingAtom.reportRead();
    return super.editLoading;
  }

  @override
  set editLoading(bool value) {
    _$editLoadingAtom.reportWrite(value, super.editLoading, () {
      super.editLoading = value;
    });
  }

  late final _$activitiesAtom = Atom(
      name: '_InformationCaptureControllerBase.activities', context: context);

  @override
  List<ActivitiesEntity> get activities {
    _$activitiesAtom.reportRead();
    return super.activities;
  }

  @override
  set activities(List<ActivitiesEntity> value) {
    _$activitiesAtom.reportWrite(value, super.activities, () {
      super.activities = value;
    });
  }

  late final _$deleteLoadingAtom = Atom(
      name: '_InformationCaptureControllerBase.deleteLoading',
      context: context);

  @override
  bool get deleteLoading {
    _$deleteLoadingAtom.reportRead();
    return super.deleteLoading;
  }

  @override
  set deleteLoading(bool value) {
    _$deleteLoadingAtom.reportWrite(value, super.deleteLoading, () {
      super.deleteLoading = value;
    });
  }

  late final _$addLoadingAtom = Atom(
      name: '_InformationCaptureControllerBase.addLoading', context: context);

  @override
  bool get addLoading {
    _$addLoadingAtom.reportRead();
    return super.addLoading;
  }

  @override
  set addLoading(bool value) {
    _$addLoadingAtom.reportWrite(value, super.addLoading, () {
      super.addLoading = value;
    });
  }

  late final _$deleteActivityAsyncAction = AsyncAction(
      '_InformationCaptureControllerBase.deleteActivity',
      context: context);

  @override
  Future<bool> deleteActivity(int id) {
    return _$deleteActivityAsyncAction.run(() => super.deleteActivity(id));
  }

  late final _$fetchActivityAsyncAction = AsyncAction(
      '_InformationCaptureControllerBase.fetchActivity',
      context: context);

  @override
  Future<void> fetchActivity() {
    return _$fetchActivityAsyncAction.run(() => super.fetchActivity());
  }

  late final _$editActivityAsyncAction = AsyncAction(
      '_InformationCaptureControllerBase.editActivity',
      context: context);

  @override
  Future<bool> editActivity(ActivitiesEntity activity) {
    return _$editActivityAsyncAction.run(() => super.editActivity(activity));
  }

  late final _$addActivityAsyncAction = AsyncAction(
      '_InformationCaptureControllerBase.addActivity',
      context: context);

  @override
  Future<bool> addActivity(String activity) {
    return _$addActivityAsyncAction.run(() => super.addActivity(activity));
  }

  late final _$_InformationCaptureControllerBaseActionController =
      ActionController(
          name: '_InformationCaptureControllerBase', context: context);

  @override
  void setLoadingEdit(bool value) {
    final _$actionInfo = _$_InformationCaptureControllerBaseActionController
        .startAction(name: '_InformationCaptureControllerBase.setLoadingEdit');
    try {
      return super.setLoadingEdit(value);
    } finally {
      _$_InformationCaptureControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setAddLoading(bool value) {
    final _$actionInfo = _$_InformationCaptureControllerBaseActionController
        .startAction(name: '_InformationCaptureControllerBase.setAddLoading');
    try {
      return super.setAddLoading(value);
    } finally {
      _$_InformationCaptureControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingDelete(bool value) {
    final _$actionInfo =
        _$_InformationCaptureControllerBaseActionController.startAction(
            name: '_InformationCaptureControllerBase.setLoadingDelete');
    try {
      return super.setLoadingDelete(value);
    } finally {
      _$_InformationCaptureControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
editLoading: ${editLoading},
activities: ${activities},
deleteLoading: ${deleteLoading},
addLoading: ${addLoading}
    ''';
  }
}
