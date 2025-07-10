import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences

import '../../../core/components/network_image.dart';
import '../../../core/constants/constants.dart';
import '../../../core/services/AuthService.dart';
import 'profile_header_options.dart';

class ProfileHeader extends StatefulWidget {
  // Make it StatefulWidget
  const ProfileHeader({
    super.key,
  });

  @override
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  String _userName = 'زائر كريم'; // Default values
  String _userEmail = 'N/A000000456';
  String _profileImageUrl =
      'https://images.unsplash.com/photo-1628157588553-5eeea00af15c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80';

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () async {
        await _loadUserData();
      },
    );
  }

  Future<void> _loadUserData() async {
    final prefs = await AuthService().getUserData();
    setState(() {
      _userName = prefs?['name'] ?? _userName;
      _userEmail = prefs?['email'] ?? _userEmail;
      _profileImageUrl = prefs?['image'] ?? _profileImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Background
        Image.asset(
          'assets/images/profile_page_background.png',
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.image_not_supported_outlined),
        ),

        /// Content
        Column(
          children: [
            AppBar(
              title: const Text('بروفايلي'),
              elevation: 0,
              backgroundColor: Colors.transparent,
              titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            _UserData(
              userName: _userName,
              userEmail: _userEmail,
              profileImageUrl: _profileImageUrl,
            ),
            const ProfileHeaderOptions()
          ],
        ),
      ],
    );
  }
}

class _UserData extends StatelessWidget {
  const _UserData({
    required this.userName,
    required this.userEmail,
    required this.profileImageUrl,
  });

  final String userName;
  final String userEmail;
  final String profileImageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: AppDefaults.padding),
          SizedBox(
            width: 100,
            height: 100,
            child: ClipOval(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: NetworkImageWithLoader(profileImageUrl),
              ),
            ),
          ),
          const SizedBox(width: AppDefaults.padding),
          Flexible(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  'Email: $userEmail',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
