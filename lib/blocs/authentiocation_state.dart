enum Formstatus { initial, pending, success, error }

class AuthenticationState {
  final String username;
  final String password;
  final Formstatus status;
  final String errormsg;
  AuthenticationState(
      {required this.username,
      required this.password,
      required this.status,
      required this.errormsg});
  AuthenticationState copyWith({
    String? username,
    String? password,
    Formstatus? status,
    String? errormsg,
  }) =>
      AuthenticationState(
          username: username ?? this.username,
          password: password ?? this.password,
          status: status ?? this.status,
          errormsg: errormsg ?? this.errormsg);
}
