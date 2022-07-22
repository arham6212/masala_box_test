import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masala_box_test/components/cache-image-widget.dart';
import 'package:masala_box_test/theme/app_colors.dart';

import '../controllers/app_controller.dart';
import '../utils/tools.dart';
import 'grid_widget.dart';

class SecondTabContent extends StatelessWidget {
  SecondTabContent({Key? key}) : super(key: key);
  final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GetBuilder<AppController>(builder: (_) {
        return Column(
          children: [
            const SizedBox(height: 16),
            appController.imagesFromApi.isEmpty
                ? const Offstage()
                : FirstHorizontalBlock(appController: appController),
            const SizedBox(height: 16),
            appController.imagesFromApi.isEmpty
                ? const Offstage()
                : Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SecondHorizontalBlock(appController: appController),
                          const SizedBox(height: 16),
                          GridViewInsideListView(appController: appController),
                        ],
                      ),
                    ),
                  ),
            const SizedBox(height: 71),
          ],
        );
      }),
    );
  }
}

class GridViewInsideListView extends StatelessWidget {
  const GridViewInsideListView({
    Key? key,
    required this.appController,
  }) : super(key: key);

  final AppController appController;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: appController.imagesFromApi.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    Tools.isTablet(context) ? 4 : 2,
                crossAxisSpacing:
                    Tools.isTablet(context) ? 20 : 12,
                mainAxisSpacing:
                    Tools.isTablet(context) ? 20 : 12,
                mainAxisExtent:
                    Tools.isTablet(context) ? 302 : 220),
        itemBuilder: (_, index) {
          return GridWidget(
            image: appController.imagesFromApi[index],
          );
        });
  }
}

class SecondHorizontalBlock extends StatelessWidget {
  const SecondHorizontalBlock({
    Key? key,
    required this.appController,
  }) : super(key: key);

  final AppController appController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Tools.isTablet(context) ? 200 : 100,
      child: ListView.separated(
        separatorBuilder: (_, __) {
          return const SizedBox(width: 10);
        },
        itemCount: appController.imagesFromApi.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CacheImageWidget(
              (Tools.isTablet(context)
                      ? appController
                          .imagesFromApi[index].urls?.full
                      : appController.imagesFromApi[index]
                          .urls?.regular) ??
                  '',
            ),
          );
        },
      ),
    );
  }
}

class FirstHorizontalBlock extends StatelessWidget {
  const FirstHorizontalBlock({
    Key? key,
    required this.appController,
  }) : super(key: key);

  final AppController appController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Tools.isTablet(context) ? 150 : 100,
      child: ListView.separated(
        separatorBuilder: (_, __) {
          return const SizedBox(width: 8);
        },
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Tools.isTablet(context)?100:50),
                border: Border.all(color: AppColors.coolGrey, width: 5)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Tools.isTablet(context)?100:50),
              child: CacheImageWidget(
                (Tools.isTablet(context)
                        ? appController.imagesFromApi[index].urls?.full
                        : appController.imagesFromApi[index].urls?.regular) ??
                    '',
                fit: BoxFit.cover,
                width: Tools.isTablet(context) ? 150 : 100,
              ),
            ),
          );
        },
        itemCount: appController.imagesFromApi.length,
      ),
    );
  }
}
