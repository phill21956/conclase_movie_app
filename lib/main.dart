import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'screen/home_page/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  setUpLogging();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

void setUpLogging() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xff0D0F14),
            brightness: Brightness.dark),
        home: const HomePage(),
      ),
    );
  }
}
