import 'package:emart/consts/consts.dart';
import 'package:emart/views/splash_screen/splash_screen.dart';

import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appname,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
          fontFamily: regular),
      home: SplashScreen(),
    );
  }
}
