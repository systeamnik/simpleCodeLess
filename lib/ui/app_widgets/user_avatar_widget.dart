import 'package:flutter/material.dart';
import 'package:nursik/constants/app_assets.dart';

class UserAvatarWidget extends StatelessWidget {
  const UserAvatarWidget({
    Key? key,
    required this.url,
    required this.radius,
  }) : super(key: key);

  final String? url;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: url == null
          ? AssetImage(AppAssets.images.noAvatar) as ImageProvider
          : NetworkImage(url!),
    );
  }
}
