import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/env/constants.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/styles/theme.dart';
import 'package:tfg_v2/ui/widgets/components/profile/navigable_profile_pic.dart';

class TfgNavigationDrawer extends StatefulWidget {
  const TfgNavigationDrawer({super.key});

  @override
  State<TfgNavigationDrawer> createState() => _TfgNavigationDrawerState();
}

class _TfgNavigationDrawerState extends State<TfgNavigationDrawer> {
  TfgNavigator get navigator => getIt<TfgNavigator>();

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, ThemeNotifier themeNotifier, child) {
        return Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              // todo foto de perfil con animación de hero a la foto del drawer
              UserAccountsDrawerHeader(
                currentAccountPicture: Hero(
                  tag: Constants.profilePicHeroTag,
                  child: NavigableProfilePic(
                    onTap: () {}, //navigator.navigateToProfile,
                    asset:
                        'https://pbs.twimg.com/profile_images/1625060021611466755/CkyYiCFC_400x400.jpg',
                  ),
                ),

                // todo load info from repo
                accountName: Text('lorem.username'.tr()),
                accountEmail: Text('lorem.mail'.tr()),
                otherAccountsPictures: [
                  IconButton(
                    icon: Icon(
                      themeNotifier.modo
                          ? Icons.nightlight_round
                          : Icons.wb_sunny,
                    ),
                    onPressed: () {
                      themeNotifier.modo = !themeNotifier.modo;
                    },
                  )
                ],
              ),
              ListTile(
                title: Text('components.nav_drawer.profile'.tr()),
                onTap: () {
                  navigator.pop();
                  // navigator.navigateToProfile();
                },
              ),
              ListTile(
                title: Text('components.nav_drawer.pending_plans'.tr()),
                onTap: () {
                  navigator.pop();
                  navigator.navigateToMyPlans();
                },
              ),
              ListTile(
                title: Text('components.nav_drawer.settings'.tr()),
                onTap: () {
                  navigator.pop();
                  navigator.navigateToSettings();
                },
              ),
              ListTile(
                title: Text(
                  'components.nav_drawer.logout'.tr(),
                  style: TextStyles.logout,
                ),
                onTap: () {
                  // TODO: log out
                },
              ),
              const Divider(
                // todo revisar barrita separadora cambiar según tema
                color: Colors.black,
                thickness: 1,
                height: 20,
                indent: 20,
                endIndent: 20,
              ),
              ListTile(
                title: Text('components.nav_drawer.faq'.tr()),
                onTap: () {
                  navigator.pop();
                  navigator.navigateToFaq();
                },
              ),
              ListTile(
                title: Text('components.nav_drawer.invite_friends'.tr()),
                onTap: () {
                  // todo: check
                  Navigator.pop(context);
                },
              ),
              AboutListTile(
                icon: const Icon(
                  Icons.info,
                ),
                applicationIcon: const Icon(
                  Icons.info_outline,
                ),
                applicationName: 'app_title'.tr(),
                applicationVersion: 'v1.0.0',
                applicationLegalese: 'Javier Florido Cartolano (UEx, 2023)',
                child: Text('components.nav_drawer.about'.tr()),
              ),
            ],
          ),
        );
      },
    );
  }
}
