import 'package:flutter/material.dart';

class AiInsightCard extends StatelessWidget {
  final String insight;

  const AiInsightCard({super.key, required this.insight});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;

    final padding = isSmallScreen ? 14.0 : 20.0;
    final titleFontSize = isSmallScreen ? 14.0 : 16.0;
    final bodyFontSize = isSmallScreen ? 13.0 : 14.0;
    final spacing = isSmallScreen ? 8.0 : 12.0;
    final radius = isSmallScreen ? 16.0 : 20.0;

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "AI Insight",
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(height: spacing),
          Text(
            insight,
            style: TextStyle(
              fontSize: bodyFontSize,
              color: Colors.white70,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
