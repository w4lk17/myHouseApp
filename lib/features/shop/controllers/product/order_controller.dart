// import 'package:my_house/common/widgets/success_screen/success_screen.dart';
// import 'package:my_house/data/repositories/authentication/authentication_repository.dart';
// import 'package:my_house/data/repositories/order/order_repository.dart';
// import 'package:my_house/features/personalization/controllers/address_controller.dart';
// import 'package:my_house/features/shop/controllers/product/cart_controller.dart';
// import 'package:my_house/features/shop/controllers/product/checkout_controller.dart';
// import 'package:my_house/features/shop/models/order_model.dart';
// import 'package:my_house/navigation_menu.dart';
// import 'package:my_house/utils/constants/enums.dart';
// import 'package:my_house/utils/constants/image_strings.dart';
// import 'package:my_house/utils/popups/full_screen_loader.dart';
// import 'package:my_house/utils/popups/loaders.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';

// class OrderController extends GetxController {
//   static OrderController get instance => Get.find();

//   ///Variables
//   final cartController = CartController.instance;
//   final addressController = AddressController.instance;
//   final checkoutController = CheckoutController.instance;
//   final orderRepository = Get.put(OrderRepository());

//   /// fetch User Order history
//   Future<List<OrderModel>> fetchUserOrders() async {
//     try {
//       final userOrders = await orderRepository.fetchUserOrders();

//       return userOrders;
//     } catch (e) {
//       TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
//       return [];
//     }
//   }

//   /// Add method for order processing
//   void processOrder(double totalAmount) async {
//     try {
//       // start loader
//       TFullScreenLoader.openLoadingDialog('Processing', TImages.pencilAnimation);

//       // get user authentication Id
//       final userId = AuthenticationRepository.instance.authUser.uid;
//       if (userId.isEmpty) return;

//       // add details
//       final order = OrderModel(
//         //Generate a unique ID forthe order
//         id: UniqueKey().toString(),
//         userId: userId,
//         status: OrderStatus.pending,
//         totalAmount: totalAmount,
//         orderDate: DateTime.now(),
//         paymentMethod: checkoutController.selectedPaymentMethod.value.name,
//         address: addressController.selectedAddress.value,
//         //set date as needed
//         deliveryDate: DateTime.now(),
//         items: cartController.cartItems.toList(),
//       );

//       //save the order to firestore
//       await orderRepository.saveOrder(order, userId);

//       //update the cart status
//       cartController.clearCart();

//       //show success screen
//       Get.off(
//         () => SuccessScreen(
//           image: TImages.orderCompletedAnimation,
//           title: 'Payment Success',
//           subTitle: 'Your item will be shipped soon',
//           onPressed: () => Get.offAll(() => const NavigationMenu()),
//         ),
//       );
//     } catch (e) {
//       TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
//     }
//   }
// }
