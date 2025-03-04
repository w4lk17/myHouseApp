// import 'package:my_house/data/repositories/user/user_repository.dart';
// import 'package:my_house/features/personalization/controllers/user_controller.dart';
// import 'package:my_house/features/personalization/screens/profile/profile.dart';
// import 'package:my_house/utils/constants/image_strings.dart';
// import 'package:my_house/utils/helpers/network_manager.dart';
// import 'package:my_house/utils/popups/full_screen_loader.dart';
// import 'package:my_house/utils/popups/loaders.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class UpdateNameController extends GetxController {
//   static UpdateNameController get instance => Get.find();

//   final firstName = TextEditingController();
//   final lastName = TextEditingController();
//   final userController = UserController.instance;
//   final userRepository = Get.put(UserRepository());
//   final GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

//   /// init user data when home screen appear
//   @override
//   void onInit() {
//     firstName.text = userController.user.value.firstName;
//     lastName.text = userController.user.value.lastName;
//     super.onInit();
//   }

//   Future<void> updateUserName() async {
//     try {
//       //start loading
//       TFullScreenLoader.openLoadingDialog('We are updating your information...', TImages.docerAnimation);

//       // Check Internet Connection
//       final isConnected = await NetworkManager.instance.isConnected();
//       if (!isConnected) {
//         TFullScreenLoader.stopLoading();
//         return;
//       }

//       // Form Validation
//       if (!updateUserNameFormKey.currentState!.validate()) {
//         TFullScreenLoader.stopLoading();
//         return;
//       }

//       // update first name and last name in the firebase Firestore
//       Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.tr};

//       await userRepository.updateSingleField(name);
//       update(); // a revoir
//       // update the Rx User value
//       userController.user.value.firstName = firstName.text.trim();
//       userController.user.value.lastName = lastName.text.trim();
//       //remove loader
//       TFullScreenLoader.stopLoading();

//       // show success message
//       TLoaders.successSnackBar(title: 'Congratulations', message: 'Your name has been updated.');

//       //move to the previous screen
//       Get.off(() => const ProfileScreen());
//     } catch (e) {
//       TFullScreenLoader.stopLoading();
//       TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
//     }
//   }
// }
