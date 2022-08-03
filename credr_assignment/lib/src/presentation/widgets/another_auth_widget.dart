import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../core/responsive_model.dart';

class AnotherAuthWidget extends StatelessWidget {
  const AnotherAuthWidget(
      {Key? key,
      required this.buttonText,
      required this.callback,
      required this.backgroundColor})
      : super(key: key);
  final String buttonText;
  final VoidCallback callback;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: callback,
        child: Container(
          height: ResponsiveModel.getHeight(context, .04),
          width: ResponsiveModel.getWidth(context, .4),
          decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(width: 2.0, color: HexColor('#ced0f0')),
              borderRadius: BorderRadius.circular(
                  ResponsiveModel.getWidth(context, .03))),
          child: Row(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset('assets/icons/google.png'),
              ),
              const Spacer(
                flex: 4,
              ),
              Text(
                buttonText,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              const Spacer(
                flex: 4,
              ),
            ],
          ),
        ));
  }
}
