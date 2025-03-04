// import 'package:my_house/common/widgets/appbar/appbar.dart';
// import 'package:my_house/features/personalization/controllers/address_controller.dart';
// import 'package:my_house/utils/constants/sizes.dart';
// import 'package:my_house/utils/validators/validation.dart';
// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';

// class AddNewAddressScreen extends StatelessWidget {
//   const AddNewAddressScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = AddressController.instance;

//     return Scaffold(
//       appBar: TAppBar(showBackArrow: true, title: Text('Add New Address')),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(TSizes.defaultSpace),
//           child: Form(
//             key: controller.addressFormKey,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextFormField(
//                   controller: controller.name,
//                   validator: (value) => TValidator.validateEmptyText('Name', value),
//                   decoration: InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Name'),
//                 ),
//                 const SizedBox(height: TSizes.spaceBtwInputFields),
//                 TextFormField(
//                   controller: controller.phoneNumber,
//                   validator: TValidator.validatePhoneNumber,
//                   decoration: InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'Mobile Number'),
//                 ),
//                 const SizedBox(height: TSizes.spaceBtwInputFields),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         controller: controller.street,
//                         validator: (value) => TValidator.validateEmptyText('Street', value),
//                         decoration: InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: 'Street'),
//                       ),
//                     ),
//                     const SizedBox(width: TSizes.spaceBtwInputFields),
//                     Expanded(
//                       child: TextFormField(
//                         controller: controller.postalCode,
//                         validator: (value) => TValidator.validateEmptyText('Postal Code', value),
//                         decoration: InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: 'Postal Code'),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: TSizes.spaceBtwInputFields),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         controller: controller.city,
//                         validator: (value) => TValidator.validateEmptyText('City', value),
//                         decoration: InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'City'),
//                       ),
//                     ),
//                     const SizedBox(width: TSizes.spaceBtwInputFields),
//                     Expanded(
//                       child: TextFormField(
//                         controller: controller.state,
//                         validator: (value) => TValidator.validateEmptyText('State', value),
//                         decoration: InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: 'State'),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: TSizes.spaceBtwInputFields),
//                 TextFormField(
//                   controller: controller.country,
//                   validator: (value) => TValidator.validateEmptyText('Country', value),
//                   decoration: InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
//                 ),
//                 const SizedBox(height: TSizes.spaceBtwInputFields),

//                 ///TODO: make textview clickable to Add Google Map
//                 // TextFormField(
//                 //     decoration: InputDecoration(prefixIcon: Icon(Iconsax.map), labelText: 'Pick from Maps')),
//                 const SizedBox(height: TSizes.defaultSpace),
//                 SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       child: const Text('Save'),
//                       onPressed: () => controller.addNewAddress(),
//                     )),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
