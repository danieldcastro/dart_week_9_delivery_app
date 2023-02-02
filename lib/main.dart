import 'package:flutter/material.dart';

import 'app/core/config/env/env.dart';
import 'app/dw9_delivery_app.dart';

void main() async {
  await Env.instance.load();
  runApp(const Dw9DeliveryApp());
}
