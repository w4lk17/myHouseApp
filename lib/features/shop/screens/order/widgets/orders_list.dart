// import 'package:my_house/common/widgets/custom_shapes/containers/rounded_container.dart';
// import 'package:my_house/common/widgets/loaders/animation_loader.dart';
// import 'package:my_house/features/shop/controllers/product/order_controller.dart';
// import 'package:my_house/navigation_menu.dart';
// import 'package:my_house/utils/constants/colors.dart';
// import 'package:my_house/utils/constants/image_strings.dart';
// import 'package:my_house/utils/constants/sizes.dart';
// import 'package:my_house/utils/helpers/cloud_helper_functions.dart';
// import 'package:my_house/utils/helpers/helper_functions.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';

// class TOrderListItems extends StatelessWidget {
//   const TOrderListItems({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(OrderController());
//     final dark = THelperFunctions.isDarkMode(context);

//     return FutureBuilder(
//         future: controller.fetchUserOrders(),
//         builder: (context, snapshot) {
//           // nothing found widget
//           final emptyWidget = TAnimationLoaderWidget(
//             text: 'Woops! No orders yet!',
//             animation: TImages.orderCompletedAnimation,
//             showAction: true,
//             actionText: 'Let\'s fill it',
//             onActionPressed: () => Get.off(() => const NavigationMenu()),
//           );

//           // handle loader, no record or error messages
//           final response =
//               TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, nothingFound: emptyWidget);
//           if (response != null) return response;

//           // orders found!
//           final orders = snapshot.data!;

//           return ListView.separated(
//               shrinkWrap: true,
//               itemCount: orders.length,
//               separatorBuilder: (_, index) => const SizedBox(height: TSizes.spaceBtwItems),
//               itemBuilder: (_, index) {
//                 final order = orders[index];

//                 return TRoundedContainer(
//                   showBorder: true,
//                   padding: const EdgeInsets.all(TSizes.md),
//                   backgroundColor: dark ? TColors.dark : TColors.light,
//                   child: Column(
//                     // mainAxisSize: MainAxisSize.min,
//                     children: [
//                       /// Row 1
//                       Row(
//                         children: [
//                           /// Icon
//                           Icon(Iconsax.ship),
//                           const SizedBox(width: TSizes.spaceBtwItems / 2),

//                           /// Status and Date
//                           Expanded(
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   order.orderStatusText,
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodyLarge!
//                                       .apply(color: TColors.primary, fontWeightDelta: 1),
//                                 ),
//                                 Text(order.formattedOrderDate, style: Theme.of(context).textTheme.headlineSmall)
//                               ],
//                             ),
//                           ),

//                           /// icon
//                           IconButton(
//                               onPressed: () {}, icon: const Icon(Iconsax.arrow_right_34, size: TSizes.iconSm)),
//                         ],
//                       ),
//                       const SizedBox(height: TSizes.spaceBtwItems),

//                       /// Row 2
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Row(
//                               children: [
//                                 /// Icon
//                                 Icon(Iconsax.tag),
//                                 const SizedBox(width: TSizes.spaceBtwItems / 2),

//                                 /// Status and Date
//                                 Expanded(
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text('Order', style: Theme.of(context).textTheme.labelMedium),
//                                       Text(order.id, style: Theme.of(context).textTheme.titleMedium),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Expanded(
//                             child: Row(
//                               children: [
//                                 /// Icon
//                                 Icon(Iconsax.calendar),
//                                 const SizedBox(width: TSizes.spaceBtwItems / 2),

//                                 /// Status and Date
//                                 Expanded(
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text('Shipping Date', style: Theme.of(context).textTheme.labelMedium),
//                                       Text(order.formattedDeliveryDate,
//                                           style: Theme.of(context).textTheme.titleMedium),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               });
//         });
//   }
// }
