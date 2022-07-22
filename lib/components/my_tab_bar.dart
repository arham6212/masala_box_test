import 'package:flutter/material.dart';
import '../common/common.dart';
import '../theme/app_colors.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({
    Key? key,required this.onTap, required this.firstTabName, required this.secondTabName,
  }) : super(key: key);

  final void Function(int?) onTap;
  final String firstTabName, secondTabName ;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.cadet),
      onTap: onTap,
      labelStyle: Common.largeTextStyle(context),
      unselectedLabelColor: AppColors.raisinBlack,
      indicatorColor: AppColors.cadet,
      indicatorWeight: 10,
      labelColor: Colors.white,
      tabs:  [
        Tab(
          text:firstTabName ,
        ),
        Tab(
          text: secondTabName,
        ),
      ],
    );
  }
}