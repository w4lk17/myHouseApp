// import 'package:my_house/common/widgets/images/t_circular_image.dart';
// import 'package:my_house/common/widgets/shimmers/shimmer.dart';
// import 'package:my_house/features/personalization/controllers/user_controller.dart';
// import 'package:my_house/utils/constants/colors.dart';
// import 'package:my_house/utils/constants/image_strings.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';

// class TUserProfileTile extends StatelessWidget {
//   const TUserProfileTile({
//     super.key,
//     required this.onPressed,
//   });

//   final VoidCallback onPressed;

//   @override
//   Widget build(BuildContext context) {
//     final controller = UserController.instance;
//     return ListTile(
//       leading: Obx(() {
//         final networkImage = controller.user.value.profilePicture;
//         final image = networkImage.isNotEmpty ? networkImage : TImages.user;
//         return controller.imageUploading.value
//             ? TShimmerEffect(width: 50, height: 50, radius: 50)
//             : TCircularImage(
//                 image: image, width: 50, height: 50, padding: 0, isNetworkImage: networkImage.isNotEmpty);
//       }),
//       title: Obx(
//         () => Text(
//           controller.user.value.fullName,
//           style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),
//         ),
//       ),
//       subtitle: Obx(
//         () => Text(
//           controller.user.value.email,
//           style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
//         ),
//       ),
//       trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: TColors.white)),
//     );
//   }
// }
