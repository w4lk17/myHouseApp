// import 'package:my_house/common/widgets/appbar/appbar.dart';
// import 'package:my_house/features/personalization/controllers/address_controller.dart';
// import 'package:my_house/features/personalization/screens/address/add_new_address.dart';
// import 'package:my_house/features/personalization/screens/address/widgets/single_address.dart';
// import 'package:my_house/utils/constants/colors.dart';
// import 'package:my_house/utils/constants/sizes.dart';
// import 'package:my_house/utils/helpers/cloud_helper_functions.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';

// class UserAddressScreen extends StatelessWidget {
//   const UserAddressScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(AddressController());

//     return Scaffold(
//       appBar:
//           TAppBar(showBackArrow: true, title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall)),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(TSizes.defaultSpace),
//           child: Obx(
//             () => FutureBuilder(
//               //use key to trigger refresh
//               key: Key(controller.refreshData.value.toString()),
//               future: controller.getAllUserAddresses(),
//               builder: (context, snapshot) {
//                 // handle loader, no record or error messages
//                 final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
//                 if (response != null) return response;
//                 //addresses found!
//                 final addresses = snapshot.data!;

//                 return ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: addresses.length,
//                   itemBuilder: (_, index) => TSingleAddress(
//                     address: addresses[index],
//                     onTap: () => controller.selectAddress(addresses[index]),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: TColors.primary,
//         onPressed: () => Get.to(() => const AddNewAddressScreen()),
//         child: const Icon(Iconsax.add, color: TColors.white),
//       ),
//     );
//   }
// }
