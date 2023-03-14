import 'package:flutter/material.dart';
import 'package:smart_house/features/auth/login_navigator.dart';

import 'login_interactor.dart';
import 'login_ui.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> implements LoginInteractor {
  @override
  Widget build(BuildContext context) {
    return LoginUI(this);
  }

  @override
  void loginWithMobile(String isoCode, String mobileNumber) {
    Navigator.pushNamed(context, LoginRoutes.registration,
        arguments: isoCode + mobileNumber);
  }

  @override
  void loginWithFacebook() {
    Navigator.pushNamed(context, LoginRoutes.registration, arguments: '');
  }

  @override
  void loginWithGoogle() {
    Navigator.pushNamed(context, LoginRoutes.registration, arguments: '');
  }
}
