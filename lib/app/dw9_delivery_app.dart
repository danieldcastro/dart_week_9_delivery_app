import 'package:dw9_delivery_app/app/core/ui/theme/theme_config.dart';
import 'package:flutter/material.dart';

import 'pages/splash/splash_page.dart';

class Dw9DeliveryApp extends StatelessWidget {
  const Dw9DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vakinha Burger',
      theme: ThemeConfig.theme,
      routes: {
        '/': (context) => const SplashPage(),
      },
    );
  }
}
