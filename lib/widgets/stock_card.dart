import 'package:diversifi_assigment/data/model.dart';
import 'package:flutter/material.dart';

class StockCard extends StatelessWidget {
  final Stock stock;

  const StockCard({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    final isProfit = stock.pnlPercent >= 0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Left side
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                stock.symbol,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "Qty: ${stock.qty}  Avg: ₹${stock.avgPrice}",
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 124, 124, 124),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Current: ₹${stock.currentPrice}",
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 124, 124, 124),
                ),
              ),
            ],
          ),

          /// Right side (PnL)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${stock.pnlPercent.toStringAsFixed(2)}%",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isProfit ? Colors.green : Colors.red,
                ),
              ),
              Icon(
                isProfit ? Icons.trending_up : Icons.trending_down,
                color: isProfit ? Colors.green : Colors.red,
                size: 22,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
