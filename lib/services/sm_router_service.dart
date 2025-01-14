import '../core/export.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'rootNavigatorKey');
final GlobalKey<NavigatorState> memoryNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'memoryNavigatorKey');
final GlobalKey<NavigatorState> restaurantsNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'restaurantNavigatorKey');
final GlobalKey<NavigatorState> foodsNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'foodNavigatorKey');
final GlobalKey<NavigatorState> travelNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'travelNavigatorKey');
final GlobalKey<NavigatorState> planNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'planNavigatorKey');

class SMRouterService {
  late GoRouter router;

  Future<SMRouterService> init() async {
    router = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: '/home',
      routes: [
        // GoRoute(
        //   path: '/home',
        //   builder: (context, state) => SMHomeScreen.create(),
        // ),
        GoRoute(
          path: '/register',
          builder: (context, state) => SMRegisterScreen(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => SMLoginScreen(),
        ),
        GoRoute(
          path: '/authenticate',
          builder: (context, state) => SMAuthStateScreen(),
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              SMMainScreen(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(
              navigatorKey: memoryNavigatorKey,
              routes: [
                GoRoute(
                  path: '/home',
                  builder: (context, state) => SMHomeScreen.create(),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: restaurantsNavigatorKey,
              routes: [
                GoRoute(
                  path: '/restaurant',
                  builder: (context, state) => SMEatScreen.create(),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: foodsNavigatorKey,
              routes: [
                GoRoute(
                  path: '/food',
                  builder: (context, state) => SMHomeScreen.create(),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: travelNavigatorKey,
              routes: [
                GoRoute(
                  path: '/travel',
                  builder: (context, state) => SMHomeScreen.create(),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: planNavigatorKey,
              routes: [
                GoRoute(
                  path: '/plan',
                  builder: (context, state) => SMHomeScreen.create(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
    return this;
  }
}
