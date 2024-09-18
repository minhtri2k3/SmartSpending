import '../core/export.dart';

class SMAuthService{
  Future<void> register({required String email , required String password})async {
    try{
       await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      String message = '';
      if(e.code =='email-already-in-use'){
        message = 'Your account has already existed.';

      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 14.sp,
      );
    }
  }
  Future<void> login({required String email , required String password})async {
    try{
       await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException{
      String message ='Wrong password or username';
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 14.sp,
      );
    }
  }
}