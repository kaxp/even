import 'package:even/config/themes/assets/app_colors.dart';
import 'package:even/config/themes/assets/app_icons.dart';
import 'package:even/constants/radius_constants.dart';
import 'package:even/constants/spacing_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedTabBar extends StatefulWidget {
  const AnimatedTabBar({
    super.key,
    required this.tabIcons,
    required this.controller,
  });
  final List<String> tabIcons;
  final TabController controller;

  @override
  State<AnimatedTabBar> createState() => _AnimatedTabBar();
}

class _AnimatedTabBar extends State<AnimatedTabBar> {
  final animationDuration = const Duration(milliseconds: 600);
  final animationCurve = Curves.easeInOutQuad;
  late int tabIndex;
  final _tabHeight = 68.0;

  @override
  void initState() {
    super.initState();
    tabIndex = widget.controller.index;
    widget.controller.addListener(() {
      if (widget.controller.indexIsChanging) {
        setState(() {
          tabIndex = widget.controller.index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blackColor,
      height: _tabHeight,
      child: Stack(
        children: [
          // TODO(kaxp): Remove background image and use CustomPainter
          SvgPicture.asset(
            _getTabBackground(tabIndex),
            fit: BoxFit.fitWidth,
          ),

          AnimatedAlign(
            duration: animationDuration,
            curve: animationCurve,
            alignment: FractionalOffset(1 / (widget.tabIcons.length - 1) * tabIndex, 0),
            child: Container(
              height: _tabHeight,
              color: Colors.transparent,
              child: FractionallySizedBox(
                widthFactor: 1 / widget.tabIcons.length,
                child: Center(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(kRadiusXSmall),
                  child: Container(
                    color: AppColors.primaryColor,
                    width: kSpacingMedium,
                    height: kSpacingMedium,
                  ),
                )),
              ),
            ),
          ),
          Row(
              children: widget.tabIcons.asMap().entries.map((entry) {
            final currentTabIndex = entry.key;
            final isActiveTab = currentTabIndex == tabIndex;
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  if (currentTabIndex == 0 || currentTabIndex == 1) {
                    // TODO(kaxp): Fix animation and duration issue on tab change.
                    // Open issue in flutter [https://github.com/flutter/flutter/issues/16892]
                    widget.controller.animationDuration;
                    widget.controller.animateTo(
                      currentTabIndex,
                      curve: animationCurve,
                      duration: animationDuration,
                    );
                  }
                },
                child: Container(
                  color: Colors.transparent,
                  height: _tabHeight,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        widget.tabIcons[currentTabIndex],
                        color: isActiveTab ? AppColors.white : AppColors.blackColor,
                      )
                    ],
                  ),
                ),
              ),
            );
          }).toList()),
          Padding(
            padding: const EdgeInsets.only(top: kSpacingLarge),
            child: AnimatedAlign(
              duration: animationDuration,
              curve: animationCurve,
              alignment: FractionalOffset(1 / (widget.tabIcons.length - 1) * tabIndex, 0),
              child: Container(
                height: _tabHeight,
                color: Colors.transparent,
                child: FractionallySizedBox(
                  widthFactor: 1 / widget.tabIcons.length,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: kSpacingLarge),
                      child: Text(
                        tabIndex == widget.controller.index ? '•' : '',
                        style: TextStyle(
                          fontSize: 20,
                          color: tabIndex == widget.controller.index ? AppColors.white : AppColors.transparentColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getTabBackground(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return AppIcons.icTabShapeOne;
      case 1:
        return AppIcons.icTabShapeTwo;
      default:
        return '';
    }
  }
}
