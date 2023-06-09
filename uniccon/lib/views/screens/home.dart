import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uniccon/constants/constants.dart';
import 'package:uniccon/utils/custom_colors.dart';
import 'package:uniccon/views/reuseableWidgets/custom_text.dart';
import 'package:uniccon/views/reuseableWidgets/scrollable_card.dart';
import 'package:uniccon/views/reuseableWidgets/x_margin.dart';
import 'package:uniccon/views/reuseableWidgets/y_margin.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static String routeName = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 325,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28)),
              color: CustomColors.primaryMain500,
              image: DecorationImage(
                  image: AssetImage('$image/background.png'),
                  fit: BoxFit.cover),
            ),
            child: Stack(
                alignment: Alignment.bottomCenter,
                fit: StackFit.loose,
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                      top: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset('$icon/user.svg'),
                          const XMargin(10),
                          const CustomText(
                            text: 'Hi, Mary',
                            fontWeight: FontWeight.w600,
                            color: CustomColors.white,
                          ),
                          const XMargin(190),
                          SvgPicture.asset('$icon/bell.svg'),
                        ],
                      )),
                  const Positioned(
                      top: 130,
                      child: Column(
                        children: [
                          CustomText(text: 'Main Account Balance',  fontWeight: FontWeight.w500,
                            color: CustomColors.white,),
                          CustomText(text: 'N0.00',  fontWeight: FontWeight.w600,
                            color: CustomColors.white, size: 32,),
                          CustomText(text: 'Account number: 0005400225',  fontWeight: FontWeight.w500,
                            color: CustomColors.white,)
                        ],
                      )),
                  Positioned(
                      top: 254,
                      width: 300,
                      child: Container(
                        width: 340,
                        height: 145,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: CustomColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                blurRadius: 20.0,
                                spreadRadius: -20.0,
                                offset: const Offset(0.0, 25.0),
                              ),
                            ]),
                        child: const Column(
                          children: [
                            Tiles(
                              imgUrl: '$icon/plus.svg',
                              text: 'Top up your wallet balance',
                              title: 'Add money',
                            ),
                            Divider(),
                            Tiles(
                              imgUrl: '$icon/arrow-up.svg',
                              text: 'Move money out of wallet',
                              title: 'Withdraw',
                            )
                          ],
                        ),
                      )),
                ]),
          ),
          const YMargin(70),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: CustomText(text: 'Quick Action', fontWeight: FontWeight.w700),
            ),
            const QuickActionCard(),
            Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(20.0),
              width: 371,
              height: 152,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: CustomColors.inputFocusColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: 'Welcome to Akiba Tribe',
                        color: CustomColors.success,
                        fontWeight: FontWeight.bold,
                      ),
                      const YMargin(10),
                      const CustomText(
                        text: 'Complete \naccount set up',
                        color: CustomColors.white,
                        size: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      const YMargin(10),
                      Row(
                        children: [
                          SvgPicture.asset('$icon/progress.svg'),
                          const XMargin(10),
                          const CustomText(
                            text: '1/5',
                            color: CustomColors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      )
                    ],
                  ),
                  SvgPicture.asset('$icon/task.svg')
                ],
              ),
            )
          ]),
        ],
      ),
    );
  }
}

class Tiles extends StatelessWidget {
  final String title;
  final String text;
  final String imgUrl;
  const Tiles({
    super.key,
    required this.title,
    required this.text,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          SvgPicture.asset(imgUrl),
          const XMargin(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: title,
              ),
              CustomText(
                text: text,
              ),
            ],
          )
        ],
      ),
    );
  }
}
