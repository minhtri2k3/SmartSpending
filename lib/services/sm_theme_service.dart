import 'package:google_fonts/google_fonts.dart';

import '../core/export.dart';
class SMColors{
  static const Color white1 = Color(0xFFFFFFFF);
  static const Color blue1 =  Color(0xff152534);

}
class SMThemeService{
   Future<SMThemeService> init() async{
     return this;
   }
   Color getColorFromHex(String hexColor) {
     hexColor = hexColor.toUpperCase().replaceAll('#', '');
     if (hexColor.length == 6) {
       hexColor = 'FF$hexColor';
     }
     return Color(int.parse(hexColor, radix: 16));
   }

   double get bottomBarItemIconSize => 26.r;
   Color get bottomBarItemSelectedColor => SMColors.blue1;

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
   EdgeInsetsGeometry get leftHomeInsets => EdgeInsets.only(left: 25.sp,);
   EdgeInsetsGeometry get rightHomeInsets => EdgeInsets.only(right: 25.sp,);
   TextStyle get buttonTextStyle => GoogleFonts.openSans(
     fontSize: 13.sp,
     fontWeight: FontWeight.bold,
     fontStyle: FontStyle.italic,
     color: Colors.white,
   );

}