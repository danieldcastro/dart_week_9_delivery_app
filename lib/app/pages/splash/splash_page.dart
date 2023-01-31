import 'package:flutter/material.dart';

import '../../core/ui/widgets/delivery_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Column(
        children: [
          DeliveryButton(
            label: 'Texte',
            onPressed: () {},
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Oi'),
          )
        ],
      ),
    );
  }
}
