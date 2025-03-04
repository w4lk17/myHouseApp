import 'package:my_house/common/widgets/brands/brand_show_case.dart';
import 'package:my_house/common/widgets/shimmers/boxes_shimmer.dart';
import 'package:my_house/common/widgets/shimmers/list_tile_shimmer.dart';
import 'package:my_house/features/shop/controllers/brand_controller.dart';
import 'package:my_house/features/shop/models/category_model.dart';
import 'package:my_house/utils/constants/sizes.dart';
import 'package:my_house/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;

    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {
        // handle loader, no record or error messages
        const loader = Column(
          children: [
            TListTileShimmer(),
            SizedBox(height: TSizes.spaceBtwItems),
            TBoxesShimmer(),
            SizedBox(height: TSizes.spaceBtwItems),
          ],
        );
        final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
        if (widget != null) return widget;

        //brands found!
        final brands = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (_, index) {
            final brand = brands[index];
            return FutureBuilder(
              future: controller.getBrandProducts(brandId: brand.id, limit: 3),
              builder: (context, snapshot) {
                // handle loader, no record or error messages

                final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                if (widget != null) return widget;

                //products found!
                final products = snapshot.data!;

                return TBrandShowcase(
                  brand: brand,
                  images: products.map((e) => e.thumbnail).toList(),
                );
              },
            );
          },
        );
      },
    );
  }
}
