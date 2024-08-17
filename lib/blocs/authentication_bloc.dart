import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'authentication_event.dart';
import 'authentiocation_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationBloc , AuthenticationState>{


  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // User? get currentUser => _firebaseAuth.currentUser;
  // Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  final FirebaseAuth firebaseAuth;
  AuthenticationBloc({required this.firebaseAuth}) :
        super(AuthenticationInitial()){
    on<AuthenticationStarted>(_onAuthenticationStarted);
  }

}