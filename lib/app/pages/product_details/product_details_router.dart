import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_details_controller.dart';
import 'product_details_page.dart';

class ProductDetailsRouter {
  ProductDetailsRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => ProductDetailsController(),
          )
        ],
        builder: (context, child) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;

          return ProductDetailsPage(
            product: args['product'],
            order: args['order'],
          );
        },
      );
}
