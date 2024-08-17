import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  final _auth = FirebaseAuth.instance;
  Future<User?> createUsernamePassword(String email , String password) async {
    try{
         final userFound = await _auth.createUserWithEmailAndPassword(email: email, password: password);
         return userFound.user;
    }on FirebaseException catch(e ){
          if(e.code =='weak-password'){
              print('It is  weak password');
          }else if(e.code == 'email-already-in-use'){
             print('The account is already use');
          }
    }
    return null;

  }
}