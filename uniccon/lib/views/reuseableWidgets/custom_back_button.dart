import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uniccon/constants/constants.dart';


class Backbutton extends StatelessWidget {
  final String? title;
  final double? space;
  const Backbutton({Key? key, this.title, this.space}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SvgPicture.asset('$icon/arrow-left.svg'),
      ),
    );
  }
}
