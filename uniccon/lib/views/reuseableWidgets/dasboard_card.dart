import 'package:flutter/material.dart';
import 'package:uniccon/utils/custom_colors.dart';
import 'package:uniccon/views/reuseableWidgets/custom_text.dart';
import 'package:uniccon/views/reuseableWidgets/y_margin.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    Key? key,
    this.height,
    this.width,
    this.onTap,
    required this.image,
    required this.title,
  }) : super(key: key);

  final GestureTapCallback? onTap;
  final double? height;
  final double? width;
  final String title;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 140,
        height:  110,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
            color: const Color(0xffEEEEEE),
                borderRadius: BorderRadius.circular(11.9),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: image,
                  ),
                  const YMargin(24),
                  CustomText(
                    text: title,
                    size: 12,
                    color: CustomColors.neutralMain600,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



