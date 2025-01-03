import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solar_system/utils/MyRoutes.dart';
import 'package:solar_system/views/screens/detail_page.dart';
import 'package:solar_system/views/screens/favourite_page.dart';
import 'package:solar_system/views/screens/planet_home_page.dart';
import 'package:solar_system/views/screens/ripple_animation_page.dart';
import 'package:solar_system/views/screens/splash_screen.dart';
import 'controllers/favourite_controller.dart';
import 'views/screens/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavouriteController(shr: preferences),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: MyRoutes.splash_screen,
      routes: {
        MyRoutes.home: (context) => const HomePage(),
        MyRoutes.RippleAnimationpage: (context) => const RippleAnimationPage(),
        MyRoutes.planethomepage: (context) => const PlanetHomePage(),
        MyRoutes.detail_page: (context) => const DetailPage(),
        MyRoutes.favourite_page: (context) => const FavouritePage(),
        MyRoutes.splash_screen: (context) => const SplashScreen(),
      },
    );
  }
}
