import 'package:my_house/common/widgets/icons/t_circular_icon.dart';
import 'package:my_house/features/shop/controllers/product/favourites_controller.dart';
import 'package:my_house/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TFavouriteIcon extends StatelessWidget {
  const TFavouriteIcon({
    super.key,
    required this.prodctId,
  });

  final String prodctId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(
      () => TCircularIcon(
        icon: controller.isFavourite(prodctId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavourite(prodctId) ? TColors.error : null,
        onPressed: () => controller.toggleFavoriteProduct(prodctId),
      ),
    );
  }
}
