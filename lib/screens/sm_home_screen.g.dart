// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sm_home_screen.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SMHomeScreenController on _SMHomeScreenController, Store {
  late final _$loadingAtom =
      Atom(name: '_SMHomeScreenController.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$loadingIndicatorAtom =
      Atom(name: '_SMHomeScreenController.loadingIndicator', context: context);

  @override
  Widget? get loadingIndicator {
    _$loadingIndicatorAtom.reportRead();
    return super.loadingIndicator;
  }

  @override
  set loadingIndicator(Widget? value) {
    _$loadingIndicatorAtom.reportWrite(value, super.loadingIndicator, () {
      super.loadingIndicator = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_SMHomeScreenController.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_SMHomeScreenControllerActionController =
      ActionController(name: '_SMHomeScreenController', context: context);

  @override
  void setLoading(bool loading_) {
    final _$actionInfo = _$_SMHomeScreenControllerActionController.startAction(
        name: '_SMHomeScreenController.setLoading');
    try {
      return super.setLoading(loading_);
    } finally {
      _$_SMHomeScreenControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showLoadingIndicator() {
    final _$actionInfo = _$_SMHomeScreenControllerActionController.startAction(
        name: '_SMHomeScreenController.showLoadingIndicator');
    try {
      return super.showLoadingIndicator();
    } finally {
      _$_SMHomeScreenControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void hideLoadingIndicator() {
    final _$actionInfo = _$_SMHomeScreenControllerActionController.startAction(
        name: '_SMHomeScreenController.hideLoadingIndicator');
    try {
      return super.hideLoadingIndicator();
    } finally {
      _$_SMHomeScreenControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
loadingIndicator: ${loadingIndicator}
    ''';
  }
}
