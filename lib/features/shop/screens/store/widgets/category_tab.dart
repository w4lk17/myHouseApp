import 'package:my_house/common/widgets/layouts/grid_layout.dart';
import 'package:my_house/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:my_house/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:my_house/common/widgets/texts/section_heading.dart';
import 'package:my_house/features/shop/controllers/category_controller.dart';
import 'package:my_house/features/shop/models/category_model.dart';
import 'package:my_house/features/shop/screens/all_products/all_products.dart';
import 'package:my_house/features/shop/screens/store/widgets/category_brands.dart';
import 'package:my_house/utils/constants/sizes.dart';
import 'package:my_house/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              CategoryBrands(category: category),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// -- Products -- ///
              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context, snapshot) {
                  // handle loader, no record or error messages

                  final response = TCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot, loader: const TVerticalProductShimmer());
                  if (response != null) return response;

                  //products found!
                  final products = snapshot.data!;

                  return Column(
                    children: [
                      TSectionHeading(
                        title: 'You might like',
                        showActionButton: true,
                        onPressed: () => Get.to(
                          () => AllProducts(
                            title: category.name,
                            futureMethod: controller.getCategoryProducts(categoryId: category.id, limit: -1),
                          ),
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      TGridLayout(
                        itemCount: products.length,
                        itemBuilder: (_, index) => TProductCardVertical(product: products[index]),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
