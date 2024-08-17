import 'package:equatable/equatable.dart';

abstract class LoginScreenEvent extends Equatable {
  const LoginScreenEvent();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoginScreenButtonPressed extends LoginScreenEvent {
  final String email;
  final String password;
  const LoginScreenButtonPressed({required this.email, required this.password});
  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}
