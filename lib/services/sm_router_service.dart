import '../core/export.dart';
import '../screens/home_screen.dart';

class SMRouter {
  late GoRouter router;
  Future<SMRouter> init() async {
    router = GoRouter(initialLocation: "/", routes: [GoRoute(path: "/home",
    builder: (context , state ) =>  const SMHomeScreen())
    ]);
    return this;
  }
}
