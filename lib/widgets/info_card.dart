import 'package:flutter/material.dart';

class InfoSummaryCard extends StatelessWidget {
  final List<InfoItem> items;

  const InfoSummaryCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(20),
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
                style: const TextStyle(fontSize: 14, color: Colors.white70),
              ),
              const SizedBox(height: 6),
              Text(
                item.value,
                style: TextStyle(
                  fontSize: 14,
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
