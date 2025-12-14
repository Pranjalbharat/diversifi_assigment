import 'package:diversifi_assigment/screens/portfolio_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:diversifi_assigment/provider/portfolio_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PortfolioProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home: PortfolioScreen(),
      ),
    );
  }
}
