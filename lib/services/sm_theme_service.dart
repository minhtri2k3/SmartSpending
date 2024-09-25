import '../core/export.dart';
class SMColors{
  static const Color white1 = Color(0xFFFFFFFF);

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
   Decoration get _gradientTheme {
     return const BoxDecoration(
       gradient: LinearGradient(
         colors: [
           Color(0xff1E2E3D),
           Color(0xff152534),
           Color(0xff0C1C2E)
         ], // Replace with your desired colors
         begin: Alignment.topLeft,
         end: Alignment.bottomRight,
       ),
     );
   }
}