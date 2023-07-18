import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/widgets/components/profile/profile_content.dart';
import 'package:tfg_v2/ui/widgets/components/profile/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  TfgNavigator get navigator => getIt<TfgNavigator>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('lorem.username'.tr()),
        actions: [
          TextButton(
            onPressed: () {
              navigator.navigateToEditProfile();
            },
            child: const Text(
              "Editar perfil",
              style: TextStyles.whiteTextButton,
            ), // todo improve
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: const [
            ProfileHeader(),
            ProfileContent(),
          ],
        ),
      ),
    );
  }
}
