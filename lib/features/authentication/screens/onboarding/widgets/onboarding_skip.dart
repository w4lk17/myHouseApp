import 'package:my_house/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:my_house/utils/constants/sizes.dart';
import 'package:my_house/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: Text('Skip'),
      ),
    );
  }
}
