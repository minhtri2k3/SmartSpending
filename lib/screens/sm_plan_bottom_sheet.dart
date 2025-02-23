import '../core/export.dart';

part 'sm_plan_bottom_sheet.g.dart';

class SMPlanBottomSheetController = _SMPlanBottomSheetController
    with _$SMPlanBottomSheetController;

abstract class _SMPlanBottomSheetController extends SMBaseController
    with Store {
  // final PagingController<int, SMMemory> pagingController =
  // PagingController(firstPageKey: 1);

  @observable
  bool loading = true;

  @observable
  Widget? loadingIndicator;

  // @observable
  // DateTime _selectedDate = DateTime.now();

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

class SMPlanBottomSheet extends SMBaseWidget<SMPlanBottomSheetState> {
  const SMPlanBottomSheet({
    super.key,
    required super.state,
  });

  static SMPlanBottomSheet create({
    Key? key,
    String? instanceName,
  }) {
    final SMPlanBottomSheetController controller =
        SMPlanBottomSheetController();
    return SMPlanBottomSheet(
      state: SMPlanBottomSheetState(
        controller: controller,
        instanceName: instanceName == null
            ? 'SMPlanBottomSheet'
            : 'SMPlanBottomSheet[$instanceName]',
      ),
    );
  }
}

class SMPlanBottomSheetState
    extends SMBaseWidgetState<SMPlanBottomSheetController> {
  SMPlanBottomSheetState({
    required super.instanceName,
    required super.controller,
  });

  Widget get loadingIndicator => SpinKitFadingCircle(
        size: 50.r,
        color: SMColors.blue1,
      );

  Widget get spacer => SizedBox(height: 20.h);

  Widget get getBody => Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return mainBuilder(
      (context) => Scaffold(),
      onGetServicesDone: () => controller.getData(),
    );
  }
}
