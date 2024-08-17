enum Formstatus { initial, pending, success, error }

class AuthenticationState {
  final String username;
  final String password;
  final Formstatus formstatus;
  final String errormsg;
  // googo
  AuthenticationState(this.username, this.password, this.formstatus, this.errormsg);

}
