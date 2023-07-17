import 'package:flutter/material.dart';

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
        foregroundImage:
            // todo load picture from repo
            AssetImage(asset), // todo change to Network image
        radius: radius ?? 25,
      ),
    );
  }
}
