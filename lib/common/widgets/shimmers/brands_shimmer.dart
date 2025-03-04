import 'package:my_house/common/widgets/layouts/grid_layout.dart';
import 'package:my_house/common/widgets/shimmers/shimmer.dart';
import 'package:flutter/material.dart';

class TBrandsShimmer extends StatelessWidget {
  const TBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      itemCount: itemCount,
      mainAxisExtent: 80,
      itemBuilder: (_, index) => const TShimmerEffect(width: 300, height: 80),
    );
  }
}
