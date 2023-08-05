import 'package:flutter/material.dart';
import 'package:tfg_v2/env/constants.dart';

class NavigableProfilePic extends StatelessWidget {
  const NavigableProfilePic({
    super.key,
    this.onTap,
    required this.asset,
    this.radius,
  });

  final VoidCallback? onTap;
  final String asset;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: CircleAvatar(
        foregroundImage: NetworkImage(asset),
        backgroundImage: const AssetImage(Constants.defaultProfilePic),
        radius: radius ?? 25,
      ),
    );
  }
}
