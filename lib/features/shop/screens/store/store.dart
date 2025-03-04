import 'package:my_house/common/widgets/appbar/appbar.dart';
import 'package:my_house/common/widgets/appbar/tabbar.dart';
import 'package:my_house/common/widgets/brands/brand_card.dart';
import 'package:my_house/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:my_house/common/widgets/layouts/grid_layout.dart';
import 'package:my_house/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:my_house/common/widgets/shimmers/brands_shimmer.dart';
import 'package:my_house/common/widgets/texts/section_heading.dart';
import 'package:my_house/features/shop/controllers/brand_controller.dart';
import 'package:my_house/features/shop/controllers/category_controller.dart';
import 'package:my_house/features/shop/screens/brand/all_brands.dart';
import 'package:my_house/features/shop/screens/brand/brand_products.dart';
import 'package:my_house/features/shop/screens/store/widgets/category_tab.dart';
import 'package:my_house/utils/constants/colors.dart';
import 'package:my_house/utils/constants/sizes.dart';
import 'package:my_house/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [TCartCounterIcon()],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                expandedHeight: 440, // Space between appbar and tabBar
                automaticallyImplyLeading: false,
                backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
                flexibleSpace: Padding(
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// --Search bar -- ///
                      SizedBox(height: TSizes.spaceBtwItems),
                      TSearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(height: TSizes.spaceBtwSections),

                      /// -- Feature Brands -- ///
                      TSectionHeading(
                        title: 'Featured Brands',
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                        showActionButton: true,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      /// -- Brand Grid Layout -- ///
                      Obx(
                        () {
                          if (brandController.isLoading.value) return const TBrandsShimmer();

                          if (brandController.featuredBrands.isEmpty) {
                            return Center(
                              child: Text('No Data Found!',
                                  style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)),
                            );
                          }

                          return TGridLayout(
                            itemCount: brandController.featuredBrands.length,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              final brand = brandController.featuredBrands[index];
                              return TBrandCard(
                                showBorder: true,
                                brand: brand,
                                onTap: () => Get.to(() => BrandProducts(brand: brand)),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),

                ///-- Tabs ---///
                bottom: TTabBar(tabs: categories.map((category) => Tab(child: Text(category.name))).toList()),
              ),
            ];
          },

          ///-- Body --///
          body: TabBarView(children: categories.map((category) => TCategoryTab(category: category)).toList()),
        ),
      ),
    );
  }
}
