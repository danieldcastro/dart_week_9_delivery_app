import 'package:flutter/material.dart';

import '../../../core/ui/styles/app_colors.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../../core/ui/widgets/delivery_increment_decrement_button.dart';
import '../../../dto/order_product_dto.dart';

class OrderProductTile extends StatelessWidget {
  final int index;
  final OrderProductDto orderProduct;

  const OrderProductTile({
    super.key,
    required this.index,
    required this.orderProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Image.network(
            'https://burgerx.com.br/assets/img/galeria/burgers/x-burger.jpg',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Título',
                    style: context.textStyles.textRegular.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Preço',
                        style: context.textStyles.textMedium.copyWith(
                            color: context.colors.secondary, fontSize: 14),
                      ),
                      DeliveryIncrementDecrementButton(
                        amount: 1,
                        incrementTap: () {},
                        decrementTap: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
