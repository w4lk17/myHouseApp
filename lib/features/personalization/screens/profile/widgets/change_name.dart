// import 'package:my_house/common/widgets/appbar/appbar.dart';
// import 'package:my_house/features/personalization/controllers/update_name_controller.dart';
// import 'package:my_house/utils/constants/sizes.dart';
// import 'package:my_house/utils/constants/text_strings.dart';
// import 'package:my_house/utils/validators/validation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';

// class ChangeName extends StatelessWidget {
//   const ChangeName({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(UpdateNameController());

//     return Scaffold(
//       appBar: TAppBar(
//           showBackArrow: true, title: Text('Change Name', style: Theme.of(context).textTheme.headlineSmall)),
//       body: Padding(
//         padding: const EdgeInsets.all(TSizes.defaultSpace),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /// Heading
//             Text('Use real name for easy verification. This name will appear on several pages.',
//                 style: Theme.of(context).textTheme.labelMedium),
//             const SizedBox(height: TSizes.spaceBtwItems),

//             ///Text field and button
//             Form(
//               key: controller.updateUserNameFormKey,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     controller: controller.firstName,
//                     validator: (value) => TValidator.validateEmptyText('First name', value),
//                     expands: false,
//                     decoration: InputDecoration(labelText: TTexts.firstName, prefixIcon: const Icon(Iconsax.user)),
//                   ),
//                   const SizedBox(height: TSizes.spaceBtwInputFields),
//                   TextFormField(
//                     controller: controller.lastName,
//                     validator: (value) => TValidator.validateEmptyText('Last name', value),
//                     expands: false,
//                     decoration: InputDecoration(labelText: TTexts.lastName, prefixIcon: const Icon(Iconsax.user)),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: TSizes.spaceBtwSections),

//             /// save button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () => controller.updateUserName(),
//                 child: const Text('Save'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
