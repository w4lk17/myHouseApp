import 'package:my_house/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: TColors.darkGrey.withAlpha((0.1 * 255).round()),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: TColors.darkGrey.withAlpha((0.1 * 255).round()),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(2, 0),
  );
}
