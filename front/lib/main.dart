import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front/core/utils/dark_mode_notifier.dart';
import 'package:front/splash_screen.dart';
import 'core/resources/theme/app_theme.dart';
import 'core/utils/shared_pref_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.instance.init();
  DarkModeNotifier().init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = DarkModeNotifier();
    return ListenableBuilder(
      listenable: darkMode,
      builder: (context, _) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: darkMode.themeMode,
              debugShowCheckedModeBanner: false,
              home: const SplashScreen(),
            );
          },
        );
      },
    );
  }
}
