import 'package:flutter/material.dart';

AppBar buildAppBar({
  Widget? title,
  Widget? leading,
  List<Widget>? actions,
}) {
  return AppBar(
    elevation: 0,
    title: title,
    actions: actions,
    automaticallyImplyLeading: false,
    titleSpacing: 0,
    leading: leading,
    backgroundColor: const Color.fromARGB(255, 16, 108, 255),
  );
}
