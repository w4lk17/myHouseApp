import 'package:my_house/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:my_house/utils/constants/colors.dart';
import 'package:my_house/utils/constants/sizes.dart';
import 'package:my_house/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.only(left: TSizes.md, right: TSizes.sm, top: TSizes.sm, bottom: TSizes.sm),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
                decoration: const InputDecoration(
              hintText: 'Have a Promo Code? Enter here',
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            )),
          ),

          /// Button to apply coupon code
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: dark
                    ? TColors.white.withAlpha((0.5 * 255).round())
                    : TColors.dark.withAlpha((0.9 * 255).round()),
                backgroundColor: Colors.grey.withAlpha((0.2 * 255).round()),
                side: BorderSide(
                  color: Colors.grey.withAlpha((0.1 * 255).round()),
                ),
              ),
              child: const Text('Apply'),
            ),
          )
        ],
      ),
    );
  }
}
