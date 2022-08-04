import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../core/responsive_model.dart';

class AnotherAuthWidget extends StatelessWidget {
  const AnotherAuthWidget(
      {Key? key,
      required this.buttonText,
      required this.callback,
      required this.backgroundColor,
      required this.textColor,
      required this.asset})
      : super(key: key);

  final String buttonText;
  final VoidCallback callback;
  final Color backgroundColor;
  final Color textColor;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: callback,
        child: Container(
          height: ResponsiveModel.getHeight(context, .04),
          width: ResponsiveModel.getHeight(context, .16),
          decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(width: 3.0, color: HexColor('#ced0f0')),
              borderRadius: BorderRadius.circular(
                  ResponsiveModel.getWidth(context, .03))),
          child: Row(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset(asset),
              ),
              const Spacer(
                flex: 4,
              ),
              Text(
                buttonText,
                style: TextStyle(fontWeight: FontWeight.w700, color: textColor),
              ),
              const Spacer(
                flex: 4,
              ),
            ],
          ),
        ));
  }
}
