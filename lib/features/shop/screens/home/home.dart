// import 'package:my_house/common/widgets/custom_shapes/containers/primary_header_container.dart';
// import 'package:my_house/common/widgets/custom_shapes/containers/search_container.dart';
// import 'package:my_house/common/widgets/layouts/grid_layout.dart';
// import 'package:my_house/common/widgets/products/product_cards/product_card_vertical.dart';
// import 'package:my_house/common/widgets/shimmers/vertical_product_shimmer.dart';
// import 'package:my_house/common/widgets/texts/section_heading.dart';
// import 'package:my_house/features/shop/controllers/product/product_controller.dart';
// import 'package:my_house/features/shop/screens/all_products/all_products.dart';
// import 'package:my_house/features/shop/screens/home/widgets/home_appbar.dart';
// import 'package:my_house/features/shop/screens/home/widgets/home_categories.dart';
// import 'package:my_house/features/shop/screens/home/widgets/promo_slider.dart';
// import 'package:my_house/utils/constants/sizes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(ProductController());
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             /// Header
//             TPrimaryHeaderContainer(
//               child: Column(
//                 children: [
//                   /// AppBar
//                   THomeAppBar(),
//                   SizedBox(height: TSizes.spaceBtwSections),

//                   /// Searchbar
//                   TSearchContainer(text: 'Search in Room'),
//                   SizedBox(height: TSizes.spaceBtwSections),

//                   /// Categories
//                   Padding(
//                     padding: EdgeInsets.only(left: TSizes.defaultSpace),
//                     child: Column(
//                       children: [
//                         /// Section Heading
//                         TSectionHeading(
//                           title: 'Popular Categories',
//                           showActionButton: false,
//                           textColor: Colors.white,
//                         ),
//                         SizedBox(height: TSizes.spaceBtwItems),

//                         /// Categories
//                         THomeCategories(),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: TSizes.spaceBtwSections),
//                 ],
//               ),
//             ),

//             /// Body
//             Padding(
//               padding: const EdgeInsets.all(TSizes.defaultSpace),
//               child: Column(
//                 children: [
//                   /// Promo Slider
//                   const TPromoSlider(),
//                   const SizedBox(height: TSizes.spaceBtwSections),

//                   /// Section Heading
//                   TSectionHeading(
//                     title: 'Popular Products',
//                     onPressed: () => Get.to(
//                       () => AllProducts(
//                         title: 'Popular Products',
//                         futureMethod: controller.fetchAllFeaturedProducts(),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: TSizes.spaceBtwItems),

//                   ///Popular products
//                   Obx(() {
//                     if (controller.isLoading.value) return TVerticalProductShimmer();

//                     if (controller.featuredProducts.isEmpty) {
//                       return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium));
//                     }

//                     return TGridLayout(
//                       itemCount: controller.featuredProducts.length,
//                       itemBuilder: (_, index) => TProductCardVertical(product: controller.featuredProducts[index]),
//                     );
//                   }),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
