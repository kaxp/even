import 'package:even/config/themes/assets/app_colors.dart';
import 'package:even/config/themes/assets/app_icons.dart';
import 'package:even/modules/consultation/pages/consultation_page.dart';
import 'package:even/modules/home/pages/home_page.dart';
import 'package:even/widgets/animated_tab_bar.dart';
import 'package:flutter/material.dart';

class HomeTabBar extends StatefulWidget {
  const HomeTabBar({super.key});
  @override
  State<HomeTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  static List<String> tabIcons = [
    AppIcons.icTabHomeOff,
    AppIcons.icTabHistoryOff,
    AppIcons.icTabMindfulnessOff,
    AppIcons.icTabAccountOff,
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: tabIcons.length,
      animationDuration: const Duration(
        milliseconds: 600,
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedTabBar(
        tabIcons: tabIcons,
        controller: _tabController,
      ),
      body: Container(
        color: AppColors.backgroundColor,
        child: TabBarView(
          controller: _tabController,
          children: const [
            HomePage(),
            ConsultationPage(),
            SizedBox.shrink(),
            SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
