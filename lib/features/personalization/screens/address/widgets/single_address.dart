// import 'package:my_house/common/widgets/custom_shapes/containers/rounded_container.dart';
// import 'package:my_house/features/personalization/controllers/address_controller.dart';
// import 'package:my_house/features/personalization/models/address_model.dart';
// import 'package:my_house/utils/constants/colors.dart';
// import 'package:my_house/utils/constants/sizes.dart';
// import 'package:my_house/utils/helpers/helper_functions.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';

// class TSingleAddress extends StatelessWidget {
//   const TSingleAddress({
//     super.key,
//     required this.address,
//     required this.onTap,
//   });

//   final AddressModel address;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     final controller = AddressController.instance;
//     final dark = THelperFunctions.isDarkMode(context);

//     return Obx(() {
//       final selectedAddressId = controller.selectedAddress.value.id;
//       final selectedAddress = selectedAddressId == address.id;
//       return InkWell(
//         onTap: onTap,
//         child: TRoundedContainer(
//           width: double.infinity,
//           padding: EdgeInsets.all(TSizes.md),
//           showBorder: true,
//           backgroundColor: selectedAddress ? TColors.primary.withAlpha((0.5 * 255).round()) : Colors.transparent,
//           borderColor: selectedAddress
//               ? Colors.transparent
//               : dark
//                   ? TColors.darkerGrey
//                   : TColors.grey,
//           margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
//           child: Stack(
//             children: [
//               Positioned(
//                 right: 5,
//                 top: 0,
//                 child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
//                     color: selectedAddress
//                         ? dark
//                             ? TColors.light
//                             : TColors.dark
//                         : null),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     address.name,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: Theme.of(context).textTheme.titleLarge,
//                   ),
//                   const SizedBox(height: TSizes.sm / 2),
//                   Text(address.formattedPhoneNo, maxLines: 1, overflow: TextOverflow.ellipsis),
//                   const SizedBox(height: TSizes.sm / 2),
//                   Text(address.toString(), softWrap: true),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
