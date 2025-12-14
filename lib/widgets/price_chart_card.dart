import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../data/model.dart';

class PriceChartCard extends StatelessWidget {
  final Stock stock;

  const PriceChartCard({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;

    final chartHeight = isSmallScreen ? 210.0 : 250.0;
    final padding = isSmallScreen ? 12.0 : 16.0;
    final radius = isSmallScreen ? 16.0 : 20.0;
    final barWidth = isSmallScreen ? 2.5 : 3.0;
    final bottomFontSize = isSmallScreen ? 9.0 : 10.0;

    final isPositive = stock.priceHistory.last >= stock.priceHistory.first;

    final lineColor = isPositive
        ? const Color(0xFF22C55E)
        : const Color(0xFFEF4444);

    return Container(
      height: chartHeight,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index < 0 || index >= stock.priceHistory.length) {
                    return const SizedBox.shrink();
                  }

                  return Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      stock.priceHistory[index].toStringAsFixed(0),
                      style: TextStyle(
                        fontSize: bottomFontSize,
                        color: Colors.white54,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: stock.priceHistory
                  .asMap()
                  .entries
                  .map((e) => FlSpot(e.key.toDouble(), e.value))
                  .toList(),
              isCurved: true,
              barWidth: barWidth,
              color: lineColor,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    lineColor.withOpacity(0.35),
                    lineColor.withOpacity(0.05),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
