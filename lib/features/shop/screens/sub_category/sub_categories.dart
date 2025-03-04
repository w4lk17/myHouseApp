import 'package:my_house/common/widgets/appbar/appbar.dart';
import 'package:my_house/common/widgets/images/t_rounded_image.dart';
import 'package:my_house/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:my_house/common/widgets/shimmers/horizontal_product_shimmer.dart';
import 'package:my_house/common/widgets/texts/section_heading.dart';
import 'package:my_house/features/shop/controllers/category_controller.dart';
import 'package:my_house/features/shop/models/category_model.dart';
import 'package:my_house/features/shop/screens/all_products/all_products.dart';
import 'package:my_house/utils/constants/image_strings.dart';
import 'package:my_house/utils/constants/sizes.dart';
import 'package:my_house/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return Scaffold(
      appBar: TAppBar(title: Text(category.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Banner
              ///TODO: change this image url
              TRoundedImage(width: double.infinity, imageUrl: TImages.promoBanner1, applyImageRadius: true),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Sub-Categories
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    // handle loader, no record or error messages
                    const loader = THorizontalProductShimmer();
                    final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    //record found!
                    final subCatecories = snapshot.data!;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: subCatecories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final subCategory = subCatecories[index];

                        return FutureBuilder(
                            future: controller.getCategoryProducts(categoryId: subCategory.id),
                            builder: (context, snapshot) {
                              // handle loader, no record or error messages
                              final widget =
                                  TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                              if (widget != null) return widget;

                              // Cool record found!
                              final products = snapshot.data!;

                              return Column(
                                children: [
                                  /// Heading
                                  TSectionHeading(
                                    title: subCategory.name,
                                    onPressed: () => Get.to(
                                      () => AllProducts(
                                        title: subCategory.name,
                                        futureMethod:
                                            controller.getCategoryProducts(categoryId: subCategory.id, limit: -1),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                                  SizedBox(
                                    height: 120,
                                    child: ListView.separated(
                                      itemCount: products.length,
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(width: TSizes.spaceBtwItems),
                                      itemBuilder: (context, index) =>
                                          TProductCardHorizontal(product: products[index]),
                                    ),
                                  ),
                                  const SizedBox(height: TSizes.spaceBtwSections),
                                ],
                              );
                            });
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
