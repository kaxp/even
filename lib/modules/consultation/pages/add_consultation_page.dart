import 'package:even/config/themes/assets/app_colors.dart';
import 'package:even/config/themes/assets/app_fonts.dart';
import 'package:even/config/themes/assets/app_icons.dart';
import 'package:even/config/themes/assets/app_strings.dart';
import 'package:even/constants/spacing_constants.dart';
import 'package:even/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddConsultationPage extends StatefulWidget {
  const AddConsultationPage({super.key});

  @override
  State<AddConsultationPage> createState() => _AddConsultationPageState();
}

class _AddConsultationPageState extends State<AddConsultationPage> with TickerProviderStateMixin {
  final _addAppbarTitleAnimation = GlobalKey<AnimatorWidgetState>();
  final _listKey = GlobalKey<AnimatedListState>();
  final _offset = Tween(begin: const Offset(-1, 0), end: const Offset(0, 0));
  final List<Widget> _serviceTiles = [];
  AnimationController? _animationController;
  Animation<Offset>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _animation = Tween<Offset>(begin: const Offset(0.5, 0.5), end: const Offset(0, 0)).animate(_animationController!);
    _animationController!.forward();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _addServices();
    });
  }

  void _addServices() {
    List<String> serviceNames = [
      AppStrings.teleConsultation,
      AppStrings.consultation,
      AppStrings.labTests,
      AppStrings.diagnostics,
      AppStrings.healthCheckup,
    ];

    Future ft = Future(() {});
    serviceNames.forEach((String service) {
      ft = ft.then((_) async {
        return await Future.delayed(const Duration(milliseconds: 60), () {
          _serviceTiles.add(_buildTile(service));
          _listKey.currentState!.insertItem(_serviceTiles.length - 1);
        });
      });
    });
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        isCenter: true,
        titleWidget: SlideInDown(
          key: _addAppbarTitleAnimation,
          preferences: const AnimationPreferences(
            duration: Duration(milliseconds: 600),
          ),
          child: const Text(
            AppStrings.chooseTypeOfService,
            style: TextStyle(
              fontFamily: AppFonts.ratBold,
              fontSize: 18,
              color: AppColors.blackColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        leadingWidget: SlideTransition(
          position: _animation!,
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 1 / 4).animate(_animationController!),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: SvgPicture.asset(AppIcons.icClose),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .20),
        child: AnimatedList(
            key: _listKey,
            initialItemCount: _serviceTiles.length,
            itemBuilder: (context, index, animation) {
              return SlideTransition(
                position: animation.drive(_offset),
                child: _serviceTiles[index],
              );
            }),
      ),
    );
  }

  Widget _buildTile(String service) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: kSpacingLarge),
      onTap: () {},
      title: Text(
        service,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.blackColor,
          fontFamily: AppFonts.ratRegular,
        ),
      ),
    );
  }
}
