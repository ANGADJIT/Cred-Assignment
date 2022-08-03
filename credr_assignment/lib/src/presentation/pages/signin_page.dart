import 'package:credr_assignment/src/core/reponsive_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#cccdce'),
      body: SafeArea(
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
                      children: [
                        Container(
                          height: ResponsiveModel.getHeight(context, .17),
                          width: ResponsiveModel.getWidth(context, .75),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                ResponsiveModel.getWidth(context, .03)),
                            color: HexColor('#FFFFFF').withOpacity(.7),
                          ),
                          child: Column(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
