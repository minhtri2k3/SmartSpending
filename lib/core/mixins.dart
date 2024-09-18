import 'export.dart';

mixin SMServices {
  late final GoRouter router;
  late final GetIt getIt = GetIt.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  late final SMRouterService routerService;
  // late final FToast fToast;
  late final Logger logger;

  bool getServicesDone = false;

  Future<void> getServices() async {
    if (getServicesDone) return;
    await getIt.allReady();
    routerService = await getIt.getAsync<SMRouterService>();
    // fToast = await getIt.getAsync<FToast>();
    logger = await getIt.getAsync<Logger>();

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
          return Container();
        }
        if (onGetServicesDone != null) onGetServicesDone();

        return childBuilder(context);
      },
    );
  }
}
