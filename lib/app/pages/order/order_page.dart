import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/ui/base_state/base_state.dart';
import '../../core/ui/helpers/size_extensions.dart';
import '../../core/ui/styles/text_styles.dart';
import '../../core/ui/widgets/delivery_app_bar.dart';
import '../../core/ui/widgets/delivery_button.dart';
import '../../dto/order_product_dto.dart';
import 'order_controller.dart';
import 'order_state.dart';
import 'widgets/order_field.dart';
import 'widgets/order_product_tile.dart';
import 'widgets/payment_types_field.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends BaseState<OrderPage, OrderController> {
  @override
  void onReady() {
    super.onReady();
    final products =
        ModalRoute.of(context)!.settings.arguments as List<OrderProductDto>;
    controller.load(products);
  }

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
          BlocSelector<OrderController, OrderState, List<OrderProductDto>>(
            //Extrai uma parte do estado para pegar um item de lá. Rebuilda a tela.
            selector: (state) {
              return state.orderProducts;
            },
            builder: (context, orderProducts) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: orderProducts.length,
                  (context, index) {
                    final orderProduct = orderProducts[index];
                    return Column(
                      children: [
                        OrderProductTile(
                            index: index, orderProduct: orderProduct),
                        const Divider(
                          color: Colors.grey,
                        )
                      ],
                    );
                  },
                ),
              );
            },
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
