// import 'package:my_house/common/widgets/appbar/appbar.dart';
// import 'package:my_house/common/widgets/custom_shapes/containers/primary_header_container.dart';
// import 'package:my_house/common/widgets/list_tiles/settings_menu_tile.dart';
// import 'package:my_house/common/widgets/list_tiles/user_profile_tile.dart';
// import 'package:my_house/common/widgets/texts/section_heading.dart';
// import 'package:my_house/data/repositories/authentication/authentication_repository.dart';
// import 'package:my_house/features/personalization/screens/address/address.dart';
// import 'package:my_house/features/personalization/screens/profile/profile.dart';
// import 'package:my_house/features/shop/screens/cart/cart.dart';
// import 'package:my_house/features/shop/screens/order/order.dart';
// import 'package:my_house/utils/constants/colors.dart';
// import 'package:my_house/utils/constants/sizes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';

// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             ///--Header
//             TPrimaryHeaderContainer(
//               child: Column(
//                 children: [
//                   TAppBar(
//                     title: Text('Account',
//                         style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white)),
//                   ),

//                   ///--User profil card
//                   TUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
//                   const SizedBox(height: TSizes.spaceBtwSections),
//                 ],
//               ),
//             ),

//             ///--Body
//             Padding(
//               padding: const EdgeInsets.all(TSizes.defaultSpace),
//               child: Column(
//                 children: [
//                   ///--Account Settings
//                   TSectionHeading(title: 'Account Settings', showActionButton: false),
//                   const SizedBox(height: TSizes.spaceBtwItems),

//                   TSettingsMenuTile(
//                     icon: Iconsax.safe_home,
//                     title: 'My Address',
//                     subtitle: 'Set shipping delivery address',
//                     onTap: () => Get.to(() => const UserAddressScreen()),
//                   ),
//                   TSettingsMenuTile(
//                     icon: Iconsax.shopping_cart,
//                     title: 'My Cart',
//                     subtitle: 'Set shipping delivery address',
//                     onTap: () => Get.to(() => const CartScreen()),
//                   ),
//                   TSettingsMenuTile(
//                     icon: Iconsax.bag_tick,
//                     title: 'My Orders',
//                     subtitle: 'Set shipping delivery address',
//                     onTap: (){}, //=> Get.to(() => const OrderScreen()),
//                   ),
//                   TSettingsMenuTile(
//                     icon: Iconsax.bank,
//                     title: 'Bank  Account',
//                     subtitle: 'Set shipping delivery address',
//                     onTap: () {},
//                   ),
//                   TSettingsMenuTile(
//                     icon: Iconsax.discount_shape,
//                     title: 'My Coupouns',
//                     subtitle: 'Set shipping delivery address',
//                     onTap: () {},
//                   ),
//                   TSettingsMenuTile(
//                     icon: Iconsax.notification,
//                     title: 'Notifications',
//                     subtitle: 'Set shipping delivery address',
//                     onTap: () {},
//                   ),
//                   TSettingsMenuTile(
//                     icon: Iconsax.security_card,
//                     title: 'Account Privacy',
//                     subtitle: 'Set shipping delivery address',
//                     onTap: () {},
//                   ),

//                   ///--App Settings
//                   SizedBox(height: TSizes.spaceBtwSections),

//                   TSectionHeading(title: 'App Settings', showActionButton: false),
//                   const SizedBox(height: TSizes.spaceBtwItems),

//                   TSettingsMenuTile(
//                     icon: Iconsax.document_upload,
//                     title: 'Load Data',
//                     subtitle: 'Upload data to your cloud firebase ',
//                     onTap: () {},
//                   ),
//                   TSettingsMenuTile(
//                     icon: Iconsax.location,
//                     title: 'Geolocation',
//                     subtitle: 'Set recommendation based on your location',
//                     trailing: Switch(value: true, onChanged: (value) {}),
//                   ),
//                   TSettingsMenuTile(
//                     icon: Iconsax.security_user,
//                     title: 'Safe Mode',
//                     subtitle: 'Set your location',
//                     trailing: Switch(value: false, onChanged: (value) {}),
//                   ),
//                   TSettingsMenuTile(
//                     icon: Iconsax.image,
//                     title: 'HD Image Quality',
//                     subtitle: 'Set Image quality to be seen',
//                     trailing: Switch(value: false, onChanged: (value) {}),
//                   ),

//                   /// Logout button
//                   const SizedBox(height: TSizes.spaceBtwSections),
//                   SizedBox(
//                     width: double.infinity,
//                     child: OutlinedButton(
//                       onPressed: (){},// => AuthenticationRepository.instance.logout(),
//                       child: const Text('Logout'),
//                     ),
//                   ),
//                   const SizedBox(height: TSizes.spaceBtwSections * 2.5),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
