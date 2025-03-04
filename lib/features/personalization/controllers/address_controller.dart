// import 'package:my_house/common/widgets/loaders/circular_loader.dart';
// import 'package:my_house/common/widgets/texts/section_heading.dart';
// import 'package:my_house/data/repositories/address/address_repository.dart';
// import 'package:my_house/features/personalization/models/address_model.dart';
// import 'package:my_house/features/personalization/screens/address/add_new_address.dart';
// import 'package:my_house/features/personalization/screens/address/widgets/single_address.dart';
// import 'package:my_house/utils/constants/image_strings.dart';
// import 'package:my_house/utils/constants/sizes.dart';
// import 'package:my_house/utils/helpers/cloud_helper_functions.dart';
// import 'package:my_house/utils/helpers/network_manager.dart';
// import 'package:my_house/utils/popups/full_screen_loader.dart';
// import 'package:my_house/utils/popups/loaders.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AddressController extends GetxController {
//   static AddressController get instance => Get.find();

//   final name = TextEditingController();
//   final phoneNumber = TextEditingController();
//   final street = TextEditingController();
//   final city = TextEditingController();
//   final state = TextEditingController();
//   final postalCode = TextEditingController();
//   final country = TextEditingController();
//   GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

//   RxBool refreshData = true.obs;
//   final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
//   final addressRepository = Get.put(AddressRepository());

//   /// fetch all user specific addresses
//   Future<List<AddressModel>> getAllUserAddresses() async {
//     try {
//       final addresses = await addressRepository.fetchUserAddresses();
//       selectedAddress.value =
//           addresses.firstWhere((element) => element.selectedAddress, orElse: () => AddressModel.empty());
//       return addresses;
//     } catch (e) {
//       TLoaders.errorSnackBar(title: 'Address not found!', message: e.toString());
//       return [];
//     }
//   }

//   Future selectAddress(AddressModel newSelectedAddress) async {
//     try {
//       Get.defaultDialog(
//         title: '',
//         onWillPop: () async {
//           return false;
//         },
//         barrierDismissible: false,
//         backgroundColor: Colors.transparent,
//         content: const TCircularLoader(),
//       );

//       //clear the "selected" field
//       if (selectedAddress.value.id.isNotEmpty) {
//         await addressRepository.updateSelectedField(selectedAddress.value.id, false);
//       }
//       // Assign selected address
//       newSelectedAddress.selectedAddress = true;
//       selectedAddress.value = newSelectedAddress;

//       // Set the "selected" field to true for the new selected address
//       await addressRepository.updateSelectedField(newSelectedAddress.id, true);

//       Get.back();
//     } catch (e) {
//       TLoaders.errorSnackBar(title: 'Error in selection', message: e.toString());
//     }
//   }

//   /// Add new address
//   Future addNewAddress() async {
//     try {
//       //start loader
//       TFullScreenLoader.openLoadingDialog('Storing Address...', TImages.docerAnimation);

//       // Check Internet Connection
//       final isConnected = await NetworkManager.instance.isConnected();
//       if (!isConnected) {
//         TFullScreenLoader.stopLoading();
//         return;
//       }

//       //form validation
//       if (!addressFormKey.currentState!.validate()) {
//         TFullScreenLoader.stopLoading();
//         return;
//       }

//       //save address
//       final address = AddressModel(
//         id: '',
//         name: name.text.trim(),
//         phoneNumber: phoneNumber.text.trim(),
//         street: street.text.trim(),
//         city: city.text.trim(),
//         state: state.text.trim(),
//         postalCode: postalCode.text.trim(),
//         country: country.text.trim(),
//         selectedAddress: true,
//       );
//       final id = await addressRepository.addAddress(address);

//       // Update selected address status
//       address.id = id;
//       await selectAddress(address);

//       //remove loader
//       TFullScreenLoader.stopLoading();

//       //show success message
//       TLoaders.successSnackBar(title: 'Congratulations', message: 'Address saved successfully.');

//       // refresh addresses data
//       refreshData.toggle();

//       // reset fields
//       resetFormFields();

//       // redirect
//       Navigator.of(Get.context!).pop();
//     } catch (e) {
//       //remove loader
//       TFullScreenLoader.stopLoading();
//       TLoaders.errorSnackBar(title: 'Error saving Address', message: e.toString());
//     }
//   }

//   /// show address modalbottomsheet at checkout
//   Future<dynamic> selectNewAddressPopup(BuildContext context) {
//     return showModalBottomSheet(
//       context: context,
//       builder: (_) => Container(
//         padding: const EdgeInsets.all(TSizes.lg),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const TSectionHeading(title: 'Select Address', showActionButton: false),
//             FutureBuilder(
//               future: getAllUserAddresses(),
//               builder: (_, snapshot) {
//                 //helper function handle loader, no record or error messages
//                 final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
//                 if (response != null) return response;

//                 return ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (_, index) => TSingleAddress(
//                     address: snapshot.data![index],
//                     onTap: () async {
//                       await selectAddress(snapshot.data![index]);
//                       Get.back();
//                     },
//                   ),
//                 );
//               },
//             ),
//             const SizedBox(height: TSizes.defaultSpace * 2),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                   onPressed: () => Get.to(() => const AddNewAddressScreen()),
//                   child: const Text('Add new address')),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // function to reset form fields
//   void resetFormFields() {
//     name.clear();
//     phoneNumber.clear();
//     street.clear();
//     city.clear();
//     state.clear();
//     postalCode.clear();
//     country.clear();
//     addressFormKey.currentState?.reset();
//   }
// }
