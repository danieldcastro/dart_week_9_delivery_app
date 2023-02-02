import 'package:dw9_delivery_app/app/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../core/ui/widgets/delivery_app_bar.dart';
import 'widgets/delivery_product_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DeliveryAppBar(),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => DeliveryProductTile(
                  product: ProductModel(
                      id: 0,
                      name: 'Treco',
                      description: 'Lanches bons',
                      price: 0.00,
                      image:
                          'https://i.ytimg.com/vi/0Fea2vwfnN8/maxresdefault.jpg'),
                ),
              ),
            )
          ],
        ));
  }
}
