import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../core/responsive_model.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key, required this.buttonText, required this.callback})
      : super(key: key);
  final String buttonText;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: callback,
        child: Container(
          height: ResponsiveModel.getHeight(context, .06),
          width: ResponsiveModel.getWidth(context, .5),
          decoration: BoxDecoration(
              color: HexColor('#000101'),
              borderRadius: BorderRadius.circular(
                  ResponsiveModel.getWidth(context, .03))),
          child: Center(
              child: Text(
            buttonText,
            style: TextStyle(color: HexColor('#FFFFFF')),
          )),
        ));
  }
}
