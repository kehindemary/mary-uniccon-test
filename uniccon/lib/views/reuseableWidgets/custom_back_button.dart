
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uniccon/constants/constants.dart';
import 'package:uniccon/views/reuseableWidgets/custom_text.dart';
import 'package:uniccon/views/reuseableWidgets/x_margin.dart';


class Backbutton extends StatelessWidget {
  final String? title;
  final double? space;
  const Backbutton({Key? key, this.title, this.space}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset('$icon/back.svg'),
        ),
        XMargin(space ?? 100),
        CustomText(
          text: title ?? '',
          size: 16,
          fontWeight: FontWeight.w500,
        )
      ],
    );
  }
}
