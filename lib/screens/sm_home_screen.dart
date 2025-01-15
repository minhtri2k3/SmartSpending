import '../core/export.dart';

part 'sm_home_screen.g.dart';

class SMHomeScreenController = _SMHomeScreenController
    with _$SMHomeScreenController;

abstract class _SMHomeScreenController extends SMBaseController with Store {
  final PagingController<int, SMMemory> pagingController =
      PagingController(firstPageKey: 1);

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

  late final ValueNotifier<int> activeIndex;

  @override
  void initState() {
    controller.pagingController.addPageRequestListener(
      (pageKey) => fetchPage(controller.pagingController, pageKey),
    );
    activeIndex =
        ValueNotifier<int>(0); // Initialize the activeIndex for this slider
    super.initState();
  }

  @override
  void dispose() {
    controller.pagingController.dispose();
    activeIndex
        .dispose(); // Dispose the ValueNotifier when the widget is removed
    super.dispose();
  }

  Future<void> fetchPage(
    PagingController<int, SMMemory> pagingController,
    int pageKey,
  ) async {
    try {
      final int currentPage = 1;
      final int lastPage = 1;
      final bool isLastPage = currentPage == lastPage;
      final List<SMMemory> newItems = memories;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final int nextPageKey = currentPage + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } on DioException catch (error, stackTrace) {
      // controller.onApiException(error, stackTrace);
    } catch (error, stackTrace) {
      logger.e(
        error,
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Widget get loadingIndicator => SpinKitFadingCircle(
        size: 50.r,
        color: SMColors.blue1,
      );

  Widget memoryPictureContainer(List<String> images) => Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              child: Container(
                height: 335.h,
                width: 255.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24.r)),
                  color: themeService.memoryLastStackColor,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x4A27140D).withOpacity(
                          0.1), // Shadow color with the same color code
                      offset: Offset(0, 10), // 0px horizontal, 10px vertical
                      blurRadius: 30, // 30px blur radius
                      spreadRadius: 0,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: 320.h,
                width: 315.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24.r)),
                  color: themeService.memorySecondStackColor,
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: 300.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(24.r)),
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: 220.h,
                decoration: BoxDecoration(
                  gradient: themeService.memoryThemeGradient,
                  borderRadius: BorderRadius.all(Radius.circular(24.r)),
                ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 300.h,
                viewportFraction: 1.0,
                // Full width slides
                enlargeCenterPage: true,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  activeIndex.value = index; // Update the ValueNotifier
                },
              ),
              items: images.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Positioned(
              bottom: 50.h,
              child: ValueListenableBuilder<int>(
                valueListenable: activeIndex,
                builder: (context, value, child) {
                  return AnimatedSmoothIndicator(
                    activeIndex: value,
                    count: images.length,
                    effect: ScrollingDotsEffect(
                      dotWidth: 6.w,
                      dotHeight: 6.r,
                      activeDotColor: Colors.white,
                      dotColor: Colors.white.withOpacity(0.7),
                    ),
                  );
                },
              ),
            ),
            // Counter Indicator (e.g., "5/10")
            Positioned(
              bottom: 50.h,
              right: 20.w,
              child: ValueListenableBuilder<int>(
                valueListenable: activeIndex,
                builder: (context, value, child) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Text(
                      '${value + 1}/${images.length}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );

  Widget get spacer => SizedBox(height: 20.h);

  Widget get dashLine => Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: themeService.memoryScreenGradientTheme,
          ),
          height: 30.h,
          child: DottedLine(
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            lineLength: double.infinity,
            lineThickness: 3.0.w,
            dashLength: 3.0.h,
            dashColor: Colors.transparent,
          ),
        ),
      );

  Widget memoryContent(SMMemory memory) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20.r), // Border radius of 20.r
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              memory.name,
              style: themeService.restaurantNameTextStyle,
            ),
            Text(
              memory.date,
              style: themeService.restaurantTitleTextStyle,
            ),
            Text(
              memory.description,
              style: themeService.restaurantContentTextStyle,
            ),
          ],
        ),
      );

  Widget itemBuilder(
    BuildContext context,
    SMMemory item,
    int index,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        memoryContent(item),
        dashLine,
        memoryPictureContainer(item.images),
      ],
    );
  }

  Widget get getBody => Padding(
        padding: EdgeInsets.all(20.r),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: spacer,
            ),
            PagedSliverList.separated(
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<SMMemory>(
                itemBuilder: itemBuilder,
              ),
              separatorBuilder: (context, index) => Container(),
            ),
          ],
        ),
      );

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
