import 'package:loka_app/pages/home/home_controller.dart';
import 'package:provider/provider.dart';

class AppProviders {
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider(
      create: (_) => HomeController(),
    )
  ];
}
