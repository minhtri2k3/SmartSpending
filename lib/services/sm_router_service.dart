import '../core/export.dart';
import '../screens/sm_restaurants_screen.dart';

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
      initialLocation: '/restaurant',
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
          builder: (context, state, navigationShell) => Stack(
            children: [
              Positioned.fill(
                child: SMMainScreen(navigationShell: navigationShell),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 20.h, // 10px above the bottom of the screen
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 16.w), // Optional horizontal margin
                  padding: EdgeInsets.all(
                      8.sp), // Padding for the bottom bar content
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color of the bottom bar
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey, // Shadow color
                        blurRadius: 10, // Shadow blur radius
                        offset: Offset(0, 4), // Shadow offset
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.home, size: 30.sp), // Example icon
                      GestureDetector(
                        onTap: () => navigationShell.goBranch(1),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.restaurant,
                              size: 20.sp,
                            ),
                            Text(
                              'Quán ăn',
                            )
                          ],
                        ),
                      ), // Example icon
                      Icon(Icons.fastfood, size: 30.sp), // Example icon
                      Icon(Icons.travel_explore, size: 30.sp), // Example icon
                      Icon(Icons.event, size: 30.sp), // Example icon
                    ],
                  ),
                ),
              ),
            ],
          ),
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
                  builder: (context, state) => SMRestaurantsScreen.create(),
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
