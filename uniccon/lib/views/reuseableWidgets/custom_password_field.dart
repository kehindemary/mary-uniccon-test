import 'package:flutter/material.dart';
import 'package:uniccon/utils/custom_colors.dart';
import 'package:uniccon/views/reuseableWidgets/custom_text.dart';
import 'package:uniccon/views/reuseableWidgets/y_margin.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    Key? key,
    required this.hintText,
    this.onSaved,
    required this.inputLabel,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.width,
    this.controller,
  }) : super(key: key);
  final String hintText;
  final String inputLabel;
  final ValueChanged? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged? onChanged;
  final VoidCallback? onEditingComplete;
  final double? width;
  final TextEditingController? controller;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: widget.inputLabel),
        const YMargin(5),
        Container(
          width: widget.width ?? double.infinity,
          padding: const EdgeInsets.only(bottom: 15),
          child: TextFormField(
            cursorColor: CustomColors.neutralMain400,
            textInputAction: TextInputAction.done,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.controller,
            onChanged: widget.onChanged,
            onEditingComplete: widget.onEditingComplete,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: CustomColors.neutralMain500,
            ),
            decoration: InputDecoration(
              suffixIcon: TextButton(
                onPressed: () {
                  setState(() {
                    if (!showPassword) {
                      showPassword = true;
                    } else {
                      showPassword = false;
                    }
                  });
                },
                child: Container(
                    margin: const EdgeInsets.only(
                      right: 23,
                    ),
                    child: showPassword
                        ? const Icon(
                            Icons.visibility_sharp,
                            color: CustomColors.neutralMain400,
                          )
                        : const Icon(Icons.visibility_off_sharp,
                            color: CustomColors.neutralMain400)),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: CustomColors.neutralMain500),
              fillColor: CustomColors.white,
              filled: true,
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: CustomColors.errorMain500),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: CustomColors.errorMain500),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: CustomColors.primaryMain500),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              errorStyle: const TextStyle(color: CustomColors.errorMain500),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                borderSide: BorderSide(color: CustomColors.neutralMain200),
              ),
            ),
            keyboardType: TextInputType.text,
            obscureText: !showPassword,
            onSaved: widget.onSaved,
            validator: widget.validator,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
