import 'package:clothes/common/widgets/appbar/appbar.dart';
import 'package:clothes/features/personalization/screens/order/widgets/order_list.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// --AppBar
      appBar: TAppBar(title: Text ('My Order', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        /// --Orders
        child: TOrderListItems(),
    
    ),
    );
  }
}