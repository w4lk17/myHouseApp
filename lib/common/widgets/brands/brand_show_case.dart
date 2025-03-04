import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_house/common/widgets/brands/brand_card.dart';
import 'package:my_house/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:my_house/common/widgets/shimmers/shimmer.dart';
import 'package:my_house/features/shop/models/brand_model.dart';
import 'package:my_house/features/shop/screens/brand/brand_products.dart';
import 'package:my_house/utils/constants/colors.dart';
import 'package:my_house/utils/constants/sizes.dart';
import 'package:my_house/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.images,
    required this.brand,
  });

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: TRoundedContainer(
        showBorder: true,
        borderColor: TColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(TSizes.md),
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        child: Column(
          children: [
            /// -- Brand with product count -- ///
            TBrandCard(showBorder: false, brand: brand),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// -- Brand Top 3 Products Images -- ///
            Row(children: images.map((image) => brandTopProductImageWidget(image, context)).toList()),
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        padding: const EdgeInsets.all(TSizes.md),
        margin: const EdgeInsets.only(right: TSizes.sm),
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          progressIndicatorBuilder: (context, url, downloadProgress) => const TShimmerEffect(
            width: 100,
            height: 100,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
