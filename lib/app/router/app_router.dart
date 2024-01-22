import 'package:flutter/material.dart';
import 'package:squads/app/router/app_routes.dart';
import 'package:squads/features/home/views/home_screen.dart';
import 'package:squads/features/my_team/my_team_screen.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.myTeam:
        return _materialRoute(const MyTeamScreen());

      default:
        return _materialRoute(const HomeScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return FadeTransition(opacity: animation, child: view);
      },
    );
  }
}
