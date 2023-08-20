import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_life_care/screens/initial_screen.dart';
import 'package:new_life_care/screens/result_screen.dart';
import 'package:new_life_care/screens/select_date_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class RouteHelper {
  static CustomTransitionPage buildPageWithDefaultTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child),
    );
  }

  static GoRouter routes({required String initialRoute}) => GoRouter(
        initialLocation: initialRoute,
        debugLogDiagnostics: true,
        navigatorKey: navigatorKey,
        routes: [
          GoRoute(
            path: InitialScreen.route,
            builder: (context, state) => const InitialScreen(),
            pageBuilder: (context, state) =>
                buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const InitialScreen(),
            ),
          ),
          GoRoute(
            path: SelectDateScreen.route,
            builder: (context, state) => const SelectDateScreen(),
            pageBuilder: (context, state) =>
                buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const SelectDateScreen(),
            ),
          ),
          GoRoute(
            path: ResultScreen.route,
            builder: (context, state) => const ResultScreen(),
            pageBuilder: (context, state) =>
                buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const ResultScreen(),
            ),
          ),
        ],
      );
}
