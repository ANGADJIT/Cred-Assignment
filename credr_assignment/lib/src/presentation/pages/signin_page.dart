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
        child: SingleChildScrollView(
            child: Column(
          children: [
            Stack(
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
                  left: -250,
                  top: -80,
                  right: 30,
                  child: Container(
                    padding: EdgeInsets.only(
                        right: ResponsiveModel.getWidth(context, .02)),
                    height: ResponsiveModel.getHeight(context, .7),
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
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
