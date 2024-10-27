import '../core/export.dart';

part 'sm_button.g.dart';

// ignore: library_private_types_in_public_api
class SMButtonController = _SMButtonController
    with _$SMButtonController;

abstract class _SMButtonController extends SMBaseController
    with Store {
  @observable
  bool loading = false;
}

class SMButton extends SMBaseWidget<SMButtonState> {
  const SMButton({
    super.key,
    required super.state,
  });

  static SMButton create({
    Key? key,
    String? instanceName,
    double? width,
    double? height,
    Color? backgroundColor,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    required String title,
    TextStyle? titleTextStyle,
    VoidCallback? onTap,
  }) {
    final SMButtonController controller = SMButtonController();
    return SMButton(
      key: key ?? controller.widgetKey,
      state: SMButtonState(
        instanceName: instanceName == null
            ? 'SMButton'
            : 'SMButton[$instanceName]',
        controller: controller,
        width: width,
        height: height,
        backgroundColor: backgroundColor,
        focusColor: focusColor,
        hoverColor: hoverColor,
        highlightColor: highlightColor,
        splashColor: splashColor,
        title: title,
        titleTextStyle: titleTextStyle,
        onTap: onTap,
      ),
    );
  }
}

class SMButtonState
    extends SMBaseWidgetState<SMButtonController> {
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final String title;
  final TextStyle? titleTextStyle;
  final VoidCallback? onTap;

  SMButtonState({
    required super.instanceName,
    required super.controller,
    this.width,
    this.height,
    this.backgroundColor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    required this.title,
    this.titleTextStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return mainBuilder(
          (context) => Material(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9999.r),
        ),
        elevation: 8.0,
        shadowColor: themeService.buttonShadowColor,
        child: Ink(
          width: width ?? double.infinity,
          height: height ?? themeService.buttonHeight,
          decoration: BoxDecoration(
            color: backgroundColor ?? themeService.buttonBackgroundColor,
            borderRadius: BorderRadius.circular(9999.r),
          ),
          child: InkWell(
            focusColor: focusColor ?? themeService.buttonFocusColor,
            hoverColor: hoverColor ?? themeService.buttonHoverColor,
            highlightColor: highlightColor ?? themeService.buttonHighlightColor,
            splashColor: splashColor ?? themeService.buttonSplashColor,
            borderRadius: BorderRadius.circular(9999.r),
            onTap: onTap ?? () {},
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: titleTextStyle ?? themeService.buttonTitleTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
