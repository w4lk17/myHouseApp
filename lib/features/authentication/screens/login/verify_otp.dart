// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:my_house/features/authentication/controllers/login/login_controller.dart';
// import 'package:my_house/utils/constants/sizes.dart';
// import 'package:my_house/utils/constants/text_strings.dart';
// import 'package:my_house/utils/formatters/formatter.dart';
// import 'package:my_house/utils/helpers/helper_functions.dart';
// import 'package:flutter/material.dart';
// import 'package:otp_text_field_v2/otp_text_field_v2.dart';

// import '../../../../utils/constants/colors.dart';
// import '../../controllers/login/verify_otp_controller.dart';

// class VerifyOTPScreen extends StatelessWidget {
//   const VerifyOTPScreen({super.key, this.phoneNumber, this.method});

//   final String? phoneNumber;
//   final String? method;

//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);
//     final controller = LoginController.instance;
//     final otpController = Get.put(VerifyOtpController());

//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(TSizes.defaultSpace),
//           child: Column(
//             children: [
//               /// Logo, Title, Sub-Title
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Image(
//                   //   height: 150,
//                   //   image: AssetImage(dark ? TImages.lightAppLogo : TImages.darkAppLogo),
//                   // ),
//                   Text('Verifier votre numéro de téléphone', style: Theme.of(context).textTheme.headlineMedium),
//                   const SizedBox(height: TSizes.sm),
//                   Text(
//                       'Nous vous avons envoyé un code a 6 chiffres par $method. Veuillez l\'entrer ici pour valider votre numéro de téléphone.',
//                       style: Theme.of(context).textTheme.bodyMedium),
//                 ],
//               ),
//               const SizedBox(height: TSizes.spaceBtwItems),

//               /// text for displaying phone number and a iconbutton for editing phone number
//               Row(
//                 children: [
//                   Container(
//                       padding: const EdgeInsets.all(TSizes.sm),
//                       decoration: BoxDecoration(
//                         color: TColors.primary.withAlpha(50),
//                         borderRadius: BorderRadius.circular(100),
//                       ),
//                       child: Text(
//                         // format the phone number like +228 00 00 00
//                         TFormatter.internationalFormatPhoneNumber(phoneNumber!),
//                         style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.primary),
//                       )),
//                   IconButton(
//                     icon: Icon(Iconsax.edit, color: dark ? TColors.white : TColors.black),
//                     onPressed: () {
//                       Get.back();
//                     },
//                   )
//                 ],
//               ),
//               const SizedBox(height: TSizes.spaceBtwSections),

//               ///OTP Form
//               OTPTextFieldV2(
//                 controller: controller.otpController,
//                 length: 6,
//                 autoFocus: true,
//                 width: MediaQuery.of(context).size.width,
//                 textFieldAlignment: MainAxisAlignment.spaceAround,
//                 fieldWidth: 45,
//                 fieldStyle: FieldStyle.box,
//                 outlineBorderRadius: 10,
//                 contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 15),
//                 style: const TextStyle(fontSize: 17),
//                 onChanged: (pin) {
//                   otpController.isEnabled.value = pin.length == 6 ? true : false;
//                 },
//                 onCompleted: (pin) {
//                   otpController.otpCode = pin;
//                   print("Completed: " + pin);
//                 },
//               ),

//               const SizedBox(height: TSizes.spaceBtwSections),

//               /// Text for resend code and timeout of 2 min
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: [
//                       Text(
//                         'Vous n\'avez pas reçu le code ? ',
//                         style: Theme.of(context).textTheme.bodySmall,
//                       ),
//                       const SizedBox(height: TSizes.spaceBtwItems / 2),
//                       Obx(() {
//                         return otpController.remainingTime.value == 0
//                             ? TextButton(
//                                 onPressed: () => otpController.resendOTP(phoneNumber!, method!),
//                                 child: Text(
//                                   'Renvoyer le code',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodySmall!
//                                       .copyWith(color: dark ? TColors.white : TColors.primary),
//                                 ),
//                               )
//                             : Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   'Renvoyer dans  ${otpController.formattedRemainingTime} sec',
//                                   style: Theme.of(context).textTheme.bodyMedium,
//                                 ),
//                               );
//                       }),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(height: TSizes.spaceBtwSections),

//               /// button
//               SizedBox(
//                   width: double.infinity,
//                   child: Obx(
//                     () => ElevatedButton(
//                       onPressed: otpController.isEnabled.value 
//                       ? () => otpController.verifyOTP(otpController.otpCode) 
//                       : null,
//                       child: const Text(TTexts.tVerifyAndContinue),
//                     ),
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
