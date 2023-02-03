import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../repositories/products/auth/auth_repository.dart';
import '../../../repositories/products/auth/auth_repository_impl.dart';
import 'register_controller.dart';
import 'register_page.dart';

class RegisterRouter {
  RegisterRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<AuthRepository>(
            create: (context) => AuthRepositoryImpl(dio: context.read()),
          ),
          Provider(
            create: (context) => RegisterController(
              context.read(),
            ),
          ),
        ],
        child: const RegisterPage(),
      );
}
