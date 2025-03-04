import 'package:my_house/common/widgets/shimmers/shimmer.dart';
import 'package:my_house/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBoxesShimmer extends StatelessWidget {
  const TBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Row(
        children: [
          Expanded(child: TShimmerEffect(height: 150, width: 110)),
          SizedBox(width: TSizes.spaceBtwItems),
          Expanded(child: TShimmerEffect(height: 150, width: 110)),
          SizedBox(width: TSizes.spaceBtwItems),
          Expanded(child: TShimmerEffect(height: 150, width: 110)),
        ],
      ),
    ]);
  }
}
