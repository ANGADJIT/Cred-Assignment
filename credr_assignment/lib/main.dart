import 'package:credr_assignment/src/presentation/pages/signin_page.dart';
import 'package:credr_assignment/src/presentation/pages/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';

/// Project Details
/// Flutter Version : [3.0.5]
/// IDE used: [VS CODE]

void main() async {
  // initialization of firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const CredRAssignment());
}

// root page of app
class CredRAssignment extends StatelessWidget {
  const CredRAssignment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CredR Assignment',
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GoogleFonts.notoSans().fontFamily!),
      home: SignIn(),
    );
  }
}
