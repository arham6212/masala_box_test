import 'package:flutter/cupertino.dart';

import '../utils/tools.dart';

class Common {
  static TextStyle  largeTextStyle(BuildContext context)=>  TextStyle(fontSize:Tools.isTablet(context)?32: 18, fontWeight: FontWeight.w700);
}
