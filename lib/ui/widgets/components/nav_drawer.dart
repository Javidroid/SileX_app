import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/user.dart';
import 'package:tfg_v2/env/constants.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/styles/theme.dart';
import 'package:tfg_v2/ui/widgets/components/profile/navigable_profile_pic.dart';

class NavigationDrawerWithUserHeader extends StatefulWidget {
  const NavigationDrawerWithUserHeader({super.key, required this.loggedUser});

  final User loggedUser;

  @override
  State<NavigationDrawerWithUserHeader> createState() =>
      _NavigationDrawerWithUserHeaderState();
}

class _NavigationDrawerWithUserHeaderState
    extends State<NavigationDrawerWithUserHeader> {
  TfgNavigator get navigator => getIt<TfgNavigator>();

  User get loggedUser => widget.loggedUser;

  @override
  Widget build(BuildContext context) {
    // TODO: get current user y guardarlo
    return Consumer<ThemeNotifier>(
      builder: (context, ThemeNotifier themeNotifier, child) {
        return Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: Hero(
                  tag: Constants.profilePicHeroTag,
                  child: NavigableProfilePic(
                    onTap: () {
                      navigator.toProfile(
                        userRef: loggedUser.username,
                        isUserRefId: false,
                      );
                    },
                    asset: loggedUser.profile.profilePic,
                  ),
                ),
                accountName: Text(loggedUser.username),
                accountEmail: Text(loggedUser.email),
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
                  navigator.toProfile(
                    userRef: loggedUser.username,
                    isUserRefId: false,
                  );
                },
              ),
              ListTile(
                title: Text('components.nav_drawer.pending_plans'.tr()),
                onTap: () {
                  navigator.pop();
                  navigator.toMyPlans(); // todo bind user
                },
              ),
              ListTile(
                title: Text('components.nav_drawer.settings'.tr()),
                onTap: () {
                  navigator.pop();
                  navigator.toSettings();
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
                  navigator.toFaq();
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
