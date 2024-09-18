
import '../core/export.dart';

class SMHomeScreen extends StatefulWidget {
  const SMHomeScreen({super.key});

  @override
  State<SMHomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SMHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

    );
  }
  Decoration get _gradientBox {
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
