import 'package:flutter/material.dart';

import 'package:ecommerce_app/common/constants.dart';
import 'package:ecommerce_app/common/custom_size.dart';
import 'package:ecommerce_app/models/products_model.dart';
import 'package:ecommerce_app/screens/product_details_screen.dart';
import 'package:ecommerce_app/ui/card.dart';
import 'package:ecommerce_app/ui/product_card.dart';

class BestSellingSection extends StatelessWidget {
  const BestSellingSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: CustomSize.getScreenPropotionHeight(300),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final product = bestSelling[index];
          return CardBody(
            width: CustomSize.getScreenPropotionWidth(298),
            height: CustomSize.getScreenPropotionHeight(300),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(
                    product: product,
                  ),
                ),
              );
            },
            index: index,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 19),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    product.modelNo,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.description,
                          style: const TextStyle(
                            color: kTextLightColor,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Hero(
                            tag: product.id,
                            child: Image.asset(
                              product.images[0],
                              width: CustomSize.getScreenPropotionWidth(100),
                              height: CustomSize.getScreenPropotionHeight(170),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ProductCardBottom(
                    product: product,
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: bestSelling.length,
      ),
    );
  }
}
