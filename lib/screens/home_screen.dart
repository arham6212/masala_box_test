import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masala_box_test/common/config.dart';
import 'package:masala_box_test/components/common_app_bar.dart';
import 'package:masala_box_test/controllers/app_controller.dart';
import 'package:masala_box_test/theme/app_colors.dart';

import '../components/my_tab_bar.dart';
import '../components/sort_button.dart';
import 'first_tab_content_screen.dart';
import 'second_tab_content_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AppController appController = Get.put(AppController());

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      await appController.getListItems();
      await appController.getItemsForList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          extendBody: true,
          appBar: CommonAppBar(
            title: Configuration.appName,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SortButton(
                  listController: appController,
                ),
              ),
            ],
          ),
          body: TabBarView(
            children: [
              FirstTabContent(),
              SecondTabContent(),
            ],
          ),
          bottomSheet: Container(
            decoration: BoxDecoration(border: Border(top: BorderSide(color: AppColors.raisinBlack),),),
            padding: const EdgeInsets.only(top: 5),
            height: 55,
            child: MyTabBar(
              firstTabName: 'First Tab',
              secondTabName: 'Second Tab',
              onTap: (int? index) {
                appController.showSortIcon = (index == 0);
                appController.update();
              },
            ),
          ),
        ),
      ),
    );
  }
}
