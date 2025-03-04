// import 'dart:async';

// import 'package:get/get.dart';
// import 'package:my_house/navigation_menu.dart';

// import '../../../../data/repositories/authentication/authentication_repository.dart';
// import '../../../../utils/popups/loaders.dart';

// class VerifyOtpController extends GetxController {
//   static VerifyOtpController get instance => Get.find();

//   /// Variables
//   String otpCode = '';
//   final isEnabled = false.obs; // Observable variable for enabled/disabled button
//   final RxInt remainingTime = 120.obs; // Observable variable for remaining time
//   Timer? _timer;

//   ///Send email whenever Verify Screen appears & Set timer for auto redirect
//   @override
//   void onInit() {
//     startTimer();
//     super.onInit();
//   }

// //   /// Send Email verification link
// //   sendEmailVerification() async {
// //     try {
// //       await AuthenticationRepository.instance.sendEmailVerification();
// //       TLoaders.successSnackBar(title: 'Email Sent', message: 'Please check your inbox and verify your email.');
// //     } catch (e) {
// //       TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
// //     }
// //   }

//   /// -- Resend OTP -- ///
//   void resendOTP(String phoneNumber, String method) async {
//     try {
//       // await AuthenticationRepository.instance.sendCode();
//       remainingTime.value = 120;
//       startTimer();
//       TLoaders.successSnackBar(
//           title: 'Code Sent', message: 'Please check your $phoneNumber $method inbox and verify your code.');
//     } catch (e) {
//       TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
//     }
//   }

//   /// -- Verify OTP -- ///
//   void verifyOTP(String otp) async {
//     try {
//       // otpCode = otp;
//       final response = await AuthenticationRepository.instance.verifyOTP(otp);

//       print('OTP CODE : $response');
//       // Move to home screen
//       Get.to(() => const NavigationMenu());
//       TLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created.');
//     } catch (e) {
//       TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
//     }
//   }

//   /// -- Timer for Re-requesting the OTP code
//   void startTimer() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (remainingTime.value > 0) {
//         remainingTime.value--;
//       } else {
//         _timer?.cancel();
//       }
//     });
//   }

//   String get formattedRemainingTime {
//     int minutes = remainingTime.value ~/ 60;
//     int seconds = remainingTime.value % 60;
//     return '${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}';
//   }
// }
