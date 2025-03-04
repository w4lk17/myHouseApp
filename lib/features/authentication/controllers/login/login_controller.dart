import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_house/features/personalization/controllers/user_controller.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// Variables

  // final phone = TextEditingController();
  // OtpFieldControllerV2 otpController = OtpFieldControllerV2();
  // GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final userController = Get.put(UserController());

  @override
  onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  /// Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.docerAnimation);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // save data if remember me is checked
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login User using email and password authentication
      // ignore: unused_local_variable
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove loader
      TFullScreenLoader.stopLoading();

      // Show Generic Error to user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// -- Google signIn Authentication -- ///
  Future<void> googleSignIn() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.docerAnimation);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Login User using google authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // save user record
      await userController.saveUserRecord(userCredentials);

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove loader
      TFullScreenLoader.stopLoading();
      // Show Generic Error to user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }

    /// -- Google signIn Authentication -- ///
  }

  /// -- Send OTP -- ///
  // Future<void> sendOTP(String phoneNumber, String method) async {
  //   try {
  //     final response = await AuthenticationRepository.instance.sendOTP(phoneNumber, method);

  //     // Show Success Message
  //     TLoaders.successSnackBar(
  //       title: 'Congratulations!',
  //       message: '$response. Verify email to continue.',
  //     );

  //     // Move to verify email screen
  //     Get.to(() => VerifyOTPScreen(phoneNumber: phoneNumber, method: method));
  //   } catch (e) {
  //     TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  //   }
  // }

  /// -- Show OTP delivery options Modal bottom sheet
  // Future<dynamic> showOTPDeliveryOptions(BuildContext context, String phoneNumber) {
  //   final dark = THelperFunctions.isDarkMode(context);
  //   return showModalBottomSheet(
  //     context: context,
  //     builder: (_) => Container(
  //       width: double.infinity,
  //       decoration: BoxDecoration(
  //         borderRadius: const BorderRadius.all(Radius.circular(TSizes.lg)),
  //       ),
  //       height: 200,
  //       margin: const EdgeInsets.all(TSizes.sm),
  //       padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.sm),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text(
  //             'Par quel moyen souhaitez-vous recevoir le code OTP ?',
  //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //             textAlign: TextAlign.center,
  //           ),
  //           SizedBox(height: 16),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Expanded(
  //                 child: SizedBox(
  //                   width: double.infinity,
  //                   height: 100,
  //                   child: TVerticalImageText(
  //                     isNetworkImage: false,
  //                     image: TImages.sms,
  //                     title: 'SMS',
  //                     textColor: dark ? TColors.light : TColors.dark,
  //                     onTap: () {
  //                       sendOTP(phoneNumber, 'SMS');
  //                     },
  //                   ),
  //                 ),
  //               ),
  //               Container(width: 1.5, height: 100, color: TColors.grey),
  //               Expanded(
  //                 child: SizedBox(
  //                   width: double.infinity,
  //                   height: 100,
  //                   child: GestureDetector(
  //                     onTap: () {
  //                       sendOTP(phoneNumber, 'WhatsApp');
  //                     },
  //                     child: Padding(
  //                       padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
  //                       child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.center,
  //                         children: [
  //                           /// icon
  //                           TCircularImage(
  //                             image: TImages.whatsapp,
  //                             fit: BoxFit.fitWidth,
  //                             padding: TSizes.sm * 1.4,
  //                             isNetworkImage: false,
  //                             overlayColor: dark ? TColors.light : TColors.dark,
  //                           ),

  //                           /// title
  //                           const SizedBox(height: TSizes.spaceBtwItems / 2),
  //                           SizedBox(
  //                             width: 69,
  //                             child: Center(
  //                               child: Text(
  //                                 'WhatsApp',
  //                                 style: Theme.of(context).textTheme.labelMedium!.apply(
  //                                       color: dark ? TColors.light : TColors.dark,
  //                                     ),
  //                                 maxLines: 1,
  //                                 overflow: TextOverflow.ellipsis,
  //                               ),
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
