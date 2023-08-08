import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:ecommerce_app/common/constants.dart';
import 'package:ecommerce_app/common/custom_size.dart';
import 'package:ecommerce_app/component/product_images.dart';
import 'package:ecommerce_app/models/products_model.dart';
import 'package:ecommerce_app/ui/app_bar.dart';
import 'package:ecommerce_app/ui/body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  PreferredSizeWidget buildAppBarWithBackButton(BuildContext context) {
    return buildAppBar(
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProductImage() {
    return Hero(
      tag: product.id,
      child: Image.asset(
        product.images[0],
        width: CustomSize.getScreenPropotionWidth(250),
        height: CustomSize.getScreenPropotionWidth(250),
      ),
    );
  }

  Widget buildPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '\$${product.price}',
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildRating() {
    return RatingBar.builder(
      initialRating: product.rating,
      allowHalfRating: false,
      itemCount: product.rating.toInt(),
      ignoreGestures: true,
      itemSize: 20,
      itemBuilder: (context, _) => const Icon(Icons.star, color: kPrimaryColor),
      onRatingUpdate: (rating) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBarWithBackButton(context),
      extendBody: true,
      body: SizedBox(
        width: double.infinity,
        height: CustomSize.screenHeight,
        child: Column(
          children: [
            buildProductImage(),
            Expanded(
              child: MainBody(
                padding: const EdgeInsets.only(left: 50, top: 43, right: 37),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildPrice(),
                      const SizedBox(height: 30),
                      const Text(
                        'Photos',
                        style:
                            TextStyle(color: kTextLightColor, fontSize: 22.0),
                      ),
                      const SizedBox(height: 10),
                      ProductImages(product: product),
                      const SizedBox(height: 10),
                      Text(
                        product.modelNo,
                        style: const TextStyle(
                            color: kPrimaryColor, fontSize: 16.0),
                      ),
                      const SizedBox(height: 15),
                      buildRating(),
                      const SizedBox(height: 15),
                      Text(
                        product.description,
                        style: const TextStyle(
                            color: kTextLightColor, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
