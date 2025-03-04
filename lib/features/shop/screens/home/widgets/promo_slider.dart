import 'package:my_house/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:my_house/common/widgets/images/t_rounded_image.dart';
import 'package:my_house/common/widgets/shimmers/shimmer.dart';
import 'package:my_house/features/shop/controllers/banner_controller.dart';
import 'package:my_house/utils/constants/colors.dart';
import 'package:my_house/utils/constants/sizes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
      () {
        // loader
        if (controller.isLoading.value) return const TShimmerEffect(width: double.infinity, height: 190);
        // No Data
        if (controller.banners.isEmpty) {
          return const Center(child: Text('No Data Found!'));
        } else {
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    viewportFraction: 1, onPageChanged: (index, _) => controller.updatePageIndicator(index)),
                items: controller.banners
                    .map(
                      (banner) => TRoundedImage(
                        imageUrl: banner.imageUrl,
                        isNetworkImage: true,
                        onPressed: () => Get.toNamed(banner.targetScreen),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Center(
                child: Obx(
                  () => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < controller.banners.length; i++)
                        TRoundedContainer(
                          width: 20,
                          height: 4,
                          margin: const EdgeInsets.only(right: 10),
                          backgroundColor: controller.carouselCurentIndex == i ? TColors.primary : TColors.grey,
                        ),
                    ],
                  ),
                ),
              )
            ],
          );
        }
      },
    );
  }
}
