import 'package:even/config/themes/assets/app_colors.dart';
import 'package:even/config/themes/assets/app_fonts.dart';
import 'package:even/config/themes/assets/app_icons.dart';
import 'package:even/config/themes/assets/app_strings.dart';
import 'package:even/constants/spacing_constants.dart';
import 'package:even/modules/consultation/pages/add_consultation_page.dart';
import 'package:even/modules/consultation/widgets/consultation_list_item.dart';
import 'package:even/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animations/animations.dart';

class ConsultationPage extends StatefulWidget {
  const ConsultationPage({super.key});

  @override
  State<ConsultationPage> createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {
  final _appbarTitleAnimation = GlobalKey<AnimatorWidgetState>();
  final _addConsultationTextAnimation = GlobalKey<AnimatorWidgetState>();
  final _addConsultationButtonAnimation = GlobalKey<AnimatorWidgetState>();
  final _lineAnimation = GlobalKey<AnimatorWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        titleWidget: FadeIn(
            key: _appbarTitleAnimation,
            preferences: const AnimationPreferences(
              duration: Duration(milliseconds: 1800),
            ),
            child: const Text(
              AppStrings.myHistory,
              style: TextStyle(
                fontFamily: AppFonts.ratBold,
                fontSize: 18,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w700,
              ),
            )),
        isCenter: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSpacingMedium),
        child: Column(
          children: [
            Row(
              children: [
                SlideInDown(
                  key: _addConsultationButtonAnimation,
                  preferences: const AnimationPreferences(
                    duration: Duration(milliseconds: 600),
                  ),
                  child: OpenContainer(
                    clipBehavior: Clip.hardEdge,
                    closedShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    middleColor: AppColors.primaryColor,
                    transitionDuration: const Duration(milliseconds: 600),
                    transitionType: ContainerTransitionType.fadeThrough,
                    useRootNavigator: true,
                    closedBuilder: (_, openContainer) {
                      return SvgPicture.asset(
                        AppIcons.icPlus,
                        height: 52,
                        fit: BoxFit.cover,
                      );
                    },
                    openBuilder: (_, closeContainer) => const AddConsultationPage(),
                    openColor: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(
                  width: kSpacingLarge,
                ),
                FadeIn(
                  key: _addConsultationTextAnimation,
                  preferences: const AnimationPreferences(
                    duration: Duration(milliseconds: 1800),
                  ),
                  child: const Text(
                    AppStrings.addConsultation,
                    style: TextStyle(
                      fontFamily: AppFonts.ratBold,
                      fontSize: 14,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Stack(
                children: [
                  SlideInUp(
                    key: _lineAnimation,
                    preferences: const AnimationPreferences(
                      duration: Duration(milliseconds: 600),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: kSpacingLarge),
                      child: Container(
                        child: SvgPicture.asset(
                          AppIcons.icLine,
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    padding: const EdgeInsets.only(bottom: kSpacingXSmall),
                    primary: true,
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return const ConsultationListItem();
                    },
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
