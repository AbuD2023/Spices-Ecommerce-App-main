import 'package:flutter/material.dart';

import '../../core/components/app_back_button.dart';
import '../../core/constants/constants.dart';
import '../../core/services/AuthService.dart';
import '../../data/model/User.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  // User? user;
  Future<User> _loadUserData() async {
    // user = User();
    final prefs = await AuthService().getUserData();
    if (prefs != null) {
      return User.fromJson(prefs);
    } else {
      return User();
    }
    // setState(() {});
  }

  @override
  void initState() {
    // _loadUserData();
    // Future.microtask(
    //   () {
    //     _loadUserData();
    //     setState(() {});
    //   },
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardColor,
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text(
          'Profile',
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: _loadUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container(
                margin: const EdgeInsets.all(AppDefaults.padding),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDefaults.padding,
                  vertical: AppDefaults.padding * 2,
                ),
                decoration: BoxDecoration(
                  color: AppColors.scaffoldBackground,
                  borderRadius: AppDefaults.borderRadius,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /* <----  Name -----> */
                    const Text("Name"),
                    const SizedBox(height: 8),
                    TextFormField(
                      initialValue: snapshot.data?.name,
                      readOnly: true,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: AppDefaults.padding),

                    /* <---- address -----> */
                    const Text("address"),
                    const SizedBox(height: 8),
                    TextFormField(
                      initialValue: snapshot.data?.address,
                      readOnly: true,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: AppDefaults.padding),

                    /* <---- Phone Number -----> */
                    const Text("Phone Number"),
                    const SizedBox(height: 8),
                    TextFormField(
                      initialValue: snapshot.data?.phone,
                      readOnly: true,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: AppDefaults.padding),

                    /* <---- Gender -----> */
                    // const Text("Gender"),
                    // const SizedBox(height: 8),
                    // TextFormField(
                    //   keyboardType: TextInputType.text,
                    //   textInputAction: TextInputAction.next,
                    // ),
                    // const SizedBox(height: AppDefaults.padding),

                    // /* <---- status -----> */
                    const Text("status"),
                    const SizedBox(height: 8),
                    TextFormField(
                      initialValue: snapshot.data?.status.toString(),
                      readOnly: true,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: AppDefaults.padding),

                    /* <---- Password -----> */

                    /* <---- Email -----> */
                    const Text("Email"),
                    const SizedBox(height: 8),
                    TextFormField(
                      initialValue: snapshot.data?.email,
                      readOnly: true,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: AppDefaults.padding),

                    /* <---- Submit -----> */
                    // const SizedBox(height: AppDefaults.padding),
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: ElevatedButton(
                    //     child: const Text('Save'),
                    //     onPressed: () {},
                    //   ),
                    // ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
