import 'package:even/config/themes/assets/app_colors.dart';
import 'package:even/config/themes/assets/app_fonts.dart';
import 'package:even/config/themes/assets/app_images.dart';
import 'package:even/config/themes/assets/app_strings.dart';
import 'package:even/constants/radius_constants.dart';
import 'package:even/constants/spacing_constants.dart';
import 'package:flutter/material.dart';

class ConsultationListItem extends StatelessWidget {
  const ConsultationListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: kSpacingXLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                '05:35 PM',
                style: TextStyle(
                  fontFamily: AppFonts.ratMedium,
                  fontSize: 12,
                  color: AppColors.greyText,
                ),
              ),
              SizedBox(
                height: kSpacingXxSmall,
              ),
              Text(
                'Today',
                style: TextStyle(
                  color: AppColors.greyText,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  fontFamily: AppFonts.ratBold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: kSpacingSmall,
        ),
        Expanded(
          child: Card(
            margin: const EdgeInsets.symmetric(
              horizontal: kSpacingZero,
              vertical: kSpacingXSmall,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(kRadiusXxLarge),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    kSpacingMedium,
                    kSpacingMedium,
                    kSpacingMedium,
                    kSpacingZero,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.consultation.toUpperCase(),
                            style: const TextStyle(
                              fontFamily: AppFonts.ratRegular,
                              fontSize: 10,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Image(
                            image: AssetImage(AppImages.icConsultationImage),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: kSpacingXSmall,
                      ),
                      const Text(
                        'Dr. Jordan Henderson',
                        style: TextStyle(
                          fontFamily: AppFonts.ratBold,
                          fontSize: 14,
                          color: AppColors.blackColor,
                        ),
                      ),
                      const SizedBox(
                        height: kSpacingXSmall,
                      ),
                      const Text(
                        'Aster RV - Multispeciality Hospital, JP Nagar, Bengaluru',
                        style: TextStyle(
                          fontFamily: AppFonts.ratMedium,
                          fontSize: 10,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: kSpacingMedium,
                      ),
                      // TODO(kaxp): Update hardcoded widgets with Map in Row
                      Row(
                        children: [
                          Container(
                            height: kSpacingXLarge,
                            width: kSpacingXLarge,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(kRadiusXSmall),
                              ),
                            ),
                            child: const Image(
                              image: AssetImage(AppImages.icPrescription),
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(
                            width: kSpacingXSmall,
                          ),
                          Container(
                            height: kSpacingXLarge,
                            width: kSpacingXLarge,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(kRadiusXSmall),
                              ),
                            ),
                            child: const Image(
                              image: AssetImage(AppImages.icPrescription),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: kSpacingMedium,
                      ),
                      SizedBox(
                        height: kSpacingLarge,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            AppStrings.uploadDocs,
                            style: TextStyle(
                              fontFamily: AppFonts.ratMedium,
                              fontSize: 10,
                              color: AppColors.white,
                            ),
                          ),
                          style: const ButtonStyle(
                            padding: MaterialStatePropertyAll<EdgeInsetsGeometry?>(
                              EdgeInsets.fromLTRB(kSpacingMedium, 3, kSpacingMedium, 2),
                            ),
                            backgroundColor: MaterialStatePropertyAll<Color?>(AppColors.primaryColor),
                            shape: MaterialStatePropertyAll<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(kRadiusXLarge),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: kSpacingMedium,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: AppColors.offWhite,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(kRadiusXxLarge),
                        bottomRight: Radius.circular(kRadiusXxLarge),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        AppStrings.provideFeedback,
                        style: TextStyle(
                          fontFamily: AppFonts.ratMedium,
                          fontSize: 12,
                          color: AppColors.lightGreyText,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
