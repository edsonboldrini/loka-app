import 'package:flutter/material.dart';
import 'package:loka_app/pages/description/description_view.dart';
import 'package:loka_app/pages/home/home_view.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    HomeView.routeName: (ctx) => const HomeView(),
    DescriptionView.routeName: (ctx) => const DescriptionView(),
  };
}
