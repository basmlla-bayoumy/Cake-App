import 'package:cake_app/providers/cakes_provider.dart';
import 'package:cake_app/providers/favorite_provider.dart';
import 'package:cake_app/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CakeProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),

        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cake App',
        theme: ThemeData(
          primaryColor: Colors.pink,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: "Arial",
        ),
        home: const OnboardingScreen(),
      ),
    );
  }
}
