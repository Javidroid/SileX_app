import 'package:flutter/material.dart';

import 'package:tfg_v2/ui/widgets/components/appbars/default_appbar.dart';
import 'package:tfg_v2/ui/widgets/components/nav_drawer.dart';

class HomeSuccessScreen extends StatefulWidget {
  const HomeSuccessScreen({super.key});

  @override
  State<HomeSuccessScreen> createState() => _HomeSuccessScreenState();
}

class _HomeSuccessScreenState extends State<HomeSuccessScreen> {

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      drawer: const TfgNavigationDrawer(),
      body: SafeArea(
        child: <Widget>[
          Container(
            alignment: Alignment.center,
            child: const Text('Plans'),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text('Buscar'),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text('Notificaciones'),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text('Mensajes Directos'),
          ),
        ][currentPageIndex],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          // los iconos de la barra
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Actividades',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.search),
            icon: Icon(Icons.search_outlined),
            label: 'Buscar',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.notifications),
            icon: Icon(Icons.notifications_none_outlined),
            label: 'Notificaciones',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.mail),
            icon: Icon(Icons.mail_outline),
            label: 'Mensajes',
          ),
        ],
      ),
    );
  }
}

