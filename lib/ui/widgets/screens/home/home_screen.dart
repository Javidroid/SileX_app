import 'package:flutter/material.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/viewmodel/home/home_viewmodel.dart';
import 'package:tfg_v2/ui/widgets/components/appbars/default_appbar.dart';
import 'package:tfg_v2/ui/widgets/components/error_card.dart';
import 'package:tfg_v2/ui/widgets/components/nav_drawer.dart';
import 'package:tfg_v2/ui/widgets/screens/direct_messages/direct_messages_screen.dart';
import 'package:tfg_v2/ui/widgets/screens/notifications/notifications_screen.dart';
import 'package:tfg_v2/ui/widgets/screens/plans/plans_screen.dart';
import 'package:tfg_v2/ui/widgets/screens/root_screen.dart';
import 'package:tfg_v2/ui/widgets/screens/search/search_screen.dart';

class HomeScreen extends RootScreenStateful<HomeViewState, HomeViewModel> {
  const HomeScreen({super.key});

  @override
  RootScreenState<HomeViewState, HomeViewModel,
          RootScreenStateful<HomeViewState, HomeViewModel>>
      createState() => _HomeScreenState();
}

class _HomeScreenState
    extends RootScreenState<HomeViewState, HomeViewModel, HomeScreen> {
  TfgNavigator get navigator => getIt<TfgNavigator>();

  int currentPageIndex = 0;

  @override
  Widget buildView(
    BuildContext context,
    HomeViewState state,
    HomeViewModel viewModel,
  ) {
    return switch (state) {
      Loading _ => const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      Success _ => Scaffold(
          appBar: const DefaultAppBar(),
          drawer: NavigationDrawerWithUserHeader(loggedUser: state.loggedUser),
          body: [
            const PlansScreen(),
            const SearchScreen(),
            const NotificationsScreen(),
            const MessagesScreen(),
          ][currentPageIndex],
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => navigator.toCreatePlan(),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
        ),
      Error _ => Scaffold(
          body: Center(
            child: ErrorCard(error: state.error),
          ),
        ),
    };
  }
}
