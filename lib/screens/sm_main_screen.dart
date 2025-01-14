import '../core/export.dart';

class SMMainScreen extends StatelessWidget
    with SMServices, SMWidgetMainBuilder {
  StatefulNavigationShell navigationShell;

  SMMainScreen({
    super.key,
    required this.navigationShell,
  }) {
    getServicesFuture = getServices();
  }

  @override
  Widget build(BuildContext context) {
    return mainBuilder(
      (context) => Scaffold(
        body: Stack(
          children: [
            navigationShell, // Your main body content
            Positioned(
              left: 16.0.w, // Adjust padding from the left edge
              right: 16.0.w, // Adjust padding from the right edge
              bottom: 16.0.h, // Adjust padding from the bottom edge
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                // Make the bar rounded

                child: Container(
                  decoration: BoxDecoration(
                    gradient: themeService.mainScreenGradientTheme,
                  ),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.transparent,
                    currentIndex: navigationShell.currentIndex,
                    type: BottomNavigationBarType.fixed,
                    iconSize: themeService.bottomBarItemIconSize,
                    selectedItemColor: themeService.bottomBarItemSelectedColor,
                    unselectedItemColor: Colors.white,
                    selectedLabelStyle: themeService.routeSelectedTextStyle,
                    unselectedLabelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(
                          size: 20.sp,
                          Icons.cloud,
                          color: Colors.white,
                        ),
                        label: 'Memory',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          size: 20.sp,
                          Icons.lunch_dining,
                          color: Colors.white,
                        ),
                        label: 'Eat',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          size: 20.sp,
                          Icons.soup_kitchen,
                          color: Colors.white,
                        ),
                        label: 'Cook',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          size: 20.sp,
                          Icons.backpack,
                          color: Colors.white,
                        ),
                        label: 'Travel',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          size: 20.sp,
                          Icons.travel_explore_outlined,
                          color: Colors.white,
                        ),
                        label: 'Plans',
                      ),
                    ],
                    onTap: (index) => navigationShell.goBranch(
                      index,
                      initialLocation: index == navigationShell.currentIndex,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
