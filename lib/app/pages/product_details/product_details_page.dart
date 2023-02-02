import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../core/ui/helpers/size_extensions.dart';
import '../../core/ui/styles/text_styles.dart';
import '../../core/ui/widgets/delivery_app_bar.dart';
import '../../core/ui/widgets/delivery_increment_decrement_button.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidth,
            height: context.percentHeight(.4),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'http://www.saboresajinomoto.com.br/uploads/images/recipes/sanduiche-de-churrasco.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'X-Costela',
              style: context.textStyles.textExtraBold.copyWith(fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Text(
                  'descrição ',
                ),
              ),
            ),
          ),
          const Divider(),
          Row(
            children: [
              Container(
                  height: 68,
                  padding: const EdgeInsets.all(8),
                  width: context.percentWidth(.5),
                  child: const DeliveryIncrementDecrementButton()),
              Container(
                  width: context.percentWidth(.5),
                  padding: const EdgeInsets.all(8),
                  height: 68,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Adicionar',
                            style: context.textStyles.textExtraBold
                                .copyWith(fontSize: 13),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: AutoSizeText(
                              r'R$ 6999999999,99',
                              maxFontSize: 13,
                              minFontSize: 5,
                              maxLines: 1,
                              style: context.textStyles.textExtraBold
                                  .copyWith(fontSize: 13),
                            ),
                          ),
                        ],
                      )))
            ],
          )
        ],
      ),
    );
  }
}
