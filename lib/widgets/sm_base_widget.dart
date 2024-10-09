
import '../core/export.dart';
import '../core/mixins.dart';

abstract class SMBaseController with SMServices {}

abstract class SMBaseWidget<T extends SMBaseWidgetState>
    extends StatefulWidget {
  final T state;

  const SMBaseWidget({
    super.key,
    required this.state,
  });

  @override
  // ignore: no_logic_in_create_state
  T createState() => state;
}

abstract class SMBaseWidgetState<T extends SMBaseController>
    extends State<SMBaseWidget>
    with SMServices, SMWidgetMainBuilder {
  late final String instanceName;
  final T controller;
  late final String controllerName;

  SMBaseWidgetState({
    required String instanceName,
    required this.controller,
  }) {
    this.instanceName = '${controller.widgetKey}$instanceName';
    this.controllerName = '${this.instanceName}Controller';
  }

  Future<void> _initState() async {
    await getServices();
    registerController();
    await controller.getServices();
    //logger.d('Init Widget: $instanceName');
  }

  @override
  void initState() {
    getServicesFuture = _initState();
    super.initState();
  }

  @override
  void dispose() {
    unregisterController();
  //  logger.d('Dispose Widget: $instanceName');
    super.dispose();
  }

  void registerController() {
    getIt.registerSingleton<T>(
      controller,
      instanceName: controllerName,
    );
  //  logger.d('Register Controller: $controllerName');
  }

  void unregisterController() {
    getIt.unregister<T>(
      instance: controller,
      instanceName: controllerName,
    );
  //  logger.d('Unregister Controller: $controllerName');
  }
}
