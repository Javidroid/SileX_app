import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/widgets/components/appbars/default_appbar.dart';
import 'package:tfg_v2/ui/widgets/components/nav_drawer.dart';
import 'package:tfg_v2/ui/widgets/screens/direct_messages/direct_messages_screen.dart';
import 'package:tfg_v2/ui/widgets/screens/notifications/notifications_screen.dart';
import 'package:tfg_v2/ui/widgets/screens/plans/plans_list.dart';
import 'package:tfg_v2/ui/widgets/screens/search/search_screen.dart';

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
          const PlansList(),
          const SearchScreen(),
          const NotificationsScreen(),
          const MessagesScreen(),
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
            label: 'Plans',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.search),
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.notifications),
            icon: Icon(Icons.notifications_none_outlined),
            label: 'Notifications',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.mail),
            icon: Icon(Icons.mail_outline),
            label: 'Direct Messages',
          ),
        ],
      ),
    );
  }
}
