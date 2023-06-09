import 'package:flutter/material.dart';
import 'package:uniccon/utils/custom_colors.dart';
import 'package:uniccon/views/reuseableWidgets/custom_back_button.dart';
import 'package:uniccon/views/reuseableWidgets/custom_header_text.dart';
import 'package:uniccon/views/reuseableWidgets/custom_text.dart';
import 'package:uniccon/views/reuseableWidgets/y_margin.dart';

class ScreenLayout extends StatelessWidget {
  final String title;
  final String? subTitle;
  final Widget children;
  final double? size;
  final Widget? widget;

  const ScreenLayout(
      {Key? key,
      required this.title,
      this.subTitle,
      required this.children,
      this.widget,
      this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Backbutton(),
            const YMargin(10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomHeaderText(
                    text: title,
                  ),
                  CustomText(
                    text: subTitle ?? '',
                    size: size ?? 0,
                    color: CustomColors.neutralMain500,
                  ),
                  children
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
