import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfg_v2/ui/styles/theme.dart';

class TfgNavigationDrawer extends StatefulWidget {
  const TfgNavigationDrawer({super.key});

  @override
  State<TfgNavigationDrawer> createState() => _TfgNavigationDrawerState();
}

class _TfgNavigationDrawerState extends State<TfgNavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, ThemeNotifier themeNotifier, child) {
        return Drawer(
          // ListView nos permitirá tener un Drawer scrolleable
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Placeholder(),
                      ),
                    );
                  },
                  child: const CircleAvatar(
                    foregroundImage: AssetImage("assets/SilenTheKid.jpg"),
                  ),
                ),
                // todo cargar la foto de la BD / quitar const
                //currentAccountPictureSize: Size(width, height),
                accountName: const Text("[Username]"),
                // todo quitar const cuando se recoja info de API
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
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Placeholder(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Actividades Pendientes'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Ajustes'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Placeholder(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Solicitudes de amistad'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
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
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Invitar amigos'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              const AboutListTile(
                // <-- SEE HERE
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
