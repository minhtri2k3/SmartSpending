

import 'package:sentry_flutter/sentry_flutter.dart';

import '../core/export.dart';
import 'services/sm_router_service.dart';


Future<void> setupMyApp() async{
   GetIt.I.registerSingletonAsync<SMRouterService>(SMRouterService().init,);
}
Future<void> runMyApp() async{
  await setupMyApp();
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      child: MyApp(),
    ),
  );
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  await SentryFlutter.init(
        (options) {
      options.tracesSampleRate = 1.0;
    },
    appRunner: runMyApp,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Spending',
      home: SMLoginScreen(),
    );
  }
}
