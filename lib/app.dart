import 'package:flutter/material.dart';
import 'package:flutter_application_1/bindings/general_bindings.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_application_1/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: const OnBoardingScreen(),
    );
  }
}