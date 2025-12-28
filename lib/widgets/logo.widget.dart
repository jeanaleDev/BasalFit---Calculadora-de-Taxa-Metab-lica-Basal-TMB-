import 'package:flutter/material.dart';
import 'package:projeto_app_tmb/widgets/theme_data.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "BasalFit",
          style: TextStyle(
            fontSize: 52,
            fontWeight: FontWeight.bold,
            color: AppTheme.textColor,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Calcule sua Taxa metabólica basal!",
          style: TextStyle(color: AppTheme.primaryColor, fontSize: 16),
        ),
        SizedBox(height: 50),
      ],
    );
  }
}
