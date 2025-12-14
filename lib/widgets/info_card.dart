import 'package:flutter/material.dart';

class InfoSummaryCard extends StatelessWidget {
  final List<InfoItem> items;

  const InfoSummaryCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;

    final verticalPadding = isSmallScreen ? 10.0 : 14.0;
    final labelFontSize = isSmallScreen ? 14.0 : 17.0;
    final valueFontSize = isSmallScreen ? 14.0 : 15.0;
    final spacing = isSmallScreen ? 5.0 : 7.0;
    final radius = isSmallScreen ? 16.0 : 20.0;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items.map((item) {
          final color = _getValueColor(item);

          return Column(
            children: [
              Text(
                item.label,
                style: TextStyle(
                  fontSize: labelFontSize,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: spacing),
              Text(
                item.value,
                style: TextStyle(
                  fontSize: valueFontSize,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Color _getValueColor(InfoItem item) {
    if (item.valueColor != null) return item.valueColor!;

    final numericValue = double.tryParse(
      item.value.replaceAll('%', '').replaceAll('+', ''),
    );

    if (numericValue == null) return Colors.white;

    return numericValue >= 0
        ? const Color(0xFF22C55E) // green
        : const Color(0xFFEF4444); // red
  }
}

class InfoItem {
  final String label;
  final String value;
  final Color? valueColor;

  InfoItem({required this.label, required this.value, this.valueColor});
}
