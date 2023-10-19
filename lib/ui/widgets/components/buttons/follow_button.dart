import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({
    super.key,
    this.follow,
    this.unfollow,
    required this.isFollowing,
  });

  final VoidCallback? follow;
  final VoidCallback? unfollow;
  final bool isFollowing;

  @override
  Widget build(BuildContext context) {
    return !isFollowing
        ? TextButton(
            onPressed: follow,
            child: Text(
              'components.buttons.follow'.tr(),
              style: TextStyles.whiteTextButton,
            ),
          )
        : TextButton(
            onPressed: unfollow,
            child: Text(
              'components.buttons.unfollow'.tr(),
              style: TextStyles.cancelTextButton,
            ),
          );
  }
}
