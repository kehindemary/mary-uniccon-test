import 'package:flutter/material.dart';
import 'package:uniccon/utils/custom_colors.dart';
import 'package:uniccon/utils/size.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double? textScaleFactor;
  final String? fontFamily;
  final Color? color;
  final double? wordSpacing;
  final VoidCallback? onClick;
  final TextDecoration? textDecoration;
  final TextOverflow? overflow;

  const CustomText({
    Key? key,
    required this.text,
    this.size,
    this.fontWeight,
    this.textAlign,
    this.textDecoration,
    this.overflow,
    this.textScaleFactor,
    this.fontFamily,
    this.color,
    this.wordSpacing,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: onClick == null
          ? Text(
              text,
              textAlign: textAlign ?? TextAlign.left,
              textScaleFactor: mediaSize(context),
              style: TextStyle(
                  height: 1.3,
                  decoration: textDecoration,
                  fontSize: size ?? 12,
                  fontWeight: fontWeight ?? FontWeight.w400,
                  color: color ?? CustomColors.defaultTextColor,
                  wordSpacing: wordSpacing,
                  overflow: overflow,
                  fontFamily: fontFamily ?? 'Inter'),
            )
          : TextButton(
              style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                minimumSize: const Size(23, 23),
              ),
              onPressed: () {
                onClick!.call();
              },
              child: Text(
                text,
                textAlign: textAlign,
                textScaleFactor: mediaSize(context),
                style: TextStyle(
                    fontSize: size,
                    fontWeight: fontWeight,
                    color: color,
                    wordSpacing: wordSpacing,
                    fontFamily: fontFamily),
              ),
            ),
    );
  }
}
