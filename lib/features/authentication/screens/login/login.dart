import 'package:get/utils.dart';
import 'package:my_house/common/styles/spacing_styles.dart';
import 'package:my_house/features/authentication/screens/login/widgets/login_form.dart';
import 'package:my_house/features/authentication/screens/login/widgets/login_header.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title, Sub-Title
              TLoginHeader(),

              /// Form
              TLoginForm(),

              /// Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),

              /// Footer
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Footer social buttons or Mobile login
              TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
