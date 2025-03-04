import 'package:my_house/common/widgets/appbar/appbar.dart';
import 'package:my_house/common/widgets/brands/brand_card.dart';
import 'package:my_house/common/widgets/products/sortable/sortable_products.dart';
import 'package:my_house/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:my_house/features/shop/controllers/brand_controller.dart';
import 'package:my_house/features/shop/models/brand_model.dart';
import 'package:my_house/utils/constants/sizes.dart';
import 'package:my_house/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(title: Text(brand.name), showBackArrow: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Brand details
            TBrandCard(showBorder: true, brand: brand),
            SizedBox(height: TSizes.spaceBtwSections),

            FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id),
                builder: (context, snapshot) {
                  ///handle loader, no record or error messages
                  const loader = TVerticalProductShimmer();
                  final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  ///products found!
                  final brandProducts = snapshot.data!;
                  return TSortableProducts(products: brandProducts);
                }),
          ],
        ),
      ),
    );
  }
}
