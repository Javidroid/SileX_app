import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tfg_v2/domain/model/plan.dart';
import 'package:tfg_v2/domain/model/user.dart';
import 'package:tfg_v2/ui/navigation/routes.dart';
import 'package:tfg_v2/ui/widgets/screens/direct_messages/direct_messages_screen.dart';
import 'package:tfg_v2/ui/widgets/screens/faq/faq_screen.dart';
import 'package:tfg_v2/ui/widgets/screens/home/home_screen.dart';
import 'package:tfg_v2/ui/widgets/screens/login/login_screen.dart';
import 'package:tfg_v2/ui/widgets/screens/login/register_screen.dart';
import 'package:tfg_v2/ui/widgets/screens/notifications/notifications_screen.dart';
import 'package:tfg_v2/ui/widgets/screens/plans/plan_detail_screen.dart';
import 'package:tfg_v2/ui/widgets/screens/plans/plans_screen.dart';
import 'package:tfg_v2/ui/widgets/screens/profile/edit_profile_screen.dart';
import 'package:tfg_v2/ui/widgets/screens/profile/profile_screen.dart';
import 'package:tfg_v2/ui/widgets/screens/search/search_screen.dart';
import 'package:tfg_v2/ui/widgets/screens/settings/settings_screen.dart';
import 'package:tfg_v2/ui/widgets/screens/splash/splash_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class TfgNavigator {
  final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.home, // todo check
    routes: <RouteBase>[
      GoRoute(
        path: Routes.splash,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreen(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (BuildContext context, GoRouterState state) =>
            const LoginScreen(),
      ),
      GoRoute(
        // todo put inside login?
        path: Routes.signUp,
        builder: (BuildContext context, GoRouterState state) =>
            const SignUpScreen(),
      ),
      GoRoute(
        path: Routes.home,
        builder: (BuildContext context, GoRouterState state) => HomeScreen(),
      ),
      GoRoute(
        path: Routes.plans,
        builder: (BuildContext context, GoRouterState state) =>
            PlansScreen(),
      ),
      GoRoute(
        path: '${Routes.plans}/:id',
        builder: (BuildContext context, GoRouterState state) {
          final plan = state.extra! as Plan;
          return PlanDetailScreen(
            plan: plan,
          );
        },
      ),
      GoRoute(
        path: Routes.search,
        builder: (BuildContext context, GoRouterState state) =>
            const SearchScreen(),
      ),
      GoRoute(
        path: Routes.notifications,
        builder: (BuildContext context, GoRouterState state) =>
            const NotificationsScreen(),
      ),
      GoRoute(
        path: Routes.dms,
        builder: (BuildContext context, GoRouterState state) =>
            const MessagesScreen(),
      ),
      GoRoute(
        path: '${Routes.profile}/:userRef',
        builder: (BuildContext context, GoRouterState state) {
          final isUserRefId = state.extra! as bool;
          final userRef = state.pathParameters['userRef'];
          return ProfileScreen(userRef: userRef!, isUserRefId: isUserRefId);
        },
      ),
      GoRoute(
        path: '${Routes.editProfile}/:userRef',
        builder: (BuildContext context, GoRouterState state) =>
            const EditProfileScreen(),
      ),
      GoRoute(
        path: Routes.myPlans,
        builder: (BuildContext context, GoRouterState state) =>
            PlansScreen(), // TODO: send own plan dataset
      ),
      GoRoute(
        path: Routes.settings,
        builder: (BuildContext context, GoRouterState state) =>
            const SettingsScreen(),
      ),
      GoRoute(
        path: Routes.faq,
        builder: (BuildContext context, GoRouterState state) =>
            const FaqScreen(),
      ),
    ],
  );

  Future<void> navigateToSplash() {
    return router.push(Routes.splash);
  }

  Future<void> navigateToLogin() {
    return router.push(Routes.login);
  }

  Future<void> navigateToSignUp() {
    return router.push(Routes.signUp);
  }

  Future<void> navigateToHome() {
    return router.push(Routes.home);
  }

  Future<void> navigateToHomeReplacement() {
    return router.pushReplacement(Routes.home);
  }

  Future<void> navigateToPlans() {
    return router.push(Routes.plans);
  }

  Future<void> navigateToPlanDetail(Plan plan) {
    return router.push("${Routes.plans}/${plan.idPlan}", extra: plan);
  }

  Future<void> navigateToSearch() {
    return router.push(Routes.search);
  }

  Future<void> navigateToNotifications() {
    return router.push(Routes.notifications);
  }

  Future<void> navigateToDms() {
    return router.push(Routes.dms);
  }

  Future<void> navigateToProfile({
    required String userRef,
    required bool isUserRefId,
  }) {
    return router.push(
      "${Routes.profile}/$userRef",
      extra: isUserRefId,
    );
  }

  Future<void> navigateToEditProfile(User user) {
    return router.push("${Routes.editProfile}/${user.username}", extra: user);
  }

  Future<void> navigateToMyPlans() {
    return router.push(Routes.myPlans);
  }

  Future<void> navigateToSettings() {
    return router.push(Routes.settings);
  }

  Future<void> navigateToFaq() {
    return router.push(Routes.faq);
  }

  void pop() {
    if (router.canPop()) router.pop();
  }
}
