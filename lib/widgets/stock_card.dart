import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:diversifi_assigment/data/model.dart';
import 'package:diversifi_assigment/provider/portfolio_provider.dart';

class StockCard extends StatelessWidget {
  final int index;
  const StockCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final stock = context.watch<PortfolioProvider>().stocks[index];
    final isProfit = stock.pnlPercentage >= 0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildStockInfo(stock), _buildPnlSection(stock, isProfit)],
      ),
    );
  }

  _buildStockInfo(Stock stock) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          stock.symbol,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          "Qty ${stock.qty}  Avg ₹${stock.avgPrice}",
          style: const TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 233, 232, 232),
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "Current ₹${stock.currentPrice}",
          style: const TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 233, 232, 232),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  _buildPnlSection(Stock stock, bool isProfit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "${stock.pnlPercentage.toStringAsFixed(2)}%",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isProfit ? const Color(0xFF22C55E) : const Color(0xFFEF4444),
          ),
        ),
        const SizedBox(height: 4),
        Icon(
          isProfit ? Icons.trending_up : Icons.trending_down,
          size: 30,
          color: isProfit ? const Color(0xFF22C55E) : const Color(0xFFEF4444),
        ),
      ],
    );
  }
}
