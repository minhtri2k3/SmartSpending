import '../core/export.dart';

part 'sm_plan_screen.g.dart';

const String IMPORTANT_TYPE = 'important';
const String OPTION_TYPE = 'option';

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
  String dateTransfer = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @observable
  DateTime _selectedDate = DateTime.now();

  @action
  void updateDateTransfer() =>
      dateTransfer = DateFormat('yyyy-MM-dd').format(_selectedDate);

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

  final SMDatabaseService databaseService = SMDatabaseService();

  void displayTextInputDialog() async {
    // return showDa
  }

  Widget get loadingIndicator => SpinKitFadingCircle(
        size: 50.r,
        color: SMColors.blue1,
      );

  Widget get spacer => SizedBox(height: 20.h);

  Widget get calendarContainer => SliverToBoxAdapter(
        child: Container(
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
        ),
      );

  Widget get addButton => GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF77dd77),
            borderRadius: BorderRadius.circular(10.r),
          ),
          height: 30.h,
          width: 30.w,
          child: Icon(Icons.add),
        ),
        onTap: () {
          SMTodo todo = SMTodo(
            task: "Test",
            isDone: false,
            type: 'normal',
          );
          controller.updateDateTransfer();
          databaseService.addTodo(todo, controller.dateTransfer);
        },
      );

  Widget get removeButton => GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFffb3ba),
            borderRadius: BorderRadius.circular(10.r),
          ),
          height: 30.h,
          width: 30.w,
          child: Icon(Icons.remove),
        ),
        onTap: () {
          SMTodo todo = SMTodo(
            task: "Test",
            isDone: true,
            type: 'normal',
          );
          controller.updateDateTransfer();
          databaseService.addTodo(todo, controller.dateTransfer);
        },
      );

  Widget get dragIcon => Icon(Icons.menu);

  Widget taskContainer(SMTodo todo) {
    Color statusColor = Colors.red;
    Color statusBackgroundColor = Color(0xFFff9a9a);
    Icon statusIcon = Icon(
      Icons.dangerous,
      color: statusColor,
    );
    Icon kindIcon = Icon(
      Icons.fact_check,
      color: Colors.amber,
      size: 55.sp,
    );
    if (todo.isDone) {
      statusColor = Colors.green;
      statusBackgroundColor = Color(0xFFc1e1c1);
      statusIcon = Icon(
        Icons.check_circle,
        color: statusColor,
      );
    }
    if (todo.task == IMPORTANT_TYPE) kindIcon = Icon(Icons.star);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: statusColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          kindIcon,
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                todo.task,
                style: themeService.taskTextStyle,
              ),
              Text("Time"),
            ],
          ),
          Expanded(child: Container()),
          Container(
            width: 50.w,
            height: 35.h,
            decoration: BoxDecoration(
              color: statusBackgroundColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(color: statusColor),
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white54.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(0, 5), // Slightly lifted effect
                ),
              ],
            ),
            child: SizedBox(
              height: 10.h,
              width: 10.w,
              child: statusIcon,
            ),
          ),
        ],
      ),
    );
  }

  Widget messageListView() {
    String chosenDay =
        DateFormat('yyyy-MM-dd').format(controller._selectedDate);
    return StreamBuilder(
      stream: databaseService.getTodosByDay(chosenDay),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        List todos = snapshot.data?.docs ?? [];
        if (todos.isEmpty) {
          return SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              decoration: BoxDecoration(
                color: themeService.calendarColor.withOpacity(0.7),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                ),
              ),
              child: Text(
                'No schedule for today',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        return SliverToBoxAdapter(
          child: Container(
            decoration: BoxDecoration(
              color: themeService.calendarColor.withOpacity(0.7),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r), // Rounded bottom left
                bottomRight: Radius.circular(20.r), // Rounded bottom right
              ),
            ),
            height: 300.h, // Set total height for the list
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                List<Map<String, dynamic>> sortedTodos = todos
                    .map((doc) => doc.data() as Map<String, dynamic>)
                    .toList();

                // Sort: Pending (isDone = false) first, Completed (isDone = true) last
                sortedTodos.sort((a, b) {
                  int aDone =
                      (a['isDone'] ?? false) ? 1 : 0; // Convert bool to int
                  int bDone = (b['isDone'] ?? false) ? 1 : 0;
                  return aDone - bDone; // false (0) first, true (1) last
                });

                SMTodo todo = SMTodo.fromJson(sortedTodos[index]);
                String todoId = todos[index].id;

                return Padding(
                  padding: EdgeInsets.all(10.r),
                  child: taskContainer(todo),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget get addAndRemoveRow => Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            addButton,
            dragIcon,
            removeButton,
          ],
        ),
      );

  Widget get planDivider => Container(
        height: 0.3.h,
        color: Colors.black,
      );

  Widget get planContainer => SliverToBoxAdapter(
        child: Container(
          decoration: BoxDecoration(
            color: themeService.calendarColor.withOpacity(0.7),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Column(
            children: [
              addAndRemoveRow,
              planDivider,
            ],
          ),
        ),
      );

  Widget get getBody => Padding(
        padding: EdgeInsets.all(20.r),
        child: CustomScrollView(
          slivers: [
            calendarContainer,
            SliverToBoxAdapter(
              child: spacer,
            ),
            planContainer,
            messageListView(),
            SliverToBoxAdapter(
              child: SizedBox(height: 100.h),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return mainBuilder(
      (context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Schedule',
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
