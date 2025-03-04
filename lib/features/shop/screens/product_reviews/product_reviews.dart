import 'package:my_house/common/widgets/appbar/appbar.dart';
import 'package:my_house/common/widgets/products/ratings/rating_indicator.dart';
import 'package:my_house/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:my_house/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:my_house/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///Appbar
      appBar: TAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),

      /// --Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Ratings and Reviews are verified and are from peple who use the same type of device that you use.'),
              SizedBox(height: TSizes.spaceBtwItems),

              ///overall product ratings
              TOverallProductRating(),
              TRatingBarIndicator(rating: 3.5),
              Text('12,345', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// --User reviews List
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
