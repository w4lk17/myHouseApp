import 'package:my_house/features/shop/models/brand_model.dart';
import 'package:my_house/utils/exceptions/firebase_exceptions.dart';
import 'package:my_house/utils/exceptions/format_exceptions.dart';
import 'package:my_house/utils/exceptions/platform_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  /// variables
  final _db = FirebaseFirestore.instance;

  /// Get all
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      //Query to get all documents where categoryId matches the provided categoryId
      QuerySnapshot brandCategoryQuery =
          await _db.collection('BrandCategory').where('categoryId', isEqualTo: categoryId).get();

      //extract the brandIds from the documents
      List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();

      //Query to get all documents where the brandId is in the list of brandIds, fieldPath.documentId to query documents in Collection
      final brandQuery =
          await _db.collection('Brands').where(FieldPath.documentId, whereIn: brandIds).limit(2).get();

      //extract brand names or yhe other relevant fields from the documents
      List<BrandModel> brands = brandQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
      return brands;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
