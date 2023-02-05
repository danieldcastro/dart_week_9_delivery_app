import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';

import '../../../core/ui/helpers/size_extensions.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../../models/payment_type_model.dart';

class PaymentTypesField extends StatelessWidget {
  final List<PaymentTypeModel> paymentTypes;
  final ValueChanged<int> valueChanged;
  final bool valid;
  final String valueSelected;

  const PaymentTypesField({
    super.key,
    required this.paymentTypes,
    required this.valueChanged,
    required this.valid,
    required this.valueSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'Forma de pagamento',
            style: context.textStyles.textRegular.copyWith(fontSize: 16),
          ),
        ),
        SmartSelect<String>.single(
          title: 'Selecione uma forma de pagamento',
          selectedValue: valueSelected,
          modalType: S2ModalType.bottomSheet,
          onChange: (selected) {
            valueChanged(int.parse(selected.value));
          },
          tileBuilder: (context, state) {
            return InkWell(
              onTap: state.showModal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: context.screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.selected.title ?? '',
                            style: context.textStyles.textRegular,
                          ),
                          const Icon(Icons.arrow_forward_ios_rounded)
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !valid,
                    child: const Divider(
                      color: Colors.red,
                      thickness: 1.5,
                    ),
                  ),
                  Visibility(
                    visible: !valid,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        'Selecione uma forma de pagamento',
                        style: context.textStyles.textRegular
                            .copyWith(fontSize: 13, color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          choiceItems: S2Choice.listFrom<String, Map<String, String>>(
            source: paymentTypes
                .map((p) => {'value': p.id.toString(), 'title': p.name})
                .toList(),
            // [
            //   {'value': 'VA', 'title': 'Vale Alimentação'},
            //   {'value': 'VR', 'title': 'Vale Refeição'},
            //   {'value': 'CC', 'title': 'Cartão de Crédito'},
            // ],
            title: (index, item) => item['title'] ?? '',
            value: (index, item) => item['value'] ?? '',
          ),
          choiceType: S2ChoiceType.radios,
          choiceGrouped: true,
          modalFilter: false,
          placeholder: '',
        ),
      ],
    );
  }
}
