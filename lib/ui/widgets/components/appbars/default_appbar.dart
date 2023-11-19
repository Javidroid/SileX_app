import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/widgets/components/app_logo.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({super.key, this.title});

  final String? title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null
          ? Text(title!)
          : const AppLogo(onlyText: true, size: kToolbarHeight),
    );
  }
}
