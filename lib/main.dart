import 'package:flutter/material.dart';
import 'package:gdp/screens/scanner_screen.dart';
import 'package:gdp/statement-management/providers/counter_provider.dart';
import 'package:gdp/screens/home_screen.dart';
import 'package:gdp/statement-management/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => CounterControllerProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme: themeProvider.themeData,
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (_) => const MyHomePage(),
        "/scanner": (_) => const ScannerScreen(),
      },
    );
  }
}
