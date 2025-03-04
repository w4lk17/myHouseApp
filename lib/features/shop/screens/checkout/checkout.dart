// import 'package:my_house/common/widgets/appbar/appbar.dart';
// import 'package:my_house/common/widgets/custom_shapes/containers/rounded_container.dart';
// import 'package:my_house/common/widgets/products/cart/coupon_widget.dart';
// import 'package:my_house/features/shop/controllers/product/cart_controller.dart';
// import 'package:my_house/features/shop/controllers/product/order_controller.dart';
// import 'package:my_house/features/shop/screens/cart/widgets/cart_items.dart';
// import 'package:my_house/features/shop/screens/checkout/widgets/billing_address_section.dart';
// import 'package:my_house/features/shop/screens/checkout/widgets/billing_amount_section.dart';
// import 'package:my_house/features/shop/screens/checkout/widgets/billing_payment_section.dart';
// import 'package:my_house/utils/constants/colors.dart';
// import 'package:my_house/utils/constants/sizes.dart';
// import 'package:my_house/utils/helpers/helper_functions.dart';
// import 'package:my_house/utils/helpers/pricing_calculator.dart';
// import 'package:my_house/utils/popups/loaders.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CheckoutScreen extends StatelessWidget {
//   const CheckoutScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cartController = CartController.instance;
//     final subTotal = cartController.totalCartPrice.value;
//     final orderController = Get.put(OrderController());
//     final totalAmount = TPricingCalculator.calculateTotalPrice(subTotal, 'TG');

//     final dark = THelperFunctions.isDarkMode(context);
//     return Scaffold(
//       appBar: TAppBar(
//           showBackArrow: true, title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall)),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(TSizes.defaultSpace),
//         child: Column(
//           children: [
//             /// -- Items in cart
//             const TCartItems(showAddRemoveButtons: false),
//             const SizedBox(height: TSizes.spaceBtwSections),

//             /// -- Coupon Code textfield
//             TCouponCode(),
//             const SizedBox(height: TSizes.spaceBtwSections),

//             /// -- Billing Section
//             TRoundedContainer(
//               showBorder: true,
//               padding: EdgeInsets.all(TSizes.md),
//               backgroundColor: dark ? TColors.black : TColors.white,
//               child: Column(
//                 children: [
//                   /// Price
//                   TBillingAmountSection(),
//                   const SizedBox(height: TSizes.spaceBtwItems),

//                   /// Divider
//                   const Divider(),
//                   const SizedBox(height: TSizes.spaceBtwItems),

//                   /// Payment Method
//                   TBillingPaymentSetion(),
//                   const SizedBox(height: TSizes.spaceBtwItems),

//                   /// Address
//                   TBillingAddressSection(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),

//       /// Checkout Button
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(TSizes.defaultSpace),
//         child: ElevatedButton(
//           onPressed: subTotal > 0
//               ? () => orderController.processOrder(totalAmount)
//               : () => TLoaders.warningSnackBar(
//                   title: 'Empty Cart!', message: 'Add items to cart in order to proceed.'),
//           child: Text('Checkout - \$$totalAmount'),
//         ),
//       ),
//     );
//   }
// }
