import 'package:iconsax/iconsax.dart';
import 'package:my_house/features/authentication/controllers/login/login_controller.dart';
import 'package:my_house/features/authentication/screens/signup/signup.dart';
import 'package:my_house/utils/constants/sizes.dart';
import 'package:my_house/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/validators/validation.dart';
import '../../password_configuration/forget_password.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: InputDecoration(
                labelText: TTexts.email,
                prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            /// Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => TValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                  ),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            /// Remember Me and Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value),
                    ),
                    const Text(TTexts.rememberMe),
                  ],
                ),

                /// Forgot Password
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(TTexts.forgetPassword),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.emailAndPasswordSignIn(), child: const Text(TTexts.signIn)),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Create account button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () => Get.to(() => const SignupScreen()), child: const Text(TTexts.createAccount)),
            ),
          ],
        ),
      ),
    );
  }
}
  //   final controller = Get.put(LoginController());
  //   final dark = THelperFunctions.isDarkMode(context);
  //   return Form(
  //     key: controller.loginFormKey,
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
  //       child: Column(
  //         children: [
  //           /// Phone Number Field
  //           IntlPhoneField(
  //             focusNode: FocusNode(),
  //             validator: (value) => TValidator.validatePhoneNumber(value!.toString()),
  //             decoration: InputDecoration(labelText: TTexts.phoneNo),
  //             initialCountryCode: 'TG',
  //             languageCode: 'fr',
  //             onChanged: (phonec) {
  //               controller.phone.text = phonec.completeNumber;
  //             },
  //           ),

  //           const SizedBox(height: TSizes.spaceBtwInputFields),

  //           /// Terms and Conditions
  //           SizedBox(
  //             child: Text.rich(
  //               TextSpan(
  //                 children: [
  //                   TextSpan(text: '${TTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
  //                   TextSpan(
  //                     text: '${TTexts.privacyPolicy} ',
  //                     style: Theme.of(context).textTheme.bodyMedium!.apply(
  //                           color: dark ? TColors.white : TColors.primary,
  //                           decoration: TextDecoration.underline,
  //                           decorationColor: dark ? TColors.white : TColors.primary,
  //                         ),
  //                   ),
  //                   TextSpan(text: '${TTexts.and} ', style: Theme.of(context).textTheme.bodySmall),
  //                   TextSpan(
  //                     text: TTexts.termsOfUse,
  //                     style: Theme.of(context).textTheme.bodyMedium!.apply(
  //                           color: dark ? TColors.white : TColors.primary,
  //                           decoration: TextDecoration.underline,
  //                           decorationColor: dark ? TColors.white : TColors.primary,
  //                         ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),

  //           const SizedBox(height: TSizes.spaceBtwSections),

  //           /// Sign In Button
  //           ///
  //           SizedBox(
  //             width: double.infinity,
  //             child: ElevatedButton(
  //                 onPressed: () => controller.showOTPDeliveryOptions(context, controller.phone.text),
  //                 child: const Text(TTexts.signIn)),
  //           ),
  //           const SizedBox(height: TSizes.spaceBtwItems),
  //         ],
  //       ),
  //     ),
  //   );
  // }
// }
