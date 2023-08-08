import 'package:flutter/material.dart';

import 'package:ecommerce_app/common/constants.dart';
import 'package:ecommerce_app/common/custom_size.dart';
import 'package:ecommerce_app/component/best_selling_section.dart';
import 'package:ecommerce_app/component/product_slider.dart';
import 'package:ecommerce_app/ui/app_bar.dart';
import 'package:ecommerce_app/ui/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  PreferredSizeWidget buildAppBarWithTitle() {
    return buildAppBar(
      title: const Text(
        'Ecommerce App',
        style: TextStyle(
          color: kWhite,
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildExploreText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Text(
        'Explore your favourite products',
        style: TextStyle(
          color: kWhite,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildBestSellingTitle() {
    return const Padding(
      padding: EdgeInsets.only(left: 42),
      child: Text(
        'Best Selling',
        style: TextStyle(
          color: kPrimaryColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBarWithTitle(),
      body: SizedBox(
        width: double.infinity,
        height: CustomSize.screenHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 35),
            buildExploreText(),
            const SizedBox(height: 40),
            Expanded(
              child: MainBody(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      const ProductSlider(),
                      buildBestSellingTitle(),
                      const SizedBox(height: 10),
                      const BestSellingSection(),
                      const SizedBox(height: 30),
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
