// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dw9_delivery_app/app/core/config/env/extensions/formatter_extension.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/app_colors.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../models/product_model.dart';

class DeliveryProductTile extends StatelessWidget {
  final ProductModel product;

  const DeliveryProductTile({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Navigator.pushNamed(context, '/productDetails', arguments: {
          'product': product,
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      product.name,
                      style: context.textStyles.textExtraBold
                          .copyWith(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      product.description,
                      style:
                          context.textStyles.textRegular.copyWith(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      product.price.currencyPTBR,
                      style: context.textStyles.textMedium.copyWith(
                          fontSize: 12, color: context.colors.secondary),
                    ),
                  ),
                ],
              ),
            ),
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading.gif',
              image: product.image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
