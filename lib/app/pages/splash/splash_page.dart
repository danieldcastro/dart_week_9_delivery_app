import 'package:flutter/material.dart';

import '../../core/ui/helpers/size_extensions.dart';
import '../../core/ui/widgets/delivery_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: const Color(0xFF140e0e),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.screenWidth,
                child: Image.asset(
                  'assets/images/lanche.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/logo.png'),
                  const SizedBox(
                    height: 80,
                  ),
                  DeliveryButton(
                    label: 'ACESSAR',
                    onPressed: () =>
                        Navigator.popAndPushNamed(context, '/home'),
                    width: context.percentWidth(.6),
                    height: 35,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
