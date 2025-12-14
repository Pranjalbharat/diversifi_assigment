import 'package:diversifi_assigment/data/model.dart';
import 'package:diversifi_assigment/widgets/ai_insight_card.dart';
import 'package:diversifi_assigment/widgets/info_card.dart';
import 'package:diversifi_assigment/widgets/price_chart_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:diversifi_assigment/provider/portfolio_provider.dart';

class StockDetailScreen extends StatelessWidget {
  const StockDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stock = context.watch<PortfolioProvider>().selectedStock;
    if (stock == null) {
      return const Scaffold(body: Center(child: Text("No stock selected")));
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          stock.symbol,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          children: [
            _header(stock),
            const SizedBox(height: 15),

            _pnlSection(stock),
            const SizedBox(height: 15),

            InfoSummaryCard(
              items: [
                InfoItem(
                  label: "Quantity:",
                  value: stock.qty.toString(),
                  valueColor: Colors.white,
                ),
                InfoItem(
                  label: "Avg Price:",
                  value: "₹${stock.avgPrice.toStringAsFixed(0)}",
                  valueColor: Colors.white,
                ),
                InfoItem(
                  label: "Current Price:",
                  value: "₹${stock.currentPrice.toStringAsFixed(0)}",
                  valueColor: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 15),

            InfoSummaryCard(
              items: [
                InfoItem(
                  label: "Day:",
                  value: "${stock.changes['day']!.toStringAsFixed(1)}%",
                ),
                InfoItem(
                  label: "Week:",
                  value: "${stock.changes['week']!.toStringAsFixed(1)}%",
                ),
                InfoItem(
                  label: "Month:",
                  value: "${stock.changes['month']!.toStringAsFixed(1)}%",
                ),
              ],
            ),

            const SizedBox(height: 15),
            PriceChartCard(stock: stock),

            const SizedBox(height: 15),
            AiInsightCard(insight: stock.insight),
          ],
        ),
      ),
    );
  }

  Widget _header(Stock stock) {
    return Text(
      stock.companyName,
      style: const TextStyle(fontSize: 22, color: Colors.white),
    );
  }

  Widget _pnlSection(Stock stock) {
    final pnlValue = (stock.currentPrice - stock.avgPrice) * stock.qty;

    final pnlPercent =
        ((stock.currentPrice - stock.avgPrice) / stock.avgPrice) * 100;

    final isPositive = pnlValue >= 0;

    return Column(
      children: [
        Text(
          "₹${stock.currentPrice.toStringAsFixed(2)}",
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          "${isPositive ? '+' : ''}${pnlPercent.toStringAsFixed(2)}% "
          "(₹${pnlValue.toStringAsFixed(2)})",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isPositive
                ? const Color(0xFF22C55E)
                : const Color(0xFFEF4444),
          ),
        ),
      ],
    );
  }
}
