import '../core/export.dart';

class SMColors {
  static const Color white1 = Color(0xFFFFFFFF);
  static const Color blue1 = Color(0xff152534);
  static const Color black1 = Color(0x11111180);
}

class SMThemeService {
  Future<SMThemeService> init() async {
    return this;
  }

  Color getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  Color get bottomBarItemSelectedColor => SMColors.white1;

  Color get cropDialogMaskColor => SMColors.blue1.withOpacity(0.6);

  Color get cropDialogBaseColor => SMColors.white1;

  Color get buttonShadowColor => SMColors.blue1.withOpacity(0.5);

  Color get buttonBackgroundColor => SMColors.blue1;

  Color get buttonFocusColor => SMColors.white1.withOpacity(0.1);

  Color get buttonHoverColor => SMColors.white1.withOpacity(0.1);

  Color get buttonHighlightColor => SMColors.white1.withOpacity(0.1);

  Color get buttonSplashColor => SMColors.white1.withOpacity(0.1);

  Color get logoSplashColor => SMColors.black1.withOpacity(0.5);

  LinearGradient get blackGradientTheme {
    return const LinearGradient(
      colors: [
        Color(0xff1E2E3D),
        Color(0xff152534),
        Color(0xff0C1C2E)
      ], // Replace with your desired colors
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  LinearGradient get lightBlueGradientTheme {
    return const LinearGradient(
      colors: [
        Color(0xff4A90E2), // Lighter blue
        Color(0xff357ABD), // Mid-tone blue
        Color(0xff2C5C8A), // Darker blue
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  double get bottomBarItemIconSize => 26.r;

  double get buttonHeight => 44.h;

  TextStyle get buttonTitleTextStyle => GoogleFonts.openSans(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: SMColors.white1,
      );

  TextStyle get routeSelectedTextStyle =>
      GoogleFonts.openSans(color: SMColors.white1, fontWeight: FontWeight.bold);

  TextStyle get titleHomeTextStyle => GoogleFonts.openSans(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      );

  TextStyle get subtitleHomeTextStyle => GoogleFonts.openSans(
        fontSize: 10.sp,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.italic,
      );

  TextStyle get buttonTextStyle => GoogleFonts.openSans(
        fontSize: 13.sp,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Colors.white,
      );

  EdgeInsetsGeometry get leftHomeInsets => EdgeInsets.only(
        left: 25.sp,
      );

  EdgeInsetsGeometry get rightHomeInsets => EdgeInsets.only(
        right: 25.sp,
      );

  Widget get loadingIndicator => Container(
        width: double.infinity,
        height: double.infinity,
        color: SMColors.blue1.withOpacity(0.5),
        child: Center(
          child: SpinKitFadingCircle(
            size: 50.r,
            color: SMColors.white1,
          ),
        ),
      );
}
