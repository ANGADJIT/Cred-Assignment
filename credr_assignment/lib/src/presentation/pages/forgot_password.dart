import 'package:credr_assignment/src/core/functions.dart';
import 'package:credr_assignment/src/core/responsive_model.dart';
import 'package:credr_assignment/src/logic/auth/auth.dart';
import 'package:credr_assignment/src/logic/auth/auth_excetion.dart';
import 'package:credr_assignment/src/presentation/pages/signup_page.dart';
import 'package:credr_assignment/src/presentation/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hexcolor/hexcolor.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);

  // editing controllers
  final TextEditingController _email = TextEditingController();

  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#cccdce'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                width: ResponsiveModel.getWidth(context, 1.0),
                height: ResponsiveModel.getHeight(context, .6),
                child: Image.asset(
                  'assets/images/doctor.jpg',
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.dstATop,
                  color: HexColor('#FFFFFF').withOpacity(.2),
                ),
              ),

              // blue ball
              Positioned.fill(
                left: -300,
                top: -200,
                right: 50,
                child: Container(
                  padding: EdgeInsets.only(
                      right: ResponsiveModel.getWidth(context, .02)),
                  height: ResponsiveModel.getHeight(context, .8),
                  width: ResponsiveModel.getHeight(context, 1.0),
                  decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          HexColor('#6065ba').withOpacity(.5),
                          HexColor('#6065ba').withOpacity(.7),
                          HexColor('#6065ba').withOpacity(.9),
                          HexColor('#6065ba')
                        ],
                      ),
                      shape: BoxShape.circle),
                ),
              ),

              /// form sign in
              Padding(
                padding: EdgeInsets.only(
                    left: ResponsiveModel.getWidth(context, .08),
                    top: ResponsiveModel.getHeight(context, .1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Reset Password',
                      style: TextStyle(
                          color: HexColor('#FFFFFF'),
                          fontSize: ResponsiveModel.getWidth(context, .08),
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: ResponsiveModel.getHeight(context, .01)),
                      child: Text(
                        'Enter email to reset your password',
                        style: TextStyle(
                          color: HexColor('#FFFFFF'),
                        ),
                      ),
                    ),

                    // form box
                    Padding(
                      padding: EdgeInsets.only(
                          top: ResponsiveModel.getHeight(context, .07),
                          left: ResponsiveModel.getWidth(context, .1)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: ResponsiveModel.getHeight(context, .0853),
                            width: ResponsiveModel.getWidth(context, .75),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  ResponsiveModel.getWidth(context, .03)),
                              color: HexColor('#FFFFFF').withOpacity(.7),
                            ),
                            child: Column(
                              children: [
                                TextField(
                                  controller: _email,
                                  cursorColor: HexColor('#000000'),
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                          color: HexColor('#b0b1b0'),
                                          fontSize: ResponsiveModel.getWidth(
                                              context, .035)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: HexColor('#e3e3e7'))),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: ResponsiveModel.getWidth(
                                              context, .02),
                                          vertical: ResponsiveModel.getHeight(
                                              context, .027)),
                                      border: UnderlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              ResponsiveModel.getWidth(
                                                  context, .02)))),
                                ),
                              ],
                            ),
                          ),

                          // button
                          SizedBox(
                            height: ResponsiveModel.getHeight(context, .04),
                          ),
                          ButtonWidget(
                            // Firebase automactically validates email not need to check manually
                            callback: () async {
                              if (Functions.validateResetPasswordInput(
                                  context, _email.text.trim())) {
                                // show loading
                                Functions.showLoading('Sending request..');

                                try {
                                  await _auth
                                      .resetPassword(_email.text.trim())
                                      .then((value) {
                                    Functions.showErrorSnackbar(context,
                                        'reset password request sent..',
                                        isError: false);

                                    // get back to page
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUp()));
                                  });
                                } on AuthException catch (e) {
                                  Functions.showErrorSnackbar(
                                      context, e.toString());
                                }

                                // dismiss the loader
                                EasyLoading.dismiss();
                              }
                            },
                            buttonText: 'Reset Password',
                          ),
                        ],
                      ),
                    ),

                    // for empty space
                    SizedBox(
                      height: ResponsiveModel.getHeight(context, .5),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
