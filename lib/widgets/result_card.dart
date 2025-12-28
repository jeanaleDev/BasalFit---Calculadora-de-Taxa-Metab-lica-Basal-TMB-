import 'package:flutter/material.dart';
import 'package:projeto_app_tmb/widgets/theme_data.dart';

class ResultCard extends StatelessWidget {
  final double tmb;
  const ResultCard({super.key, required this.tmb});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primaryColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sua taxa Metabólica Basal é:",
            style: TextStyle(fontSize: 16, color: AppTheme.textColor),
          ),
          Text(
            "${tmb.toStringAsFixed(0)} kcal/dia",
            style: TextStyle(
              fontSize: 28,
              color: AppTheme.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
