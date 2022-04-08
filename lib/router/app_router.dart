import 'package:flutter/material.dart';
import 'package:tarihte_bugun_app/pages/Home/HomeScreen.dart';
import 'package:tarihte_bugun_app/pages/Today/TodayScreen.dart';
import 'package:tarihte_bugun_app/pages/splash/splash_view.dart';

class AppRouter {
  Route? sayfaGecisleri(settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case '/today':
        return MaterialPageRoute(
          builder: (_) => const TodayScreen(),
        );
      case '/splash':
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      default:
        return null;
    }
  }
}
