// import 'package:my_house/data/repositories/authentication/authentication_repository.dart';
// import 'package:my_house/features/personalization/models/address_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';

// class AddressRepository extends GetxController {
//   static AddressRepository get instance => Get.find();

//   final _db = FirebaseFirestore.instance;

//   Future<List<AddressModel>> fetchUserAddresses() async {
//     try {
//       final userId = AuthenticationRepository.instance.authUser.uid;
//       if (userId.isEmpty) throw 'Unable to find User information. Try again in a few minutes.';
//       final result = await _db.collection('Users').doc(userId).collection('Addresses').get();
//       return result.docs.map((documentSnapshot) => AddressModel.fromDocumentSnapshot(documentSnapshot)).toList();
//     } catch (e) {
//       throw 'Something went wrong while fetching Address Information. Try again later';
//     }
//   }

//   //clear the selected  field for all addresses
//   Future<void> updateSelectedField(String addressId, bool selected) async {
//     try {
//       final userId = AuthenticationRepository.instance.authUser.uid;
//       await _db
//           .collection('Users')
//           .doc(userId)
//           .collection('Addresses')
//           .doc(addressId)
//           .update({'SelectedAddress': selected});
//     } catch (e) {
//       throw 'Unable to update your addres selection. Try again later';
//     }
//   }

//   /// store user new address
//   Future<String> addAddress(AddressModel address) async {
//     try {
//       final userId = AuthenticationRepository.instance.authUser.uid;
//       final currentAddress =
//           await _db.collection('Users').doc(userId).collection('Addresses').add(address.toJson());
//       return currentAddress.id;
//     } catch (e) {
//       throw 'Something went wrong while saving Address Information. Try again later';
//     }
//   }
// }
