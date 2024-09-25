
import '../core/export.dart';

part 'sm_home_screen.g.dart';

class SMHomeScreenController = _SMHomeScreenController
    with _$SMHomeScreenController;

abstract class _SMHomeScreenController extends SMBaseController with Store{
  @observable
  bool loading = true;

  @action
  void setLoading(bool loading_) => loading = loading_;

  @action
  Future<void> getData() async{
    try{

    } on DioException catch (error, stackTrace) {
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
  const SMHomeScreen({super.key, required super.state,});


  static SMHomeScreen create({
    Key? key,
    String? instanceName,
  }) {
    final SMHomeScreenController controller =
    SMHomeScreenController();
    return SMHomeScreen(
      state: SMHomeScreenState(
        controller: controller,
      ),
    );
  }
}
class SMHomeScreenState  extends SMBaseWidgetState<SMHomeScreenController>{
    SMHomeScreenState({ required super.controller,});


  @override
  Widget build(BuildContext context) {
     return mainBuilder(
         (context) => Scaffold(
           backgroundColor: Colors.white,
           body: SafeArea(child: Container(
             width: double.infinity,
             height: double.infinity,
             color: SMColors.white1,
             child : SingleChildScrollView(
               child: Column(
                 
               ),
             )
           ),
           ),
         ),
       onGetServicesDone: () => controller.getData(),
     );
  }}

