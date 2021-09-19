import 'package:flutter/material.dart';
import 'package:flutter_starter_app/generated/images.asset.dart';
import 'package:flutter_starter_app/src/shared/spacing.dart';

class LogoWithSlogan extends StatelessWidget {
  final double size;
  final double fontSize;

  const LogoWithSlogan({this.size = 200, this.fontSize = 17});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(Images.logo, width: size, fit: BoxFit.fitWidth),
        VerticalSpacing(10),
        Text("Everyone is unique & beautiful!",
            style: TextStyle(fontSize: fontSize))
      ],
    );
  }
}
