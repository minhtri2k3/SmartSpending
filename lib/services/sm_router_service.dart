import '../core/export.dart';

class SMRouterService {
  late GoRouter router;
  Future<SMRouterService> init() async {
    router = GoRouter(initialLocation: "/login", routes: [
      GoRoute(path: '/home', builder: (context, state) => const SMHomeScreen()),
      GoRoute(path: '/login', builder: (context, state) => SMLoginScreen())
    ]);
    return this;
  }
}
