import 'package:flutter/material.dart';

class SMLoginScreen extends StatelessWidget {
  SMLoginScreen({super.key});
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 170,
        flexibleSpace: Container(
          decoration: _gradientBox,
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign in to your',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Sign in to your account',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                _emailTextField,
                _passwordTextField,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _emailTextField {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: _emailController,
        cursorColor: Colors.black,
        cursorHeight: 25,
        decoration: InputDecoration(
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(Icons.email_outlined),
          ),
          prefixIconColor: Colors.grey,
          labelText: 'Email',
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.grey, // Set the border color for the enabled state
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.grey, // Set the border color for the focused state
              width: 1.5,
            ),
          ),
        ),
        // style: const TextStyle(
        //   fontWeight: FontWeight.w500,
        //   color: Colors.black,
        // ),
      ),
    );
  }

  Widget get _passwordTextField {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: TextFormField(
        obscureText: true,
        controller: _passwordController,
        cursorColor: Colors.black,
        cursorHeight: 25,
        decoration: InputDecoration(
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(Icons.password_rounded),
          ),
          prefixIconColor: Colors.grey,
          labelText: 'Password',
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.grey, // Set the border color for the enabled state
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.grey, // Set the border color for the focused state
              width: 1.5,
            ),
          ),
        ),
        // style: const TextStyle(
        //   fontWeight: FontWeight.w500,
        //   color: Colors.black,
        // ),
      ),
    );
  }

  Decoration get _gradientBox {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xff1E2E3D),
          Color(0xff152534),
          Color(0xff0C1C2E)
        ], // Replace with your desired colors
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }
  // Widget get _loginButton {
  //   return TextButton(onPressed: , child: Text('Login'));
  // }
}
