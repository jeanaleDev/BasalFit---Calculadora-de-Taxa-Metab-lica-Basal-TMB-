import 'package:flutter/material.dart';
import 'package:projeto_app_tmb/widgets/input_field_login.dart';
import 'package:projeto_app_tmb/widgets/logo.widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [SizedBox(height: 100), Logo(), InpTextField()],
        ),
      ),
    );
  }
}
