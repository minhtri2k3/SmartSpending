import '../core/export.dart';

class SmMainScreen extends StatelessWidget
    with SMServices, SMWidgetMainBuilder {
  StatefulNavigationShell navigationShell;
  SmMainScreen({
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
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Kỷ niệm',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Quán ăn',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Tự nấu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Du lich',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
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
