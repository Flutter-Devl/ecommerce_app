import 'package:ecommerce_app/common/constants.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final GestureTapCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(25.0)),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(color: kWhite, fontSize: 16),
        ),
      ),
    );
  }
}
