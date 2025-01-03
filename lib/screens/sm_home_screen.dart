import 'dart:io';

import '../core/export.dart';

part 'sm_home_screen.g.dart';

class SMHomeScreenController = _SMHomeScreenController
    with _$SMHomeScreenController;

abstract class _SMHomeScreenController extends SMBaseController with Store {
  @observable
  bool loading = true;

  @observable
  int activeIndex = 0;

  @observable
  Widget? loadingIndicator;

  @observable
  CropController? portraitCropController;

  @observable
  Uint8List? portrait;

  @observable
  Widget? portraitCropDialog;

  @observable
  Widget? portraitCropButtons;

  @action
  void setLoading(bool loading_) => loading = loading_;

  @action
  void showLoadingIndicator() =>
      loadingIndicator = themeService.loadingIndicator;

  @action
  void hideLoadingIndicator() => loadingIndicator = null;

  @action
  void hidePortraitCropDialog() {
    portraitCropDialog = null;
    portraitCropController = null;
  }

  @action
  void hidePortraitCropButtons() => portraitCropButtons = null;

  @action
  void showPortraitCropButtons() {
    if (portraitCropController == null) return;
    hideLoadingIndicator();
    portraitCropButtons = SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SMButton.create(
                instanceName: 'CropCancel',
                width: 150.w,
                title: 'HỦY',
                onTap: () {
                  hidePortraitCropButtons();
                  hidePortraitCropDialog();
                },
              ),
              const Expanded(child: SizedBox()),
              SMButton.create(
                instanceName: 'CropSubmit',
                width: 150.w,
                title: 'XONG',
                onTap: () => portraitCropController!.crop(),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
    showPortraitCropDialog(await image.readAsBytes());
  }

  @action
  void showPortraitCropDialog(Uint8List image) {
    portraitCropController = CropController();
    portraitCropDialog = Stack(
      children: [
        Crop(
          image: image,
          controller: portraitCropController,
          withCircleUi: true,
          maskColor: themeService.cropDialogMaskColor,
          baseColor: themeService.cropDialogBaseColor,
          onStatusChanged: (status) {
            switch (status) {
              case CropStatus.cropping:
                showLoadingIndicator();
                break;
              case CropStatus.ready:
                showPortraitCropButtons();
                break;
              default:
                break;
            }
          },
          onCropped: (image) {
            portrait = image;
            hideLoadingIndicator();
            hidePortraitCropButtons();
            hidePortraitCropDialog();
            // updatePortrait(image);
          },
        ),
        Observer(
          builder: (context) => Offstage(
            offstage: portraitCropButtons == null,
            child: portraitCropButtons,
          ),
        ),
      ],
    );
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
  XFile? _pickedImage;
  SMHomeScreenState({
    required super.instanceName,
    required super.controller,
  });

  Widget get loadingIndicator => SpinKitFadingCircle(
        size: 50.r,
        color: SMColors.blue1,
      );

  Widget buttonInfo(IconData icon, String text) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween, // Space between Icon and Text
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 10.sp,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 10.sp,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10.sp),
          child: Text(
            text,
            style: themeService.buttonTextStyle,
          ),
        ),
      ],
    );
  }

  Widget get imageMemory => CarouselSlider(
        items: [
          'images/home.jpg',
          'images/picture1.jpg',
          'images/picture2.jpg',
        ].map((imagePath) {
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
        options: CarouselOptions(
          height: 300.h,
          viewportFraction: 1.0,
          // Full width slides
          enlargeCenterPage: true,
          autoPlay: true,
          onPageChanged: (index, reason) {
            setState(() {
              controller.activeIndex = index;
            });
          },
        ),
      );

  Widget get memoryContainer => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120.sp,
          ),
          Container(
            margin: themeService.leftHomeInsets,
            child: Text(
              'Kỷ niệm',
              style: themeService.titleHomeTextStyle,
            ),
          ),
          Container(
            margin: themeService.leftHomeInsets,
            child: Text(
              'Nơi lưu dữ kỷ niệm',
              style: themeService.subtitleHomeTextStyle,
            ),
          ),
          SizedBox(
            height: 8.sp,
          ),
          Row(
            children: [
              // Left Button (Minus Icon)
              Expanded(
                child: Container(
                  height: 50.h,
                  margin:
                      themeService.leftHomeInsets, // Adjust margin as needed
                  padding: EdgeInsets.symmetric(
                      vertical:
                          8.sp), // Optional: Add padding inside the button
                  child: GestureDetector(
                    onTap: () {
                      // Handle Minus Button Tap
                      _pickedImage;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: themeService
                            .blackGradientTheme, // Button background color
                        borderRadius: BorderRadius.circular(
                            8) // Rounded corners if needed
                        ,
                      ),
                      // alignment: Alignment.center,
                      child: buttonInfo(
                        Icons.calendar_month_outlined,
                        'Add memory',
                      ), // Minus Icon
                    ),
                  ),
                ),
              ),

              // Right Button (Plus Icon)
              SizedBox(
                width: 40.sp,
              ),
              Expanded(
                child: Container(
                  height: 50.h,
                  margin:
                      themeService.rightHomeInsets, // Adjust margin as needed
                  padding: EdgeInsets.symmetric(
                    vertical: 8.sp,
                  ), // Optional: Add padding inside the button
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                            gradient: themeService
                                .blackGradientTheme, // Button background color
                            borderRadius: BorderRadius.circular(
                                8) // Rounded corners if needed
                            ),
                        alignment: Alignment.center,
                        child: GestureDetector(
                          child: buttonInfo(
                            Icons.image_outlined,
                            'Change image',
                          ),
                          onTap: () {
                            _pickedImage;
                          },
                        ) // Plus Icon
                        ),
                  ),
                ),
              ),
            ],
          )
        ],
      );

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = XFile(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return mainBuilder(
      (context) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: SMColors.white1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFFEF7FF),
                    ),
                    width: double.infinity,
                    height: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 300.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                image: _pickedImage != null
                                    ? FileImage(File(
                                        _pickedImage!.path)) // Use picked image
                                    : const AssetImage("images/home.png")
                                        as ImageProvider,
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 120.sp,
                                ),
                                Container(
                                  margin: themeService.leftHomeInsets,
                                  child: Text(
                                    'Kỷ niệm',
                                    style: themeService.titleHomeTextStyle,
                                  ),
                                ),
                                Container(
                                  margin: themeService.leftHomeInsets,
                                  child: Text(
                                    'Nơi lưu dữ kỷ niệm',
                                    style: themeService.subtitleHomeTextStyle,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.sp,
                                ),
                                Row(
                                  children: [
                                    // Left Button (Minus Icon)
                                    Expanded(
                                      child: Container(
                                        height: 50.h,
                                        margin: themeService
                                            .leftHomeInsets, // Adjust margin as needed
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8
                                                .sp), // Optional: Add padding inside the button
                                        child: GestureDetector(
                                          onTap: () {
                                            // Handle Minus Button Tap
                                            _pickedImage;
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              gradient: themeService
                                                  .blackGradientTheme, // Button background color
                                              borderRadius: BorderRadius.circular(
                                                  8) // Rounded corners if needed
                                              ,
                                            ),
                                            // alignment: Alignment.center,
                                            child: buttonInfo(
                                              Icons.calendar_month_outlined,
                                              'Add memory',
                                            ), // Minus Icon
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Right Button (Plus Icon)
                                    SizedBox(
                                      width: 40.sp,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 50.h,
                                        margin: themeService
                                            .rightHomeInsets, // Adjust margin as needed
                                        padding: EdgeInsets.symmetric(
                                          vertical: 8.sp,
                                        ), // Optional: Add padding inside the button
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  gradient: themeService
                                                      .blackGradientTheme, // Button background color
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8) // Rounded corners if needed
                                                  ),
                                              alignment: Alignment.center,
                                              child: GestureDetector(
                                                child: buttonInfo(
                                                  Icons.image_outlined,
                                                  'Change image',
                                                ),
                                                onTap: () {
                                                  _pickedImage;
                                                },
                                              ) // Plus Icon
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Center(
                            child: Text(
                              'Hello',
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onGetServicesDone: () => controller.getData(),
    );
  }
}
