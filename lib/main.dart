import '../core/export.dart';
import 'firebase_options.dart';

// Happy new year 2025
Future<void> setupMyApp() async {
  GetIt.I.registerSingletonAsync<SMRouterService>(
    SMRouterService().init,
  );
  GetIt.I.registerLazySingletonAsync<SMThemeService>(
    SMThemeService().init,
  );
  GetIt.I.registerSingletonAsync<FToast>(
    () async => FToast(),
  );
  GetIt.I.registerSingletonAsync<Logger>(
    () async => Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        colors: false,
        excludeBox: {
          Level.info: true,
          Level.debug: true,
        },
      ),
    ),
  );
}

Future<void> runMyApp() async {
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
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await SentryFlutter.init(
  //       (options) {options.dsn = HTHCSettings.sentryDSN;
  //     options.tracesSampleRate = 1.0;
  //   },
  //   appRunner: runMyApp,
  // );
  runMyApp();
}

class MyApp extends StatelessWidget with SMServices, SMWidgetMainBuilder {
  MyApp({super.key}) {
    getServicesFuture = getServices();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return mainBuilder(
      (context) {
        return MaterialApp.router(
          title: 'LuuTruKyNiem',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: routerService.router,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: child!,
          ),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
