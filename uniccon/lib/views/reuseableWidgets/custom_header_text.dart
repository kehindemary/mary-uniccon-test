
import 'package:flutter/material.dart';
import 'package:uniccon/utils/custom_colors.dart';
import 'package:uniccon/views/reuseableWidgets/custom_text.dart';
import 'package:uniccon/views/reuseableWidgets/y_margin.dart';

class CustomHeaderText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  const CustomHeaderText({
    Key? key,
    required this.text,
    this.textAlign,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text,
          size: 20,
          color: CustomColors.black,
          fontWeight: fontWeight ?? FontWeight.w500,
          textAlign: textAlign ?? TextAlign.left,
        ),
        const YMargin(10)
      ],
    );
  }
}
