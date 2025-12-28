import 'package:flutter/material.dart';
import 'package:projeto_app_tmb/pages/login_page.dart';
import 'package:projeto_app_tmb/widgets/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App TMB',
      theme: ThemeData(scaffoldBackgroundColor: AppTheme.surfaceColor),

      home: LoginPage(),
    );
  }
}
