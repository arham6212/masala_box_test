import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masala_box_test/common/common.dart';
import 'package:masala_box_test/theme/app_colors.dart';
import 'package:masala_box_test/utils/tools.dart';

import '../controllers/app_controller.dart';

class FirstTabContent extends StatelessWidget {
  FirstTabContent({
    Key? key,
  }) : super(key: key);
  final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 55),
      child: GetBuilder<AppController>(builder: (_) {
        return appController.listItemsModel.isEmpty
            ? const Offstage()
            : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: ListView.separated(
                separatorBuilder: (_, __)=> const SizedBox(height: 8),
              shrinkWrap: true,
              itemCount: appController.listItemsModel.length,
              itemBuilder: (_, index) {
                return ListTile(
                  onTap: () async {},
                  title: Text(appController.listItemsModel[index].name, style: Common.largeTextStyle(context),),
                  trailing: Text(appController.listItemsModel[index].type, style:  TextStyle(color: AppColors.raisinBlack, fontSize: Tools.isTablet(context)?20:16),),
                  tileColor: appController.listItemsModel[index].type=='One'?AppColors.beauBlue: (appController.listItemsModel[index].type=='Two'?AppColors.coolGrey: AppColors.cadetBlue ),
                );
              }),
            );
      }),
    );
  }
}
