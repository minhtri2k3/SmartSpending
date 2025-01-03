import '../core/export.dart';

part 'sm_restaurants_screen.g.dart';

class SMRestaurantsScreenController = _SMRestaurantsScreenController
    with _$SMRestaurantsScreenController;

abstract class _SMRestaurantsScreenController extends SMBaseController
    with Store {
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

  @action
  Future<void> getImage(ImageSource imageSource) async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(source: imageSource);
    if (image == null) return;
    showLoadingIndicator();
  }
}

class SMRestaurantsScreen extends SMBaseWidget<SMRestaurantsScreenState> {
  const SMRestaurantsScreen({
    super.key,
    required super.state,
  });

  static SMRestaurantsScreen create({
    Key? key,
    String? instanceName,
  }) {
    final SMRestaurantsScreenController controller =
        SMRestaurantsScreenController();
    return SMRestaurantsScreen(
      state: SMRestaurantsScreenState(
        controller: controller,
        instanceName: instanceName == null
            ? 'SMRestaurantScreen'
            : 'SMRestaurantScreen[$instanceName]',
      ),
    );
  }
}

class SMRestaurantsScreenState
    extends SMBaseWidgetState<SMRestaurantsScreenController> {
  SMRestaurantsScreenState({
    required super.instanceName,
    required super.controller,
  });

  Widget get loadingIndicator => SpinKitFadingCircle(
        size: 50.r,
        color: SMColors.blue1,
      );

  Widget get getBody => SafeArea(child: Container());

  @override
  Widget build(BuildContext context) {
    return mainBuilder(
      (context) => Scaffold(
        backgroundColor: Colors.black.withOpacity(0.7),
        body: getBody,
      ),
      onGetServicesDone: () => controller.getData(),
    );
  }
}
