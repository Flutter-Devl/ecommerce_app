import 'package:ecommerce_app/common/custom_size.dart';
import 'package:ecommerce_app/models/products_model.dart';
import 'package:flutter/material.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: CustomSize.getScreenPropotionHeight(80.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Image.asset(product.images[index]),
          );
        },
        itemCount: product.images.length,
      ),
    );
  }
}
