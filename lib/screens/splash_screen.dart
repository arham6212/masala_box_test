import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masala_box_test/common/config.dart';

import '../common/routes.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  void navigateToPage() async {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Get.offNamed(RouteList.home);
    });
  }

  @override
  void initState() {
    navigateToPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:  Center(
            child: Text(
          Configuration.appName,
          style: const TextStyle(fontSize: 36, color: Colors.white),
        )),
      ),
    );
  }
}
