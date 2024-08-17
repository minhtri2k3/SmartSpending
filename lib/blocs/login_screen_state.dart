import 'package:equatable/equatable.dart';


abstract class LoginScreenState extends Equatable{
  const LoginScreenState();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoginScreenEventLoading extends LoginScreenState{}
class LoginScreenEventSuccess extends LoginScreenState{}
class LoginScreenEventFailure extends LoginScreenState{}
