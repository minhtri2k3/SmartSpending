import 'package:image_picker/image_picker.dart';

import '../core/export.dart';

part 'sm_home_screen.g.dart';

class SMHomeScreenController = _SMHomeScreenController
    with _$SMHomeScreenController;

abstract class _SMHomeScreenController extends SMBaseController with Store {
  @observable
  bool loading = true;

  @action
  void setLoading(bool loading_) => loading = loading_;

  @action
  Future<void> getData() async {
    try {} on DioException catch (error, stackTrace) {
      // onApiException(error, stackTrace);
    } catch (error, stackTrace) {
      // logger.e(
      //   error,
      //   error: error,
      //   stackTrace: stackTrace,
      // );
    }
  }

  @action
  Future<void> getImage(ImageSource imageSource) async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(source: imageSource);
    if (image == null) return;
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
                            height: 250.h,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://i.imgur.com/1tMFzp8.png'),
                                fit: BoxFit.cover,
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
                                    'Titles',
                                    style: themeService.titleHomeTextStyle,
                                  ),
                                ),
                                Container(
                                  margin: themeService.leftHomeInsets,
                                  child: Text(
                                    'Subtitles',
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
                                                borderRadius: BorderRadius.circular(
                                                    8) // Rounded corners if needed
                                                ),
                                            alignment: Alignment.center,
                                            child: buttonInfo(
                                              Icons.filter,
                                              'Filter',
                                            ), // Plus Icon
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
