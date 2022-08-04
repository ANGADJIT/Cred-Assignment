import 'package:credr_assignment/src/core/functions.dart';
import 'package:credr_assignment/src/core/responsive_model.dart';
import 'package:credr_assignment/src/logic/auth/auth.dart';
import 'package:credr_assignment/src/logic/auth/auth_excetion.dart';
import 'package:credr_assignment/src/presentation/pages/home.dart';
import 'package:credr_assignment/src/presentation/pages/signup_page.dart';
import 'package:credr_assignment/src/presentation/widgets/another_auth_widget.dart';
import 'package:credr_assignment/src/presentation/widgets/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  // editing controllers
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
                      'Sign In',
                      style: TextStyle(
                          color: HexColor('#FFFFFF'),
                          fontSize: ResponsiveModel.getWidth(context, .1),
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: ResponsiveModel.getHeight(context, .01)),
                      child: Text(
                        'Sign in with username or email',
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
                            height: ResponsiveModel.getHeight(context, .167),
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
                                      hintText: 'User or Email',
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
                                TextField(
                                  controller: _password,
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  cursorColor: HexColor('#000000'),
                                  decoration: InputDecoration(
                                      hintText: 'Password',
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
                              if (Functions.validateSignIn(
                                  context: context,
                                  email: _email.text.trim(),
                                  password: _password.text.trim())) {
                                // show loading
                                Functions.showLoading('Signing in..');

                                try {
                                  await _auth
                                      .signIn(
                                          email: _email.text.trim(),
                                          password: _password.text.trim())
                                      .then((value) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Home()));
                                  });
                                } on AuthException catch (e) {
                                  Functions.showErrorSnackbar(
                                      context, e.toString());
                                }

                                // dismiss the loader
                                EasyLoading.dismiss();
                              }
                            },
                            buttonText: 'Sign In',
                          ),

                          // row for create new account
                          Row(
                            children: [
                              const Spacer(),
                              Padding(
                                padding: EdgeInsets.only(
                                    top:
                                        ResponsiveModel.getHeight(context, .01),
                                    right:
                                        ResponsiveModel.getWidth(context, .03)),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SignUp()));
                                    },
                                    child: RichText(
                                        text: TextSpan(
                                            text: 'Create Account',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: HexColor('#000000'),
                                                fontSize:
                                                    ResponsiveModel.getWidth(
                                                        context, .045),
                                                decorationThickness: 3.0,
                                                decorationStyle:
                                                    TextDecorationStyle.solid,
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor:
                                                    HexColor('#7c7fce'))))),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    /// bottom line and altrnative sign in options
                    Padding(
                        padding: EdgeInsets.only(
                            left: 8.0,
                            top: ResponsiveModel.getHeight(context, .16)),
                        child: Text(
                          'Social login can save your valuable time',
                          style: TextStyle(color: HexColor('#000000')),
                        )),

                    Padding(
                      padding: EdgeInsets.only(
                          top: ResponsiveModel.getHeight(context, .015)),
                      child: Row(
                        children: [
                          Container(
                            color: HexColor('#7275d1'),
                            height: ResponsiveModel.getHeight(context, .005),
                            width: ResponsiveModel.getHeight(context, .16),
                          ),
                          const Spacer(),
                          FaIcon(
                            FontAwesomeIcons.handPointDown,
                            color: HexColor('#898fef'),
                          ),
                          const Spacer(),
                          Container(
                            color: HexColor('#7275d1'),
                            height: ResponsiveModel.getHeight(context, .005),
                            width: ResponsiveModel.getHeight(context, .16),
                          ),
                          const Spacer()
                        ],
                      ),
                    ),

                    // another options for sign in
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnotherAuthWidget(
                          backgroundColor: HexColor('#f9f8f8'),
                          textColor: HexColor('#000000'),
                          asset: 'assets/icons/google.png',
                          callback: () async {
                            // show loading
                            Functions.showLoading('');

                            try {
                              await _auth.googleSignIn().then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()));
                              });
                            } catch (e) {
                              Functions.showErrorSnackbar(
                                  context, e.toString());
                            }

                            // dismiss loader
                            EasyLoading.dismiss();
                          },
                          buttonText: 'Google',
                        ),
                        AnotherAuthWidget(
                          backgroundColor: HexColor('#f9f8f8'),
                          textColor: HexColor('#00000'),
                          asset: 'assets/icons/facebook.png',
                          callback: () {},
                          buttonText: 'Facebook',
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
