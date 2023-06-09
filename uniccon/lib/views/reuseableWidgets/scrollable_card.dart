import 'package:flutter/material.dart';
import 'package:uniccon/constants/constants.dart';
import 'package:uniccon/utils/custom_colors.dart';
import 'package:uniccon/views/reuseableWidgets/dasboard_card.dart';
import 'package:uniccon/views/reuseableWidgets/x_margin.dart';

class QuickActionCard extends StatelessWidget {
  const QuickActionCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          const XMargin(20),
          DashboardCard(
            title: 'Start a savings program',
            onTap: () {},
            image: Image.asset('$icon/money-box.png'),
          ),
          const XMargin(10),
          DashboardCard(
            onTap: () {},
            title: 'Request a Loan',
            image: Image.asset(
              '$icon/coins.png',
              color: CustomColors.white,
            ),
          ),
          const XMargin(10),
          DashboardCard(
            onTap: () {},
            title: 'Buy Data & Airtime',
            image: Image.asset(
              '$icon/iphone.png',
              color: CustomColors.white,
            ),
          ),
          const XMargin(20),
        ],
      ),
    );
  }
}
