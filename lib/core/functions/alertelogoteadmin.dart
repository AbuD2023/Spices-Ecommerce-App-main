
import 'package:Spices_Ecommerce_app/core/routes/app_routes.dart';
import 'package:Spices_Ecommerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
MyServices myServices = Get.find();
Future<bool> alertExitAdminApp() {
  Get.defaultDialog(
      title: "تنبيه",
      titleStyle:
          const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      middleText: "هل تريد الخروج من الحساب",
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
              const Color.fromARGB(255, 8, 168, 217),
            )),
            onPressed: () {
              myServices.sharedPreferences.setString("step", "1");
              // myServices.sharedPreferences.clear();

              Get.offAllNamed(AppRoutes.home);
            },
            child: const Text("تاكيد")),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
              const Color.fromARGB(255, 8, 168, 217),
            )),
            onPressed: () {
              Get.back();
            },
            child: const Text("الغاء"))
      ]);
  return Future.value(true);
}
