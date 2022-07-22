import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/common.dart';
import '../common/constants.dart';
import '../controllers/app_controller.dart';

class SortButton extends StatelessWidget {
  const SortButton({
    Key? key,
    required this.listController,
  }) : super(key: key);

  final AppController listController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (_) {
      return listController.showSortIcon
          ? PopupMenuButton(
          child: Container(
              height: 36,
              alignment: Alignment.centerRight,
              child: Row(
                children: [
                  Text('Sort', style: Common.largeTextStyle(context),),
                  const SizedBox(width: 12),
                  const Icon(Icons.sort_by_alpha),
                ],
              )),
          itemBuilder: (_) => const <PopupMenuItem>[
            PopupMenuItem(
                child: Text('Ascending'), value: SortOrder.ascending),
            PopupMenuItem(
                child: Text('Descending'), value: SortOrder.descending),
          ],
          onSelected: (var sortOrder) async{
            await listController.sortListItems(sortOrder: sortOrder as SortOrder);
          })
          : const Offstage();
    });
  }
}
