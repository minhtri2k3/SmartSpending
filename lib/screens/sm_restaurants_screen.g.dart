// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sm_restaurants_screen.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SMRestaurantsScreenController on _SMRestaurantsScreenController, Store {
  late final _$loadingAtom =
      Atom(name: '_SMRestaurantsScreenController.loading', context: context);

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

  late final _$loadingIndicatorAtom = Atom(
      name: '_SMRestaurantsScreenController.loadingIndicator',
      context: context);

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
      AsyncAction('_SMRestaurantsScreenController.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$getImageAsyncAction =
      AsyncAction('_SMRestaurantsScreenController.getImage', context: context);

  @override
  Future<void> getImage(ImageSource imageSource) {
    return _$getImageAsyncAction.run(() => super.getImage(imageSource));
  }

  late final _$_SMRestaurantsScreenControllerActionController =
      ActionController(
          name: '_SMRestaurantsScreenController', context: context);

  @override
  void setLoading(bool loading_) {
    final _$actionInfo = _$_SMRestaurantsScreenControllerActionController
        .startAction(name: '_SMRestaurantsScreenController.setLoading');
    try {
      return super.setLoading(loading_);
    } finally {
      _$_SMRestaurantsScreenControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showLoadingIndicator() {
    final _$actionInfo =
        _$_SMRestaurantsScreenControllerActionController.startAction(
            name: '_SMRestaurantsScreenController.showLoadingIndicator');
    try {
      return super.showLoadingIndicator();
    } finally {
      _$_SMRestaurantsScreenControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void hideLoadingIndicator() {
    final _$actionInfo =
        _$_SMRestaurantsScreenControllerActionController.startAction(
            name: '_SMRestaurantsScreenController.hideLoadingIndicator');
    try {
      return super.hideLoadingIndicator();
    } finally {
      _$_SMRestaurantsScreenControllerActionController.endAction(_$actionInfo);
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
