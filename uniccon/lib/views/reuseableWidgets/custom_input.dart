
import 'package:flutter/material.dart';
import 'package:uniccon/utils/custom_colors.dart';
import 'package:uniccon/views/reuseableWidgets/custom_text.dart';
import 'package:uniccon/views/reuseableWidgets/y_margin.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    Key? key,
    required this.hintText,
    required this.inputType,
    this.obscureText,
    this.isPassword = false,
    this.initialValue,
    this.onSaved,
    this.validator,
    this.onChanged,
    this.label,
    this.suffixIcon,
    this.icon,
    this.width,
    this.controller,
    this.maxLines,
    this.borderRadius,
  }) : super(key: key);
  final String hintText;
  final TextInputType inputType;
  final bool? obscureText;
  final bool? isPassword;
  final String? initialValue;
  final String? label;
  final double? borderRadius;
  final int? maxLines;
  final ValueChanged? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged? onChanged;
  final Widget? suffixIcon;
  final Widget? icon;
  final double? width;
  final TextEditingController? controller;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: widget.label ?? '',
          color: CustomColors.neutralMain500,
        ),
        const YMargin(5),
        Container(
          width: widget.width ?? double.infinity,
          padding: const EdgeInsets.only(bottom: 15),
          child: TextFormField(
            cursorColor: CustomColors.neutralMain500,
            textInputAction: TextInputAction.done,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.controller,
            initialValue: widget.initialValue,
            maxLines: widget.maxLines ?? 1,
            onChanged: widget.onChanged,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: CustomColors.neutralMain500,
            ),
            decoration: InputDecoration(
              suffixIcon: widget.suffixIcon,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: CustomColors.neutralMain500),
              fillColor: CustomColors.white,
              filled: true,
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: CustomColors.errorMain500),
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius ?? 100.0),
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: CustomColors.errorMain500),
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius ?? 100.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: CustomColors.primaryMain500),
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius ?? 100.0),
                ),
              ),
              errorStyle: const TextStyle(color: CustomColors.errorMain500),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius ?? 100.0),
                ),
                borderSide:
                    const BorderSide(color: CustomColors.neutralMain200),
              ),
              labelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: CustomColors.defaultTextColor),
            ),
            keyboardType: widget.inputType,
            obscureText: widget.isPassword! && !showPassword,
            onSaved: widget.onSaved,
            validator: widget.validator,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
