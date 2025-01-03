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

  late final _$activeIndexAtom =
      Atom(name: '_SMHomeScreenController.activeIndex', context: context);

  @override
  int get activeIndex {
    _$activeIndexAtom.reportRead();
    return super.activeIndex;
  }

  @override
  set activeIndex(int value) {
    _$activeIndexAtom.reportWrite(value, super.activeIndex, () {
      super.activeIndex = value;
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

  late final _$portraitCropControllerAtom = Atom(
      name: '_SMHomeScreenController.portraitCropController', context: context);

  @override
  CropController? get portraitCropController {
    _$portraitCropControllerAtom.reportRead();
    return super.portraitCropController;
  }

  @override
  set portraitCropController(CropController? value) {
    _$portraitCropControllerAtom
        .reportWrite(value, super.portraitCropController, () {
      super.portraitCropController = value;
    });
  }

  late final _$portraitAtom =
      Atom(name: '_SMHomeScreenController.portrait', context: context);

  @override
  Uint8List? get portrait {
    _$portraitAtom.reportRead();
    return super.portrait;
  }

  @override
  set portrait(Uint8List? value) {
    _$portraitAtom.reportWrite(value, super.portrait, () {
      super.portrait = value;
    });
  }

  late final _$portraitCropDialogAtom = Atom(
      name: '_SMHomeScreenController.portraitCropDialog', context: context);

  @override
  Widget? get portraitCropDialog {
    _$portraitCropDialogAtom.reportRead();
    return super.portraitCropDialog;
  }

  @override
  set portraitCropDialog(Widget? value) {
    _$portraitCropDialogAtom.reportWrite(value, super.portraitCropDialog, () {
      super.portraitCropDialog = value;
    });
  }

  late final _$portraitCropButtonsAtom = Atom(
      name: '_SMHomeScreenController.portraitCropButtons', context: context);

  @override
  Widget? get portraitCropButtons {
    _$portraitCropButtonsAtom.reportRead();
    return super.portraitCropButtons;
  }

  @override
  set portraitCropButtons(Widget? value) {
    _$portraitCropButtonsAtom.reportWrite(value, super.portraitCropButtons, () {
      super.portraitCropButtons = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_SMHomeScreenController.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$getImageAsyncAction =
      AsyncAction('_SMHomeScreenController.getImage', context: context);

  @override
  Future<void> getImage(ImageSource imageSource) {
    return _$getImageAsyncAction.run(() => super.getImage(imageSource));
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
  void hidePortraitCropDialog() {
    final _$actionInfo = _$_SMHomeScreenControllerActionController.startAction(
        name: '_SMHomeScreenController.hidePortraitCropDialog');
    try {
      return super.hidePortraitCropDialog();
    } finally {
      _$_SMHomeScreenControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void hidePortraitCropButtons() {
    final _$actionInfo = _$_SMHomeScreenControllerActionController.startAction(
        name: '_SMHomeScreenController.hidePortraitCropButtons');
    try {
      return super.hidePortraitCropButtons();
    } finally {
      _$_SMHomeScreenControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showPortraitCropButtons() {
    final _$actionInfo = _$_SMHomeScreenControllerActionController.startAction(
        name: '_SMHomeScreenController.showPortraitCropButtons');
    try {
      return super.showPortraitCropButtons();
    } finally {
      _$_SMHomeScreenControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showPortraitCropDialog(Uint8List image) {
    final _$actionInfo = _$_SMHomeScreenControllerActionController.startAction(
        name: '_SMHomeScreenController.showPortraitCropDialog');
    try {
      return super.showPortraitCropDialog(image);
    } finally {
      _$_SMHomeScreenControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
activeIndex: ${activeIndex},
loadingIndicator: ${loadingIndicator},
portraitCropController: ${portraitCropController},
portrait: ${portrait},
portraitCropDialog: ${portraitCropDialog},
portraitCropButtons: ${portraitCropButtons}
    ''';
  }
}
