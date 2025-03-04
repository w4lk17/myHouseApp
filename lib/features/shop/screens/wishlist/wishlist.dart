// import 'package:my_house/common/widgets/appbar/appbar.dart';
// import 'package:my_house/common/widgets/icons/t_circular_icon.dart';
// import 'package:my_house/common/widgets/layouts/grid_layout.dart';
// import 'package:my_house/common/widgets/loaders/animation_loader.dart';
// import 'package:my_house/common/widgets/products/product_cards/product_card_vertical.dart';
// import 'package:my_house/common/widgets/shimmers/vertical_product_shimmer.dart';
// import 'package:my_house/features/shop/controllers/product/favourites_controller.dart';
// import 'package:my_house/features/shop/screens/home/home.dart';
// import 'package:my_house/navigation_menu.dart';
// import 'package:my_house/utils/constants/image_strings.dart';
// import 'package:my_house/utils/constants/sizes.dart';
// import 'package:my_house/utils/helpers/cloud_helper_functions.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';

// class FavouriteScreen extends StatelessWidget {
//   const FavouriteScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = FavouritesController.instance;

//     return Scaffold(
//       appBar: TAppBar(
//         title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
//         actions: [TCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen()))],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(TSizes.defaultSpace),

//           /// Product Grid
//           child: Obx(
//             () => FutureBuilder(
//               future: controller.favoriteProducts(),
//               builder: (context, snapshot) {
//                 // Nothing found Widget
//                 final emptyWidget = TAnimationLoaderWidget(
//                   text: 'Whoops! Wishlist is empty...',
//                   animation: TImages.pencilAnimation,
//                   showAction: true,
//                   actionText: 'Let\'s add some',
//                   onActionPressed: () => Get.off(() => const NavigationMenu()),
//                 );

//                 /// handle loader, no record or error messages
//                 const loader = TVerticalProductShimmer(itemCount: 6);
//                 final widget = TCloudHelperFunctions.checkMultiRecordState(
//                   snapshot: snapshot,
//                   loader: loader,
//                   nothingFound: emptyWidget,
//                 );
//                 if (widget != null) return widget;

//                 //products found!
//                 final products = snapshot.data!;

//                 return TGridLayout(
//                     itemCount: products.length,
//                     itemBuilder: (_, index) => TProductCardVertical(product: products[index]));
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
