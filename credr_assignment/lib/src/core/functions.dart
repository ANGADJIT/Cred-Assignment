import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hexcolor/hexcolor.dart';

// class for common functions
class Functions {
  /// Shows snackbar with error message
  static showErrorSnackbar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('error: $errorMessage')));
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
}
