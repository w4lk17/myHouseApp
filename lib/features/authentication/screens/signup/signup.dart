import 'package:my_house/common/widgets/login_signup/form_divider.dart';
import 'package:my_house/common/widgets/login_signup/social_buttons.dart';
import 'package:my_house/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:my_house/utils/constants/sizes.dart';
import 'package:my_house/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(TTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Form
              const TSignupForm(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Divider
              TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
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
