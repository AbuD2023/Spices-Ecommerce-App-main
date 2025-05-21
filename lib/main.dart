import 'dart:developer';

import 'package:Spices_Ecommerce_app/controller/CartController.dart';
import 'package:Spices_Ecommerce_app/core/services/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/routes/app_routes.dart';

import 'core/themes/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthService());
  final AuthService authService = Get.find();
  final token = await authService.getToken();
  log('token: $token');
  Get.put(CartController(snak: (token != null)));
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Spices Ecommerce',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme,
      initialRoute: token != null ? AppRoutes.entryPoint : AppRoutes.login,
      getPages: AppRoutes.routes,
    );
  }
}
