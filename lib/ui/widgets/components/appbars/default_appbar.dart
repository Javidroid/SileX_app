import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(tr('app_title')),
      actions: const [
        Icon(Icons.more_vert),

        // todo poner foto de perfil con animación de hero a la foto del drawer
      ],
    );
  }
}
