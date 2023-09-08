import 'package:flutter/material.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/user.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/widgets/components/appbars/default_appbar.dart';
import 'package:tfg_v2/ui/widgets/components/nav_drawer.dart';
import 'package:tfg_v2/ui/widgets/screens/direct_messages/direct_messages_screen.dart';
import 'package:tfg_v2/ui/widgets/screens/notifications/notifications_screen.dart';
import 'package:tfg_v2/ui/widgets/screens/plans/plans_screen.dart';
import 'package:tfg_v2/ui/widgets/screens/search/search_screen.dart';

class HomeSuccessScreen extends StatefulWidget {
  const HomeSuccessScreen({super.key, required this.loggedUser});

  TfgNavigator get navigator => getIt<TfgNavigator>();

  final User loggedUser;

  @override
  State<HomeSuccessScreen> createState() => _HomeSuccessScreenState();
}

class _HomeSuccessScreenState extends State<HomeSuccessScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      drawer: NavigationDrawerWithUserHeader(loggedUser: widget.loggedUser),
      body: [
        const PlansScreen(),
        const SearchScreen(),
        const NotificationsScreen(),
        const MessagesScreen(),
      ][currentPageIndex],
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => widget.navigator.toCreatePlan(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
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
