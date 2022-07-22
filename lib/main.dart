import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masala_box_test/screens/home_screen.dart';
import 'common/routes.dart';
import 'screens/splash_screen.dart';
import 'theme/app_colors.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: RouteList.splashScreen,
          page: () => const Splashscreen(),
        ),   GetPage(
          name: RouteList.home,
          page: () => const HomeScreen(),
        ),
      ],
      title: 'Masala Box Test',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: AppColors.cadet,
            foregroundColor: AppColors.appOffsetWhite,
            elevation: 0),
        textTheme: GoogleFonts.nunitoSansTextTheme(Theme.of(context).textTheme)
            .copyWith(
          bodyText1: GoogleFonts.oswald(
              textStyle: Theme.of(context).textTheme.bodyText1),
        ),
      ),
      initialRoute: RouteList.splashScreen,
    );
  }
}
