import 'package:clothes/common/widgets/appbar/appbar.dart';
import 'package:clothes/util/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Add new Address')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Name')),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'Phone Number')),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31),labelText: 'Phone Number'))),
                    const SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code),labelText: 'Phone Number'))),
                  ],
                ),
                 const SizedBox(height: TSizes.spaceBtwInputFields),
                  Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building),labelText: 'Phone Number'))),
                    const SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity),labelText: 'Phone Number'))),
                  ],
                ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: 'country')),
                  const SizedBox(height: TSizes.defaultSpace),
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: Text('Save')),)
              ],
            ),
           ),
           ),
        ),
     );
  }
}