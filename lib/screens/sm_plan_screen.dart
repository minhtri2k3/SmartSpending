import '../core/export.dart';

part 'sm_plan_screen.g.dart';

class SMPlanScreenController = _SMPlanScreenController
    with _$SMPlanScreenController;

abstract class _SMPlanScreenController extends SMBaseController with Store {
  final PagingController<int, SMMemory> pagingController =
      PagingController(firstPageKey: 1);

  @observable
  bool loading = true;

  @observable
  Widget? loadingIndicator;

  @observable
  DateTime _selectedDate = DateTime.now();

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

class SMPlanScreen extends SMBaseWidget<SMPlanScreenState> {
  const SMPlanScreen({
    super.key,
    required super.state,
  });

  static SMPlanScreen create({
    Key? key,
    String? instanceName,
  }) {
    final SMPlanScreenController controller = SMPlanScreenController();
    return SMPlanScreen(
      state: SMPlanScreenState(
        controller: controller,
        instanceName: instanceName == null
            ? 'SMPlanScreen'
            : 'SMPlanScreen[$instanceName]',
      ),
    );
  }
}

class SMPlanScreenState extends SMBaseWidgetState<SMPlanScreenController> {
  SMPlanScreenState({
    required super.instanceName,
    required super.controller,
  });

  Widget get loadingIndicator => SpinKitFadingCircle(
        size: 50.r,
        color: SMColors.blue1,
      );

  Widget get spacer => SizedBox(height: 20.h);

  Widget get calendarContainer => Container(
        decoration: BoxDecoration(
          color: themeService.calendarColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: TableCalendar(
          focusedDay: controller._selectedDate,
          firstDay: DateTime.utc(2025, 1, 1),
          lastDay: DateTime.utc(2030, 1, 1),
          calendarFormat: CalendarFormat.month,
          selectedDayPredicate: (day) =>
              isSameDay(day, controller._selectedDate),
          onDaySelected: (selectedDay, focusedDay) {
            if (selectedDay.day == 21) {}
            setState(() {
              controller._selectedDate = selectedDay;
            });
          },
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              if (day.day == 21) {
                return Container(
                  height: 40.h,
                  width: 40.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: themeService.markedDayColor,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${day.day}',
                    style: themeService.specialDayTextStyle,
                  ),
                );
              }
              return null;
            },
          ),
        ),
      );

  Widget get addButton => GestureDetector();

  Widget get removeButton => GestureDetector();

  Widget get planContainer => Container(
        decoration: BoxDecoration(
          color: themeService.calendarColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [],
            ),
          ],
        ),
      );

  Widget get getBody => Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [
            calendarContainer,
            spacer,
            planContainer,
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return mainBuilder(
      (context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Lịch trình đi chơi',
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
