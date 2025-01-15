import '../core/export.dart';

class SMColors {
  static const Color white1 = Color(0xFFFFFFFF);
  static const Color blue1 = Color(0xff152534);
  static const Color black1 = Color(0x11111180);
  static const Color primaryColor = Color(0xffBAE162);
  static const Color darkBlue = Color(0xff1E2E3D);
  static const Color darkerBlue = Color(0xff152534);
  static const Color darkestBlue = Color(0xff0C1C2E);
  static const Color skinny = Color(0xFFFBF0C4);
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

  Color get heartFoodColor => SMColors.skinny;

  Color get memoryLastStackColor => SMColors.white1.withOpacity(0.3);

  Color get memorySecondStackColor => SMColors.white1.withOpacity(0.7);

  Color get memoryFirstStackColor => SMColors.white1;

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

  LinearGradient get mainScreenGradientTheme {
    return const LinearGradient(
      colors: [
        Color(0xFF020024), // Start color
        Color(0xFF090979),
        Color(0xFF00d4ff),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  LinearGradient get memoryScreenGradientTheme {
    return const LinearGradient(
      colors: [
        Color(0xffd8e1f4),
        Color(0xff94bbe9)
      ], // Replace with your desired colors
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  LinearGradient get memoryThemeGradient => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          SMColors.white1.withOpacity(0.3),
          SMColors.white1,
        ],
      );

  LinearGradient get restaurantScreenGradientTheme {
    return const LinearGradient(
      colors: [
        Color(0xFFE18AAA), // Start color
        Color(0xFFEFCFD4),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  LinearGradient get restaurantStarGradientTheme {
    return const LinearGradient(
      colors: [
        Color(0xFF833ab4), // Start color
        Color(0xFFfd1d1d),
        Color(0xFFfcb045),
      ],
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

  TextStyle get appBarTitleTextStyle => GoogleFonts.playfair(
        color: Colors.white, // Title color
        fontSize: 25.sp, // Adjust the font size
        fontWeight: FontWeight.bold, // Optional: Make the title bold
      );

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

  TextStyle get restaurantNameTextStyle => GoogleFonts.playfair(
        fontSize: 27.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );

  TextStyle get restaurantTitleTextStyle => GoogleFonts.playfair(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFBF0C4),
      );

  TextStyle get restaurantContentTextStyle => GoogleFonts.playfair(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
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
