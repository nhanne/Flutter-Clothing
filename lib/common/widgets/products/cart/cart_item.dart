import 'package:clothes/common/widgets/images/t_rounded_image.dart';
import 'package:clothes/common/widgets/texts/product_title_text.dart';
import 'package:clothes/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:clothes/util/constants/colors.dart';
import 'package:clothes/util/constants/image_strings.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:clothes/util/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        TRoundedImage(
            imageUrl: TImages.productImage7,
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkGrey : TColors.light),
        const SizedBox(width: TSizes.spaceBtwItems),

        /// Title, Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(child: TProductTitleText(title: 'Jordan 1 Shoes', maxLines: 1)),
              /// Attributes
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text: 'Color', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: ' White Red ', style: Theme.of(context).textTheme.bodyLarge),
                        TextSpan(text: ' Size ', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'UK 08', style: Theme.of(context).textTheme.bodyLarge),
                      ]
                  )
              )
            ],
          ),
        )
      ],
    );
  }
}