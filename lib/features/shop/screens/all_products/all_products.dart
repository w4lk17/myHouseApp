import 'package:my_house/common/widgets/appbar/appbar.dart';
import 'package:my_house/common/widgets/products/sortable/sortable_products.dart';
import 'package:my_house/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:my_house/features/shop/controllers/all_products_controller.dart';
import 'package:my_house/features/shop/models/product_model.dart';
import 'package:my_house/utils/constants/sizes.dart';
import 'package:my_house/utils/helpers/cloud_helper_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());

    return Scaffold(
      appBar: TAppBar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
              // check the state of the FutureBuilder snapshot
              const loader = TVerticalProductShimmer();
              final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

              // return appropriate widget based on snapshot state
              if (widget != null) return widget;

              //products found!
              final products = snapshot.data!;

              return TSortableProducts(products: products);
            },
          ),
        ),
      ),
    );
  }
}
