import 'package:flutter/material.dart';

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
          ElevatedButton(onPressed: () {}, child: const Text('Teste')),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Oi'),
          )
        ],
      ),
    );
  }
}
