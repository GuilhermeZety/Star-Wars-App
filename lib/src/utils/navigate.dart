import 'package:flutter/material.dart';

import 'custom_page_route.dart';

Future<void> to(BuildContext context, Widget page) async {
  Navigator.of(context).pushReplacement(
    CustomPageRouteFade(child: page, duration: const Duration(milliseconds: 400))
  );
}

Future<void> pushNamed(context, String route) async {
  await Navigator.of(context).pushNamedAndRemoveUntil(route, (r) => false);
}