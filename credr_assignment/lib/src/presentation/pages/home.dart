import 'package:credr_assignment/src/core/functions.dart';
import 'package:credr_assignment/src/core/responsive_model.dart';
import 'package:credr_assignment/src/logic/auth/auth.dart';
import 'package:credr_assignment/src/logic/auth/auth_excetion.dart';
import 'package:credr_assignment/src/presentation/pages/signin_page.dart';
import 'package:credr_assignment/src/presentation/widgets/button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

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
                      'Home',
                      style: TextStyle(
                          color: HexColor('#FFFFFF'),
                          fontSize: ResponsiveModel.getWidth(context, .1),
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: ResponsiveModel.getHeight(context, .01)),
                      child: Text(
                        'Welcome Back AngadJit',
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
                          // button
                          SizedBox(
                            height: ResponsiveModel.getHeight(context, .04),
                          ),
                          ButtonWidget(
                            // Firebase automactically validates email not need to check manually
                            callback: () async {
                              Functions.showLoading('Logging Out..');

                              try {
                                await _auth.logOut().then((value) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignIn()));
                                });
                              } on AuthException catch (e) {
                                Functions.showErrorSnackbar(
                                    context, e.toString());
                              }

                              EasyLoading.dismiss();
                            },
                            buttonText: 'Log Out',
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
