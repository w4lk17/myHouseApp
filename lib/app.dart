import 'package:my_house/bindings/general_bindings.dart';
import 'package:my_house/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:my_house/utils/constants/colors.dart';
import 'package:my_house/utils/theme/theme.dart';
import 'package:get/get.dart';

/// -- Use this Class to setup themes, initial Binding, any animations and much more --
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      // getPages: AppRoutes.pages,
      home: const OnBoardingScreen(),
      // home:Scaffold(
      //   backgroundColor: TColors.primary,
      //   body: Center(child: CircularProgressIndicator(color: TColors.white)),
      // ),
    );
  }
}
