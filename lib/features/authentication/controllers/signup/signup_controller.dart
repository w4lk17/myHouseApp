import 'package:my_house/features/authentication/screens/signup/verify_email.dart';
import 'package:my_house/utils/constants/image_strings.dart';
import 'package:my_house/utils/helpers/network_manager.dart';
import 'package:my_house/utils/popups/full_screen_loader.dart';
import 'package:my_house/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs; // Observable variable for hiding/showing password
  final privacyPolicy = true.obs; // Observable variable for check/uncheck privacy policy
  final email = TextEditingController(); //controller for email input
  final lastName = TextEditingController(); //controller for last name
  final firstName = TextEditingController(); //controller for first name
  final username = TextEditingController(); //controller for username
  final password = TextEditingController(); //controller for password input
  final phoneNumber = TextEditingController(); //controller for phone number input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // form key for form validation

  /// -- SIGNUP-- ///
  void signup() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog('We are processing your information', TImages.docerAnimation);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();

      // make it one line code
      if (!isConnected) return;

      // Form Validation
      if (!signupFormKey.currentState!.validate()) return;

      // Privacy Policy check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In order to create an account, you need to accept our privacy policy & terms of use.',
        );
        return;
      }

      // Register User in the firebase authentication & Save user data in the firebase
      // final userCredential = await AuthenticationRepository.instance
      //     .registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save authenticated user data in the Firebase Fistore
      // final newUser = UserModel(
      //   id: userCredential.user!.uid,
      //   firstName: firstName.text.trim(),
      //   lastName: lastName.text.trim(),
      //   username: username.text.trim(),
      //   email: email.text.trim(),
      //   phoneNumber: phoneNumber.text.trim(),
      //   profilePicture: '',
      // );

      // final userRepository = Get.put(UserRepository());
      // await userRepository.saveUserRecord(newUser);
      // // Show Success Message
      TLoaders.successSnackBar(
        title: 'Congratulations!',
        message: 'Your account has been created!. Verify email to continue.',
      );

      // Move to verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Remove loader
      TFullScreenLoader.stopLoading();

      // Show Generic Error to user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
