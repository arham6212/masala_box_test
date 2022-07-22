import 'package:flutter/material.dart';
import 'package:masala_box_test/common/common.dart';


class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget ?icon;
  final List<Widget>? actions;
  const CommonAppBar({Key? key,required this.title,  this.icon, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.white,
      leading: icon,
      title:  Text(
        title,
        style: Common.largeTextStyle(context),
      ),
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
