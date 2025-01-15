import '../core/export.dart';

part 'sm_home_screen.g.dart';

class SMHomeScreenController = _SMHomeScreenController
    with _$SMHomeScreenController;

abstract class _SMHomeScreenController extends SMBaseController with Store {
  @observable
  bool loading = true;

  @observable
  Widget? loadingIndicator;

  @action
  void setLoading(bool loading_) => loading = loading_;

  @action
  void showLoadingIndicator() =>
      loadingIndicator = themeService.loadingIndicator;

  @action
  void hideLoadingIndicator() => loadingIndicator = null;

  @action
  Future<void> getData() async {
    try {} on DioException catch (error, stackTrace) {
      // onApiException(error, stackTrace);
    } catch (error, stackTrace) {
      logger.e(
        error,
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}

class SMHomeScreen extends SMBaseWidget<SMHomeScreenState> {
  const SMHomeScreen({
    super.key,
    required super.state,
  });

  static SMHomeScreen create({
    Key? key,
    String? instanceName,
  }) {
    final SMHomeScreenController controller = SMHomeScreenController();
    return SMHomeScreen(
      state: SMHomeScreenState(
        controller: controller,
        instanceName: instanceName == null
            ? 'HTHCHomeScreen'
            : 'HTHCHomeScreen[$instanceName]',
      ),
    );
  }
}

class SMHomeScreenState extends SMBaseWidgetState<SMHomeScreenController> {
  SMHomeScreenState({
    required super.instanceName,
    required super.controller,
  });

  Widget get loadingIndicator => SpinKitFadingCircle(
        size: 50.r,
        color: SMColors.blue1,
      );

  Widget get getBody => Container();

  @override
  Widget build(BuildContext context) {
    return mainBuilder(
      (context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Lưu giữ ký ức',
            style: themeService.appBarTitleTextStyle,
          ),
          centerTitle: true,
          // Centers the title
          backgroundColor: Colors.transparent,
          // Transparent to show gradient
          elevation: 0,
          // Remove shadow for a clean look
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: themeService.memoryScreenGradientTheme,
            ),
          ),
        ),
        body: SafeArea(
          child: getBody,
        ),
        backgroundColor: Color(0xFFecf1fa),
      ),
      onGetServicesDone: () => controller.getData(),
    );
  }
}
