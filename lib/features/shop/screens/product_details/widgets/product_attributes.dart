import 'package:my_house/common/widgets/chips/choice_chip.dart';
import 'package:my_house/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:my_house/common/widgets/texts/product_price_text.dart';
import 'package:my_house/common/widgets/texts/product_title_text.dart';
import 'package:my_house/common/widgets/texts/section_heading.dart';
import 'package:my_house/features/shop/controllers/product/variations_controller.dart';
import 'package:my_house/features/shop/models/product_model.dart';
import 'package:my_house/utils/constants/colors.dart';
import 'package:my_house/utils/constants/sizes.dart';
import 'package:my_house/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationsController());
    final dark = THelperFunctions.isDarkMode(context);

    return Obx(
      () => Column(
        children: [
          ///-- Selected Attributes Pricing and Description --///
          //Display variation price and stock when some variation is selected
          if (controller.selectedVariation.value.id.isNotEmpty)
            TRoundedContainer(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
              child: Column(
                children: [
                  /// -- Title, Price & Status  --///
                  Row(
                    children: [
                      const TSectionHeading(title: 'Variation', showActionButton: false),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const TProductTitleText(title: 'Price : ', smallSize: true),

                              /// -- Actual Price --///
                              if (controller.selectedVariation.value.salePrice > 0)
                                Text(
                                  '\$${controller.selectedVariation.value.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(decoration: TextDecoration.lineThrough),
                                ),
                              const SizedBox(width: TSizes.spaceBtwItems),

                              /// Sale Price
                              TProductPriceText(price: controller.getVariationPrice())
                            ],
                          ),

                          /// --Stock
                          Row(
                            children: [
                              TProductTitleText(title: 'Stock : ', smallSize: true),
                              Text(controller.variationStockStatus.value,
                                  style: Theme.of(context).textTheme.titleMedium)
                            ],
                          )
                        ],
                      ),
                    ],
                  ),

                  /// -- Variation Description --///
                  TProductTitleText(
                    title: controller.selectedVariation.value.description ?? '',
                    smallSize: true,
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          SizedBox(height: TSizes.spaceBtwItems),

          /// -- Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map((attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TSectionHeading(title: attribute.name ?? '', showActionButton: false),
                        SizedBox(height: TSizes.spaceBtwItems / 2),
                        Obx(
                          () => Wrap(
                            spacing: 8,
                            children: attribute.values!.map((attributeValue) {
                              final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                              final available = controller
                                  .getAttributeAvailabilityInVariation(product.productVariations!, attribute.name!)
                                  .contains(attributeValue);

                              return TChoiceChip(
                                text: attributeValue,
                                selected: isSelected,
                                onSelected: available
                                    ? (selected) {
                                        if (selected && available) {
                                          controller.onAttributeSelected(
                                              product, attribute.name ?? '', attributeValue);
                                        }
                                      }
                                    : null,
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
