import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_house/features/shop/models/product_model.dart';
import 'package:my_house/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  /// variablesRxStr
  RxString selectedProductImage = ''.obs;

  /// get all images from product and variations
  List<String> getAllProductImages(ProductModel product) {
    //use set to add unique imageonly
    Set<String> images = {};

    // load thumbnail image
    images.add(product.thumbnail);

    //assign thumnail as seleted image
    selectedProductImage.value = product.thumbnail;

    // get all images from product model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }

    // get all images from variations if not null
    if (product.productVariations != null || product.productVariations!.isNotEmpty) {
      images.addAll(product.productVariations!.map((variation) => variation.image));
    }
    return images.toList();
  }

  /// show image popup
  void showEnlargedImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: TSizes.defaultSpace * 2, horizontal: TSizes.defaultSpace),
              child: CachedNetworkImage(imageUrl: image),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(onPressed: () => Get.back(), child: const Text('Close')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
