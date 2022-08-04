import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hexcolor/hexcolor.dart';

// class for common functions
class Functions {
  /// Shows snackbar with error message
  static showErrorSnackbar(BuildContext context, String errorMessage,
      {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(isError ? 'error: $errorMessage' : errorMessage)));
  }

  // Shows loading with custom indicator and custom status
  static void showLoading(String status) {
    EasyLoading.show(
        indicator: CircularProgressIndicator(
          backgroundColor: HexColor('#6266b9'),
          color: HexColor('#FFFFFF'),
        ),
        status: status);
  }

  // This function used to validate input of sign in
  static bool validateSignIn(
      {required BuildContext context,
      required String email,
      required String password}) {
    if (email.isEmpty || password.isEmpty) {
      showErrorSnackbar(context, 'fields required');
      return false;
    }

    return true;
  }

  static bool validSignUp(
      {required BuildContext context,
      required String email,
      required String password,
      required String confirmPassword}) {
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      showErrorSnackbar(context, 'fields required');
      return false;
    } else if (password != confirmPassword) {
      showErrorSnackbar(context, 'passwords doesn\'t match');
      return false;
    }

    return true;
  }

  // check email before reset the password
  static bool validateResetPasswordInput(BuildContext context, String email) {
    bool emailVaild = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);

    if (email.isEmpty) {
      showErrorSnackbar(context, 'email required');
    }

    if (emailVaild == false) {
      showErrorSnackbar(context, 'enter a valid email');
    }

    return true;
  }
}
