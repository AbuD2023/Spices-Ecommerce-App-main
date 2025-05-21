import 'dart:developer';

import 'package:Spices_Ecommerce_app/views/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/constants.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/services/AuthService.dart';
import 'profile_list_tile.dart';

class ProfileMenuOptions extends StatelessWidget {
  const ProfileMenuOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppDefaults.padding),
      padding: const EdgeInsets.all(AppDefaults.padding),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: AppDefaults.boxShadow,
        borderRadius: AppDefaults.borderRadius,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProfileListTile(
              title: 'بروفايلي',
              icon: AppIcons.profilePerson,
              onTap: () => Navigator.pushNamed(context, AppRoutes.profileEdit),
            ),
            const Divider(thickness: 0.1),
            ProfileListTile(
              title: 'الاشعارات',
              icon: AppIcons.profileNotification,
              onTap: () {
                // Navigator.pushNamed(context, AppRoutes.notifications);
              },
            ),
            const Divider(thickness: 0.1),
            ProfileListTile(
                title: 'اعدادات',
                icon: AppIcons.profileSetting,
                onTap: () {
                  // Navigator.pushNamed(context, AppRoutes.settings);
                }),
            const Divider(thickness: 0.1),
            // ProfileListTile(
            //   title: 'Payment',
            //   icon: AppIcons.profilePayment,
            //   onTap: () => Navigator.pushNamed(context, AppRoutes.paymentMethod),
            // ),
            const Divider(thickness: 0.1),
            ProfileListTile(
                title: 'تسجيل الخروج ',
                icon: AppIcons.profileLogout,
                onTap: () async {
                  final AuthService authService = Get.find();
                  final chack = await authService.clearData();
                  log(chack.toString(), name: 'login: ');
                  if (chack) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                      (route) => false,
                    );
                  }
                  // Navigator.pushNamed(context,
                }),
          ],
        ),
      ),
    );
  }
}
