import 'package:clothes/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:clothes/common/widgets/layouts/grid_layout.dart';
import 'package:clothes/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:clothes/common/widgets/texts/section_heading.dart';
import 'package:clothes/features/shop/controllers/product_controller.dart';
import 'package:clothes/features/shop/screens/all_products/all_products.dart';
import 'package:clothes/util/constants/image_strings.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/home_appbar.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(banners: [
                    TImages.banner3,
                    TImages.banner7,
                    TImages.promoBanner3
                  ]),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  ///heading
                  TSectionHeading(
                      title: 'Sản phẩm mới nhất',
                      showActionButton: true,
                      onPressed: () => Get.to(() => const AllProducts())),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  Obx(
                    () {
                      if(controller.products.isEmpty){
                        return const Center(child: CircularProgressIndicator());
                      }
                      else {
                        return TGridLayout(
                          itemCount: 4,
                          itemBuilder: (_, index) {
                            return TProductCardVertical(product: controller.products[index]);
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
