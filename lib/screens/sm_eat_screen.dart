import '../core/export.dart';

part 'sm_eat_screen.g.dart';

class SMEatScreenController = _SMEatScreenController
    with _$SMEatScreenController;

abstract class _SMEatScreenController extends SMBaseController with Store {
  final PagingController<int, SMRestaurant> pagingController =
      PagingController(firstPageKey: 1);

  Future<String> uploadImage(String path, XFile image) async {
    try {
      final Reference ref = FirebaseStorage.instance.ref().child(path);

      final UploadTask uploadTask = ref.putFile(File(image.path));

      final TaskSnapshot snapshot = await uploadTask;

      final String downloadURL = await snapshot.ref.getDownloadURL();

      return downloadURL;
    } on FirebaseException catch (e) {
      throw Exception('Firebase error: ${e.message}');
    } on FormatException {
      throw Exception('Invalid file format.');
    } on PlatformException catch (e) {
      throw Exception('Platform error: ${e.message}');
    } catch (e) {
      throw Exception('Something went wrong: $e');
    }
  }

  Future<void> pickAndUploadImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      try {
        final String downloadURL =
            await uploadImage('uploads/${image.name}', image);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image uploaded successfully: $downloadURL')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Upload failed: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No image selected')),
      );
    }
  }
}

class SMEatScreen extends SMBaseWidget<SMEatScreenState> {
  const SMEatScreen({
    super.key,
    required super.state,
  });

  static SMEatScreen create({
    Key? key,
    String? instanceName,
  }) {
    final SMEatScreenController controller = SMEatScreenController();
    return SMEatScreen(
      state: SMEatScreenState(
        controller: controller,
        instanceName:
            instanceName == null ? 'SMEatScreen' : 'SMEatScreen[$instanceName]',
      ),
    );
  }
}

class SMEatScreenState extends SMBaseWidgetState<SMEatScreenController> {
  SMEatScreenState({
    required super.instanceName,
    required super.controller,
  });

  @override
  void initState() {
    controller.pagingController.addPageRequestListener(
      (pageKey) => fetchPage(controller.pagingController, pageKey),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.pagingController.dispose();
    super.dispose();
  }

  Future<void> fetchPage(
    PagingController<int, SMRestaurant> pagingController,
    int pageKey,
  ) async {
    try {
      final int currentPage = 1;
      final int lastPage = 1;
      final bool isLastPage = currentPage == lastPage;
      final List<SMRestaurant> newItems = restaurants;
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

  Widget get dashLine => Center(
        child: SizedBox(
          height: 30.h,
          child: DottedLine(
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            lineLength: double.infinity,
            lineThickness: 3.0.w,
            dashLength: 3.0.h,
            dashColor: Colors.white12,
          ),
        ),
      );

  Widget rateStar(int rate) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          5, // Total number of stars
          (index) => ShaderMask(
            shaderCallback: (Rect bounds) {
              return themeService.restaurantStarGradientTheme
                  .createShader(bounds);
            },
            child: Icon(
              index < rate ? Icons.star : Icons.star_border,
              color: Colors.white,
              size: 20.0.sp, // Size of the star
            ),
          ),
        ),
      ),
    );
  }

  Widget imageLoad(String path) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SizedBox(
          height: 300.h,
          width: double.infinity,
          child: Image.asset(
            path,
            fit: BoxFit.cover, // Adjust how the image fits inside the SizedBox
          ),
        ),
      );

  Widget itemContent(String title, String content) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: themeService.restaurantTitleTextStyle,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              content,
              style: themeService.restaurantContentTextStyle,
            ),
          ],
        ),
      );

  Widget favorContent(String title, String content) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: themeService.restaurantTitleTextStyle,
                ),
                spacer,
                spacer,
                spacer,
                Icon(
                  Icons.favorite,
                  color: themeService.heartFoodColor,
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              content,
              style: themeService.restaurantContentTextStyle,
            ),
          ],
        ),
      );

  Widget itemBuilder(
    BuildContext context,
    SMRestaurant item,
    int index,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFE4A0A7),
        border: Border.all(),
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: themeService.restaurantScreenGradientTheme,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        item.name,
                        style: themeService.restaurantNameTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            spacer,
            rateStar(item.rate!),
            spacer,
            imageLoad(item.image!),
            spacer,
            itemContent('Địa chỉ', item.address),
            spacer,
            item.favor != null
                ? favorContent('Vợ thích', item.favor ?? "")
                : Container(),
            spacer,
            itemContent('Ghi chú', item.note!),
          ],
        ),
      ),
    );
  }

  Widget get spacer => SizedBox(
        height: 10.h,
      );

  Widget get getBody => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: CustomScrollView(
          slivers: [
            PagedSliverList.separated(
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<SMRestaurant>(
                itemBuilder: itemBuilder,
              ),
              separatorBuilder: (context, index) => dashLine,
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return mainBuilder(
      (context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFE4A0B7),
          // Set your desired background color
          title: Text(
            'Eat what ?', // Replace with your title
            style: themeService.appBarTitleTextStyle,
          ),
          centerTitle: true,
          // Centers the title in the AppBar
          elevation: 4.0, // Adds a shadow below the AppBar
        ),
        backgroundColor: Color(0xFFF5DCE0),
        body: getBody,
      ),
    );
  }
}
