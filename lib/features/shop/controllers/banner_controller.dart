import 'package:my_house/data/repositories/banners/banner_repository.dart';
import 'package:my_house/features/shop/models/banner_model.dart';
import 'package:my_house/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  /// Variables
  final isLoading = false.obs;
  final carouselCurentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  /// Update Navigation Dots
  void updatePageIndicator(index) {
    carouselCurentIndex.value = index;
  }

  /// Fetch Banners
  Future<void> fetchBanners() async {
    try {
      // show loader while loading categorie
      isLoading.value = true;

      // Fetch banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      // assign banners
      this.banners.assignAll(banners);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }
}
