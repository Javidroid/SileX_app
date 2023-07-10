import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/styles/theme.dart';

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
              // todo poner foto de perfil con animación de hero a la foto del drawer
              UserAccountsDrawerHeader(
                currentAccountPicture: GestureDetector(
                  onTap: () => navigator.navigateToProfile(),
                  child: const CircleAvatar(
                    foregroundImage:
                        // todo load picture from repo
                        AssetImage('assets/images/SilenTheKid.jpg'),
                  ),
                ),

                // todo load info from repo
                accountName: const Text("[Username]"),
                accountEmail: const Text("mail@alumnos.unex.es"),
                otherAccountsPictures: [
                  IconButton(
                    icon: Icon(
                      themeNotifier.modo
                          ? Icons.wb_sunny
                          : Icons.nightlight_round,
                    ),
                    onPressed: () {
                      themeNotifier.modo = !themeNotifier.modo;
                    },
                  )
                ],
              ),
              ListTile(
                title: const Text('Perfil'),
                onTap: () {
                  navigator.pop();
                  navigator.navigateToProfile();
                },
              ),
              ListTile(
                title: const Text('Actividades Pendientes'),
                onTap: () {
                  navigator.pop();
                  navigator.navigateToMyPlans();
                },
              ),
              ListTile(
                title: const Text('Ajustes'),
                onTap: () {
                  navigator.pop();
                  navigator.navigateToSettings();
                },
              ),
              ListTile(
                title: const Text('Solicitudes de amistad'),
                onTap: () {
                  // todo: check
                  Navigator.pop(context);
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
                title: const Text('FAQ'),
                onTap: () {
                  navigator.pop();
                  navigator.navigateToFaq();
                },
              ),
              ListTile(
                title: const Text('Invitar amigos'),
                onTap: () {
                  // todo: check
                  Navigator.pop(context);
                },
              ),
              const AboutListTile(
                icon: Icon(
                  Icons.info,
                ),
                applicationIcon: Icon(
                  Icons.info_outline,
                ),
                applicationName: 'SilenApp',
                applicationVersion: 'v1.0.0',
                applicationLegalese: 'Javier Florido Cartolano (UEx, 2023)',
                aboutBoxChildren: [
                  // contenido
                ],
                child: Text('About'),
              ),
            ],
          ),
        );
      },
    );
  }
}
