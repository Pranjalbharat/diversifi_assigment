import 'package:diversifi_assigment/data/mock_data.dart';
import 'package:diversifi_assigment/widgets/stock_card.dart';
import 'package:flutter/material.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Portfolio"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Total Portfolio Value:",
                    style: TextStyle(
                      fontSize: 28,
                      color: Color.fromARGB(255, 61, 61, 61),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "₹3456.00",
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.separated(
                itemCount: mockStocks.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return StockCard(stock: mockStocks[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
