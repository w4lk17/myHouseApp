import 'package:my_house/common/widgets/appbar/appbar.dart';
import 'package:my_house/common/widgets/loaders/animation_loader.dart';
import 'package:my_house/features/shop/controllers/product/cart_controller.dart';
import 'package:my_house/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:my_house/navigation_menu.dart';
import 'package:my_house/utils/constants/image_strings.dart';
import 'package:my_house/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: Obx(() {
        /// Nothing Find widget
        final emptyWidget = TAnimationLoaderWidget(
          text: 'Whoops! Cart is empty...',
          animation: TImages.cartAnimation,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),

              /// Items in Cart
              child: TCartItems(),
            ),
          );
        }
      }),

      /// Checkout Button
      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: ElevatedButton(
                onPressed: (){},// => Get.to(() => const CheckoutScreen()),
                child: Obx(() => Text('Checkout - \$${controller.totalCartPrice.value}')),
              ),
            ),
    );
  }
}
