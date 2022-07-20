import 'package:flutter/material.dart';
import 'package:loka_app/app_providers.dart';
import 'package:loka_app/app_routes.dart';
import 'package:loka_app/pages/home/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        routes: AppRoutes.routes,
        home: const HomeView(),
      ),
    );
  }
}
