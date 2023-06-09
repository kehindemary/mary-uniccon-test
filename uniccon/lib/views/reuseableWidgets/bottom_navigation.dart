import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uniccon/constants/constants.dart';
import 'package:uniccon/utils/custom_colors.dart';
import 'package:uniccon/views/reuseableWidgets/custom_text.dart';
import 'package:uniccon/views/screens/home.dart';
import 'package:uniccon/views/screens/loans.dart';
import 'package:uniccon/views/screens/profile.dart';
import 'package:uniccon/views/screens/savings.dart';
import 'package:uniccon/views/screens/tribes.dart';

class DashboardScreen extends StatefulWidget {
  static String routeName = 'DashboardScreen';

  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    const Home(),
    const Savings(),
    const Loans(),
    const Tribes(),
    const Profile()
  ];

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  final int initialIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: _screens,
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 80,
                offset: Offset(-40, 0),
                color: Color.fromRGBO(81, 78, 78, 0.11),
              ),
            ],
          ),
          child: SizedBox(
            child: BottomNavigationBar(
              backgroundColor: CustomColors.white,
              elevation: 0,
              onTap: _onItemTapped,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          '$icon/home.svg',
                        ),
                        const CustomText(
                          text: '',
                          size: 4,
                        )
                      ],
                    ),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          '$icon/home.svg',
                        ),
                        const CustomText(
                          text: '',
                          size: 0,
                        )
                      ],
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          '$icon/savings.svg',
                        ),
                        const CustomText(
                          text: '',
                          size: 4,
                        )
                      ],
                    ),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
                      children: [
                        SvgPicture.asset('$icon/savings.svg'),
                        const CustomText(
                          text: '',
                          size: 0,
                        )
                      ],
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
                      children: [
                        SvgPicture.asset('$icon/loans.svg'),
                        const CustomText(
                          text: '',
                          size: 0,
                        )
                      ],
                    ),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
                      children: [
                        SvgPicture.asset('$icon/loans.svg'),
                        const CustomText(
                          text: '',
                          size: 0,
                        )
                      ],
                    ),
                  ),
                  label: '',
                ),
                                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
                      children: [
                        SvgPicture.asset('$icon/tribe.svg'),
                        const CustomText(
                          text: '',
                          size: 0,
                        )
                      ],
                    ),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
                      children: [
                        SvgPicture.asset('$icon/tribe.svg'),
                        const CustomText(
                          text: '',
                          size: 0,
                        )
                      ],
                    ),
                  ),
                  label: '',
                ),

                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          '$icon/profile.svg',
                        ),
                        const CustomText(
                          text: '',
                          size: 0,
                        )
                      ],
                    ),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
                      children: [
                        SvgPicture.asset('$icon/profile.svg'),
                        const CustomText(
                          text: '',
                          size: 0,
                        )
                      ],
                    ),
                  ),
                  label: '',
                ),
              ],
              unselectedFontSize: 0,
              selectedFontSize: 0,
              showUnselectedLabels: true,
              unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: CustomColors.black,
                  fontSize: 12),
              currentIndex: _selectedIndex,
            ),
          ),
        ));
  }
}
