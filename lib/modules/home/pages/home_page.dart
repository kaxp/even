import 'package:even/config/themes/assets/app_colors.dart';
import 'package:even/config/themes/assets/app_fonts.dart';
import 'package:even/config/themes/assets/app_images.dart';
import 'package:even/config/themes/assets/app_strings.dart';
import 'package:even/constants/radius_constants.dart';
import 'package:even/constants/spacing_constants.dart';
import 'package:even/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        titleWidget: SizedBox.shrink(),
        isCenter: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(kSpacingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.hospitalsNearYou,
              style: TextStyle(
                fontFamily: AppFonts.ratBold,
                fontSize: 14,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: kSpacingMedium,
            ),
            Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(kRadiusXLarge),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(kRadiusXLarge),
                ),
                child: Image(
                  image: AssetImage(AppImages.icHomeHospital),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
