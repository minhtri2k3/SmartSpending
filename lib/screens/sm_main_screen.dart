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
              left: 16.0, // Adjust padding from the left edge
              right: 16.0, // Adjust padding from the right edge
              bottom: 16.0, // Adjust padding from the bottom edge
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                // Make the bar rounded
                child: BottomNavigationBar(
                  backgroundColor: const Color(0xFF355C7D),
                  currentIndex: navigationShell.currentIndex,
                  type: BottomNavigationBarType.fixed,
                  iconSize: themeService.bottomBarItemIconSize,
                  selectedItemColor: themeService.bottomBarItemSelectedColor,
                  unselectedItemColor: Colors.white,
                  selectedLabelStyle: themeService.routeSelectedTextStyle,
                  unselectedLabelStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.cloud,
                        color: Colors.white,
                      ),
                      label: 'Memory',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.lunch_dining,
                        color: Colors.white,
                      ),
                      label: 'Eat',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.soup_kitchen,
                        color: Colors.white,
                      ),
                      label: 'Cook',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.backpack,
                        color: Colors.white,
                      ),
                      label: 'Travel',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
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
          ],
        ),
      ),
    );
  }
}
