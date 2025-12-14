import 'package:diversifi_assigment/dummy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:diversifi_assigment/provider/portfolio_provider.dart';
import 'package:diversifi_assigment/widgets/stock_card.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final portfolio = context.watch<PortfolioProvider>();
    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Diversifi",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4,
            color: Colors.white,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _totValueWidget(portfolio.getPortfolioValue()),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: portfolio.stocks.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final stock = portfolio.stocks[index];

                  return InkWell(
                    onTap: () {
                      context.read<PortfolioProvider>().selectStock(stock);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => DummyScreen()),
                      );
                    },
                    child: StockCard(index: index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _totValueWidget(double totalValue) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF020617)],
        ),
        border: Border.all(color: Colors.white.withOpacity(0.09)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Total portfolio value",
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
          const SizedBox(height: 8),
          Text(
            "₹ ${totalValue.toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
