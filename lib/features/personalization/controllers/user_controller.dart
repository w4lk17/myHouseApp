import 'package:my_house/utils/constants/sizes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  // final profileLoading = false.obs;
  // Rx<UserModel> user = UserModel.empty().obs;

  // final hidePassword = false.obs;
  // final imageUploading = false.obs;
  // final verifyEmail = TextEditingController();
  // final verifyPassword = TextEditingController();
  // final userRepository = Get.put(UserRepository());
  // GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  // @override
  // void onInit() {
  //   super.onInit();
  //   fetchUserRecord();
  // }

  // /// Fetch user records
  // Future<void> fetchUserRecord() async {
  //   try {
  //     profileLoading.value = true;
  //     final user = await userRepository.fetchUserDetails();
  //     this.user.value = user;
  //   } catch (e) {
  //     user(UserModel.empty());
  //   } finally {
  //     profileLoading.value = false;
  //   }
  // }

  /// Save user records from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    // try {
    //   // first update Rx User and rhen check if user data is already stored. if not store new data
    //   await fetchUserRecord();
    //   // if no record already stored
    //   if (user.value.id.isEmpty) {
    //     if (userCredentials != null) {
    //       // convert name to first name and last name
    //       final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
    //       final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

    //       // Map data
    //       final user = UserModel(
    //         id: userCredentials.user!.uid,
    //         firstName: nameParts[0],
    //         lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
    //         username: username,
    //         email: userCredentials.user!.email ?? '',
    //         phone: userCredentials.user!.phoneNumber ?? '',
    //         profilePicture: userCredentials.user!.photoURL ?? '',
    //       );

    //       // Save user data in the firebase
    //       await userRepository.saveUserRecord(user);
    //     }
    //   }
    // } catch (e) {
    //   TLoaders.errorSnackBar(
    //       title: 'Data not saved',
    //       message:
    //           'Something went wrong while saving your information. You can re-save your data in your Profile.');
    // }
  }

  /// Delete account warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently? This action is not reversible and all your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
        child: const Padding(padding: EdgeInsets.symmetric(horizontal: TSizes.lg), child: Text('Delete')),
      ),
      cancel:
          OutlinedButton(onPressed: () => Navigator.of(Get.overlayContext!).pop(), child: const Text('Cancel')),
    );
  }

  /// delete user account
  void deleteUserAccount() async {
    // try {
    //   TFullScreenLoader.openLoadingDialog('Processing', TImages.docerAnimation);

    //   /// first re-authenticate user
    //   final auth = AuthenticationRepository.instance;
    //   final provider = auth.authUser.providerData.map((e) => e.providerId).first;
    //   if (provider.isNotEmpty) {
    //     // reverify Auth email
    //     if (provider == 'google.com') {
    //       await auth.signInWithGoogle();
    //       await auth.deleteAccount();
    //       TFullScreenLoader.stopLoading();
    //       Get.offAll(() => const LoginScreen());
    //     } else if (provider == 'password') {
    //       TFullScreenLoader.stopLoading();
    //       // Get.to(() => const ReAuthLoginForm());
    //     }
    //   }
    // } catch (e) {
    //   TFullScreenLoader.stopLoading();
    //   TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    // }
  }

  /// RE-AUTHENTICATE USER before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    // try {
    //   // start loading
    //   TFullScreenLoader.openLoadingDialog('Processing', TImages.docerAnimation);

    //   // Check Internet Connection
    //   final isConnected = await NetworkManager.instance.isConnected();
    //   if (!isConnected) {
    //     TFullScreenLoader.stopLoading();
    //     return;
    //   }

    //   // Form Validation
    //   if (!reAuthFormKey.currentState!.validate()) {
    //     TFullScreenLoader.stopLoading();
    //     return;
    //   }

    //   await AuthenticationRepository.instance
    //       .reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
    //   await AuthenticationRepository.instance.deleteAccount();
    //   TFullScreenLoader.stopLoading();
    //   Get.offAll(() => const LoginScreen());
    // } catch (e) {
    //   TFullScreenLoader.stopLoading();
    //   TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    // }
  }

  /// upload ProfilePicture
  uploadUserProfilePicture() async {
    // try {
    //   final image = await ImagePicker()
    //       .pickImage(source: ImageSource.gallery, imageQuality: 70, maxWidth: 512, maxHeight: 512);
    //   if (image != null) {
    //     imageUploading.value = true;
    //     // upload image
    //     final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);

    //     // update user image record
    //     Map<String, dynamic> json = {'ProfilePicture': imageUrl};
    //     await userRepository.updateSingleField(json);

    //     user.value.profilePicture = imageUrl;
    //     user.refresh();

    //     TLoaders.successSnackBar(title: 'Congratulations!', message: 'Profile Image has been updated!');
    //   }
    // } catch (e) {
    //   TLoaders.errorSnackBar(title: 'Oh Snap!', message: 'Something went wrong: $e');
    // } finally {
    //   imageUploading.value = false;
    // }
  }
}
