import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grass_root_app/views/home_page_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'configs/app_styling.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        //  ScreenUtil.setContext(context);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: primaryColor,
            appBarTheme: const AppBarTheme(
                color: primaryColor,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Colors.black,
                )),
          ),
          title: 'GrassRoot',
          home: child,
          builder: (context, widget) {
            
           return  ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, widget!),
              maxWidth: 2560,
              minWidth: 320,
              // // defaultScale: true,
              defaultScale: true,
              // defaultScaleFactor: 1.3,
              // mediaQueryData:const MediaQueryData(),
              // useShortestSide: true,

              breakpoints: const [
                ResponsiveBreakpoint.resize(300,
                    name: MOBILE, scaleFactor: 0.95),
                ResponsiveBreakpoint.resize(320,
                    name: MOBILE, scaleFactor: 0.95),
                ResponsiveBreakpoint.resize(350,
                    name: MOBILE, scaleFactor: 0.95),
                ResponsiveBreakpoint.resize(375,
                    name: MOBILE, scaleFactor: 0.95),
                ResponsiveBreakpoint.resize(390,
                    name: MOBILE, scaleFactor: 0.95),
                ResponsiveBreakpoint.resize(395,
                    name: MOBILE, scaleFactor: 0.95),
                ResponsiveBreakpoint.resize(400,
                    name: MOBILE, scaleFactor: 0.95),
                ResponsiveBreakpoint.resize(425,
                    name: MOBILE, scaleFactor: 0.95),
                ResponsiveBreakpoint.resize(428,
                    name: MOBILE, scaleFactor: 0.95),
                ResponsiveBreakpoint.resize(450, name: MOBILE),
                ResponsiveBreakpoint.resize(500, name: TABLET, scaleFactor: 1),
                ResponsiveBreakpoint.resize(510, name: TABLET),
                ResponsiveBreakpoint.resize(520, name: TABLET),
                ResponsiveBreakpoint.resize(530, name: TABLET),
                ResponsiveBreakpoint.resize(540, name: TABLET),
                ResponsiveBreakpoint.resize(550, name: TABLET),
                ResponsiveBreakpoint.resize(554, name: TABLET),
                ResponsiveBreakpoint.resize(560, name: TABLET),
                ResponsiveBreakpoint.resize(566, name: TABLET),
                ResponsiveBreakpoint.resize(570, name: TABLET),
                ResponsiveBreakpoint.resize(585, name: TABLET),
                ResponsiveBreakpoint.resize(595, name: TABLET),
                ResponsiveBreakpoint.resize(600),
                ResponsiveBreakpoint.resize(610),
                ResponsiveBreakpoint.resize(612),
                ResponsiveBreakpoint.resize(615),
                ResponsiveBreakpoint.resize(620),
                ResponsiveBreakpoint.resize(650),
                ResponsiveBreakpoint.resize(690),
                ResponsiveBreakpoint.resize(700),
                ResponsiveBreakpoint.resize(710),
                ResponsiveBreakpoint.resize(720),
                ResponsiveBreakpoint.resize(750),
                ResponsiveBreakpoint.autoScale(768),
                ResponsiveBreakpoint.resize(790),
                ResponsiveBreakpoint.resize(795),
                ResponsiveBreakpoint.resize(799),
                ResponsiveBreakpoint.autoScale(800, name: TABLET),
                ResponsiveBreakpoint.autoScale(820, name: TABLET),
                ResponsiveBreakpoint.autoScale(829, name: TABLET),
                ResponsiveBreakpoint.autoScale(850, name: TABLET),
                ResponsiveBreakpoint.autoScale(890, name: TABLET),
                ResponsiveBreakpoint.autoScale(900, name: TABLET),
                ResponsiveBreakpoint.autoScale(920, name: TABLET),
                ResponsiveBreakpoint.resize(950, name: TABLET),
                ResponsiveBreakpoint.resize(990, name: TABLET),
                ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                ResponsiveBreakpoint.resize(1200,
                    name: DESKTOP, scaleFactor: 1),
                ResponsiveBreakpoint.resize(1290,
                    name: DESKTOP, scaleFactor: 1),
                ResponsiveBreakpoint.resize(1291,
                    name: DESKTOP, scaleFactor: 1),
                ResponsiveBreakpoint.resize(1292,
                    name: DESKTOP, scaleFactor: 1),
                ResponsiveBreakpoint.resize(1293,
                    name: DESKTOP, scaleFactor: 1),
                ResponsiveBreakpoint.resize(1294,
                    name: DESKTOP, scaleFactor: 1),
                ResponsiveBreakpoint.resize(1295,
                    name: DESKTOP, scaleFactor: 1),
                ResponsiveBreakpoint.resize(1300,
                    name: DESKTOP, scaleFactor: 1),
                ResponsiveBreakpoint.resize(1400,
                    name: DESKTOP, scaleFactor: 1.01),
                ResponsiveBreakpoint.resize(1500,
                    name: DESKTOP, scaleFactor: 1.01),
                ResponsiveBreakpoint.resize(1600,
                    name: DESKTOP, scaleFactor: 1.01),
                ResponsiveBreakpoint.autoScale(1700,
                    name: 'XL', scaleFactor: 1.01),
                ResponsiveBreakpoint.autoScale(2460,
                    name: '4K', scaleFactor: 1.1),
                ResponsiveBreakpoint.autoScale(2560,
                    name: '4K', scaleFactor: 1.2),
              ],
            );
          },
        );
      },
      child: const HomePageScreen(),
    );
  }
}
