import 'package:flutter/material.dart';
import 'package:uniccon/utils/custom_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.width,
    this.radius = 10,
    this.height = 50,
    required this.text,
    this.fontSize = 16,
    this.loading = false,
    this.disabled = false,
    required this.onPressed,
    this.color,
    this.textColor,
    this.borderColor,
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
  }) : super(key: key);

  final String text;
  final bool loading;
  final bool disabled;
  final double? height;
  final double? radius;
  final double? width;
  final double? fontSize;
  final EdgeInsets padding;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    var isDisabled = disabled || loading;

    return Opacity(
      opacity: isDisabled ? 0.5 : 1,
      child: TextButton(
        onPressed: isDisabled ? null : onPressed,
        child: Container(
          width: width ?? double.infinity,
          height: height ?? 55,
          padding: padding,
          decoration: BoxDecoration(
              color: color ?? CustomColors.primaryMain500,
              borderRadius: BorderRadius.circular(radius ?? 10),
              border: Border.all(
                  width: 1, color: borderColor ?? CustomColors.primaryMain500)),
          alignment: Alignment.center,
          child: loading
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(),
                )
              : Text(
                  text,
                  style: TextStyle(
                    color: textColor ?? CustomColors.white,
                    fontSize: fontSize ?? 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
      ),
    );
  }
}
