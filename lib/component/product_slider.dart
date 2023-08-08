import 'package:ecommerce_app/common/constants.dart';
import 'package:ecommerce_app/common/custom_size.dart';
import 'package:ecommerce_app/models/products_model.dart';
import 'package:ecommerce_app/screens/product_details_screen.dart';
import 'package:ecommerce_app/ui/card.dart';
import 'package:ecommerce_app/ui/product_card.dart';
import 'package:flutter/material.dart';

class ProductSlider extends StatelessWidget {
  const ProductSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: CustomSize.getScreenPropotionHeight(300.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CardBody(
            width: CustomSize.getScreenPropotionWidth(200.0),
            height: CustomSize.getScreenPropotionHeight(300.0),
            index: index,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(
                    product: demoProducts[index],
                  ),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 19),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    demoProducts[index].name,
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
                    demoProducts[index].modelNo,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                Center(
                  child: Hero(
                    tag: demoProducts[index].id,
                    child: Image.asset(
                      demoProducts[index].images[0],
                      width: CustomSize.getScreenPropotionWidth(100),
                      height: CustomSize.getScreenPropotionHeight(170),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: ProductCardBottom(product: demoProducts[index]),
                )
              ],
            ),
          );
        },
        itemCount: demoProducts.length,
      ),
    );
  }
}
