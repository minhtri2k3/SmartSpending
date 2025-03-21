import 'export.dart';

mixin SMServices {
  final GlobalKey widgetKey = GlobalKey();
  late final GetIt getIt = GetIt.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // late final SMDatabaseService databaseService ;

  late final SMRouterService routerService;
  late final SMThemeService themeService;
  late final FToast fToast;
  late final Logger logger;

  late final GoRouter router;

  bool getServicesDone = false;

  Future<void> getServices() async {
    if (getServicesDone) return;
    await getIt.allReady();
    routerService = await getIt.getAsync<SMRouterService>();
    themeService = await getIt.getAsync<SMThemeService>();
    fToast = await getIt.getAsync<FToast>();
    logger = await getIt.getAsync<Logger>();

    // databaseService = await getIt.getAsync<SMDatabaseService>();

    router = routerService.router;

    getServicesDone = true;
  }
}

typedef SMWidgetChildBuilder = Widget Function(BuildContext context);

mixin SMWidgetMainBuilder on SMServices {
  late final Future getServicesFuture;

  Widget mainBuilder(
    SMWidgetChildBuilder childBuilder, {
    VoidCallback? onGetServicesDone,
  }) {
    return FutureBuilder(
      future: getServicesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Container();
        }
        if (snapshot.hasError) {
          logger.e(snapshot.error);
          return Container();
        }
        if (onGetServicesDone != null) onGetServicesDone();

        return childBuilder(context);
      },
    );
  }
}
