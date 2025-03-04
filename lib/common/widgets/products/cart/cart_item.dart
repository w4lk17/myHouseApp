import 'package:my_house/common/widgets/images/t_rounded_image.dart';
import 'package:my_house/common/widgets/texts/product_title_text.dart';
import 'package:my_house/common/widgets/texts/t_brand_title_text_with_verifed_icon.dart';
import 'package:my_house/features/shop/models/cart_item_model.dart';
import 'package:my_house/utils/constants/colors.dart';
import 'package:my_house/utils/constants/sizes.dart';
import 'package:my_house/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///image
        TRoundedImage(
          isNetworkImage: true,
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          padding: EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        ///-- Title, Price, & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
              TProductTitleText(title: cartItem.title, maxLines: 1),

              /// Attribute
              Text.rich(
                TextSpan(
                  children: (cartItem.selectedVariation ?? {})
                      .entries
                      .map((e) => TextSpan(
                            children: [
                              TextSpan(text: ' ${e.key} ', style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(text: '${e.value} ', style: Theme.of(context).textTheme.bodyLarge),
                            ],
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
