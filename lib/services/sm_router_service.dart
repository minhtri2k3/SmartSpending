import '../core/export.dart';

class SMRouterService {
  late GoRouter router;
  Future<SMRouterService> init() async {
    router = GoRouter(initialLocation: "/register", routes: [
      GoRoute(path: '/home', builder: (context, state) => const SMHomeScreen()),
      GoRoute(path: '/register', builder: (context, state) => SMRegisterScreen()),
      GoRoute(path: '/login' , builder: (context , state ) => SMLoginScreen())
    ]);
    return this;
  }
}
