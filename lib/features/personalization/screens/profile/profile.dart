// import 'package:my_house/common/widgets/appbar/appbar.dart';
// import 'package:my_house/common/widgets/images/t_circular_image.dart';
// import 'package:my_house/common/widgets/shimmers/shimmer.dart';
// import 'package:my_house/common/widgets/texts/section_heading.dart';
// import 'package:my_house/features/personalization/controllers/user_controller.dart';
// import 'package:my_house/features/personalization/screens/profile/widgets/change_name.dart';
// import 'package:my_house/features/personalization/screens/profile/widgets/profile_menu.dart';
// import 'package:my_house/utils/constants/image_strings.dart';
// import 'package:my_house/utils/constants/sizes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = UserController.instance;
//     return Scaffold(
//       ///--Appbar
//       appBar: TAppBar(showBackArrow: true, title: Text('Profile')),

//       ///--Body
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(TSizes.defaultSpace),
//           child: Column(
//             children: [
//               ///--Avatar
//               SizedBox(
//                 width: double.infinity,
//                 child: Column(
//                   children: [
//                     Obx(() {
//                       final networkImage = controller.user.value.profilePicture;
//                       final image = networkImage.isNotEmpty ? networkImage : TImages.user;
//                       return controller.imageUploading.value
//                           ? TShimmerEffect(width: 80, height: 80, radius: 80)
//                           : TCircularImage(
//                               image: image, width: 80, height: 80, isNetworkImage: networkImage.isNotEmpty);
//                     }),
//                     TextButton(
//                         onPressed: () => controller.uploadUserProfilePicture(),
//                         child: const Text('Change Avatar')),
//                   ],
//                 ),
//               ),

//               ///--Details
//               const SizedBox(height: TSizes.spaceBtwItems / 2),
//               const Divider(),
//               const SizedBox(height: TSizes.spaceBtwItems),

//               ///-- Heading Profile Information
//               TSectionHeading(title: 'Profile Information', showActionButton: false),
//               const SizedBox(height: TSizes.spaceBtwItems),

//               TProfileMenu(
//                 title: 'name',
//                 value: controller.user.value.fullName,
//                 onPressed: () => Get.to(() => const ChangeName()),
//               ),
//               TProfileMenu(title: 'Username', value: controller.user.value.username, onPressed: () {}),

//               const SizedBox(height: TSizes.spaceBtwItems),
//               const Divider(),
//               const SizedBox(height: TSizes.spaceBtwItems),

//               ///-- Heading Personal Information
//               const TSectionHeading(title: 'Personal Information', showActionButton: false),
//               const SizedBox(height: TSizes.spaceBtwItems),

//               TProfileMenu(
//                   title: 'User ID', value: controller.user.value.id, icon: Iconsax.copy, onPressed: () {}),
//               TProfileMenu(title: 'E-mail', value: controller.user.value.email, onPressed: () {}),
//               TProfileMenu(title: 'Phone Number', value: controller.user.value.phone, onPressed: () {}),
//               TProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
//               TProfileMenu(title: 'Date of Birth', value: '11/11/2024', onPressed: () {}),
//               const Divider(),
//               const SizedBox(height: TSizes.spaceBtwItems),

//               Center(
//                 child: TextButton(
//                   onPressed: () => controller.deleteAccountWarningPopup(),
//                   child: const Text('Delete Account', style: TextStyle(color: Colors.red)),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
