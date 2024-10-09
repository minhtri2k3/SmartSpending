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
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: navigationShell.currentIndex,
          type: BottomNavigationBarType.fixed,
          iconSize: themeService.bottomBarItemIconSize,
          selectedItemColor: themeService.bottomBarItemSelectedColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Kỷ niệm',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.food_bank_outlined),
              label: 'Quán ăn',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu_outlined),
              label: 'Tự nấu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.flight_outlined),
              label: 'Du lich',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.travel_explore_outlined),
              label: 'Dự tính',
            ),
          ],
          onTap: (index) => navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          ),
        ),
        body: navigationShell,
      ),
    );
  }
}
