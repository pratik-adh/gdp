import 'package:flutter/material.dart';
import 'package:gdp/screens/scanner_screen.dart';
import 'package:gdp/statement-management/providers/counter_provider.dart';
import 'package:gdp/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CounterControllerProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (_) => const MyHomePage(),
        "/scanner": (_) => const ScannerScreen(),
      },
    );
  }
}
