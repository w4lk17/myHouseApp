import 'package:my_house/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:my_house/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:my_house/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(
      child: Container(
        color: TColors.primary,

        /// -- If [size.isInfinite] is not true in Stack] error occurred, ->
        child: Stack(
          children: [
            /// Background Custom shapes
            Positioned(
              top: -150,
              right: -250,
              child: TRoundedContainer(
                height: 400,
                width: 400,
                radius: 400,
                padding: EdgeInsets.all(0),
                backgroundColor: TColors.textWhite.withAlpha((0.1 * 255).round()),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: TRoundedContainer(
                height: 400,
                width: 400,
                radius: 400,
                padding: const EdgeInsets.all(0),
                backgroundColor: TColors.textWhite.withAlpha((0.1 * 255).round()),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
