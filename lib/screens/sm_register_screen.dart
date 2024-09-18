import 'package:flutter/cupertino.dart';

import '../core/export.dart';
import '../core/mixins.dart';
import '../services/sm_auth_service.dart';

class SMRegisterScreen extends StatelessWidget with SMServices {
  SMRegisterScreen({super.key}) {
    getServicesFuture = getServices();
  }
  late final Future getServicesFuture;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200.sp,
        flexibleSpace: Container(
          decoration: _gradientBox,
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Register your new',
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
                'Register your new account',
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
                _registerButton,
                _registerText,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _emailTextField {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.sp),
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
      padding: EdgeInsets.only(bottom: 40.sp),
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

  Widget get _registerButton {
    return Padding(
      padding: EdgeInsets.only(bottom: 40.sp),
      child: Container(
        width: 1000.w,
        decoration: BoxDecoration(
          color: Colors.lightGreen, // Set the background color to green
          borderRadius:
              BorderRadius.circular(8.0), // Add border radius if needed
        ),
        child: TextButton(
          onPressed: () => SMAuthService().register(
              email: _emailController.text, password: _passwordController.text),
          child: Text(
            'Register',
            style: TextStyle(
              fontSize: 23.sp,
              fontWeight: FontWeight.bold,
              color:
                  Colors.white, // Set text color to white for better contrast
            ),
          ),
        ),
      ),
    );
  }

  Widget get _registerText {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: TextStyle(fontSize: 17.5.sp, color: Colors.grey),
        ),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: () {
            router.push('/login');
          },
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 17.5.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
