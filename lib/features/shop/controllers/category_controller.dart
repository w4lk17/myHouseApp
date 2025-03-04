import 'package:my_house/data/repositories/categories/category_repository.dart';
import 'package:my_house/data/repositories/product/product_repository.dart';
import 'package:my_house/features/shop/models/category_model.dart';
import 'package:my_house/features/shop/models/product_model.dart';
import 'package:my_house/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// -- Load categorie data
  Future<void> fetchCategories() async {
    try {
      // show loader while loading categorie
      isLoading.value = true;

      // Fetch categorie from data source (Firestore, API, etc)
      final categories = await _categoryRepository.getAllCategories();

      // Update the categories list
      allCategories.assignAll(categories);

      // Filter feature categories
      featuredCategories.assignAll(
          allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }

  /// -- load selected categorie data
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final subCategories = await _categoryRepository.getSubCategories(categoryId);

      return subCategories;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// -- Get category or Sub-Categorie products
  Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {
    try {
      //fetch limited (4) products against each subCategory
      final products =
          await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);

      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
}
