

import '../core/export.dart';

class SMAuthStateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show loading screen while checking authentication status
          return const CircularProgressIndicator();
        } else if (snapshot.hasData) {
          // If the user is logged in, navigate to the home screen
          // return  SMHomeScreen.create();
          return SMHomeScreen.create();
        } else {
          // If the user is not logged in, navigate to the login screen
          return SMRegisterScreen();
        }
      },
    );
  }
}
