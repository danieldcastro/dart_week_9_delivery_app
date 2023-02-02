import 'package:flutter/material.dart';

import 'core/provider/application_binding.dart';
import 'core/ui/theme/theme_config.dart';
import 'pages/auth/login/login_page.dart';
import 'pages/auth/register/register_page.dart';
import 'pages/home/home_router.dart';
import 'pages/product_details/product_details_router.dart';
import 'pages/splash/splash_page.dart';

class Dw9DeliveryApp extends StatelessWidget {
  const Dw9DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: 'Vakinha Burger',
        theme: ThemeConfig.theme,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.page,
          '/productDetails': (context) => ProductDetailsRouter.page,
          '/auth/login': (context) => const LoginPage(),
          '/auth/register': (context) => const RegisterPage(),
        },
      ),
    );
  }
}
