// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sm_plan_screen.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SMPlanScreenController on _SMPlanScreenController, Store {
  late final _$loadingAtom =
      Atom(name: '_SMPlanScreenController.loading', context: context);

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
      Atom(name: '_SMPlanScreenController.loadingIndicator', context: context);

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

  late final _$dateTransferAtom =
      Atom(name: '_SMPlanScreenController.dateTransfer', context: context);

  @override
  String get dateTransfer {
    _$dateTransferAtom.reportRead();
    return super.dateTransfer;
  }

  @override
  set dateTransfer(String value) {
    _$dateTransferAtom.reportWrite(value, super.dateTransfer, () {
      super.dateTransfer = value;
    });
  }

  late final _$_selectedDateAtom =
      Atom(name: '_SMPlanScreenController._selectedDate', context: context);

  @override
  DateTime get _selectedDate {
    _$_selectedDateAtom.reportRead();
    return super._selectedDate;
  }

  @override
  set _selectedDate(DateTime value) {
    _$_selectedDateAtom.reportWrite(value, super._selectedDate, () {
      super._selectedDate = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_SMPlanScreenController.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_SMPlanScreenControllerActionController =
      ActionController(name: '_SMPlanScreenController', context: context);

  @override
  void updateDateTransfer() {
    final _$actionInfo = _$_SMPlanScreenControllerActionController.startAction(
        name: '_SMPlanScreenController.updateDateTransfer');
    try {
      return super.updateDateTransfer();
    } finally {
      _$_SMPlanScreenControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool loading_) {
    final _$actionInfo = _$_SMPlanScreenControllerActionController.startAction(
        name: '_SMPlanScreenController.setLoading');
    try {
      return super.setLoading(loading_);
    } finally {
      _$_SMPlanScreenControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showLoadingIndicator() {
    final _$actionInfo = _$_SMPlanScreenControllerActionController.startAction(
        name: '_SMPlanScreenController.showLoadingIndicator');
    try {
      return super.showLoadingIndicator();
    } finally {
      _$_SMPlanScreenControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void hideLoadingIndicator() {
    final _$actionInfo = _$_SMPlanScreenControllerActionController.startAction(
        name: '_SMPlanScreenController.hideLoadingIndicator');
    try {
      return super.hideLoadingIndicator();
    } finally {
      _$_SMPlanScreenControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
loadingIndicator: ${loadingIndicator},
dateTransfer: ${dateTransfer}
    ''';
  }
}
