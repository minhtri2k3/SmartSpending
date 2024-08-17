import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable{
  const AuthenticationEvent();
   @override
  // TODO: implement props
  List<Object?> get props => [];

   @override
   String toString() => 'Event: ${runtimeType.toString()}';

}

class AuthenticationStarted extends AuthenticationEvent {}

class AuthenticationLoggedIn extends AuthenticationEvent {
}

class AuthenticationLoggedOut extends AuthenticationEvent {}
