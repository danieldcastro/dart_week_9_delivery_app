import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/ui/helpers/size_extensions.dart';
import '../../core/ui/styles/text_styles.dart';
import '../../core/ui/widgets/delivery_app_bar.dart';
import '../../core/ui/widgets/delivery_button.dart';
import '../../dto/order_product_dto.dart';
import '../../models/product_model.dart';
import 'widgets/order_field.dart';
import 'widgets/order_product_tile.dart';
import 'widgets/payment_types_field.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Text(
                    'Sacola',
                    style: context.textStyles.textTitle,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/trashRegular.png'))
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 2,
              (context, index) => Column(
                children: [
                  OrderProductTile(
                    index: index,
                    orderProduct: OrderProductDto(
                      product: ProductModel.fromMap({}),
                      amount: 10,
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total do pedido',
                        style: context.textStyles.textExtraBold
                            .copyWith(fontSize: 16),
                      ),
                      Text(
                        'Preço',
                        style: context.textStyles.textExtraBold
                            .copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                OrderField(
                  controller: TextEditingController(),
                  title: 'Endereço de entrega',
                  validator: Validatorless.required(''),
                  hintText: 'Digite um endereço',
                ),
                const SizedBox(
                  height: 10,
                ),
                OrderField(
                  controller: TextEditingController(),
                  title: 'CPF',
                  validator: Validatorless.required(''),
                  hintText: 'Digite o CPF',
                ),
                const SizedBox(
                  height: 10,
                ),
                const PaymentTypesField()
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              const Divider(
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: DeliveryButton(
                  label: 'FINALIZAR',
                  onPressed: () {},
                  width: context.screenWidth,
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
