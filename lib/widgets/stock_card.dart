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
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;

    final isProfit = stock.pnlPercentage >= 0;

    final padding = isSmallScreen ? 12.0 : 16.0;
    final radius = isSmallScreen ? 14.0 : 18.0;

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStockInfo(stock, isSmallScreen),
          _buildPnlSection(stock, isProfit, isSmallScreen),
        ],
      ),
    );
  }

  Widget _buildStockInfo(Stock stock, bool isSmallScreen) {
    final symbolFontSize = isSmallScreen ? 16.0 : 18.0;
    final subTextFontSize = isSmallScreen ? 12.0 : 14.0;
    final spacingLarge = isSmallScreen ? 4.0 : 6.0;
    final spacingSmall = isSmallScreen ? 2.0 : 4.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          stock.symbol,
          style: TextStyle(
            fontSize: symbolFontSize,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        SizedBox(height: spacingLarge),
        Text(
          "Qty ${stock.qty}  Avg ₹${stock.avgPrice}",
          style: TextStyle(
            fontSize: subTextFontSize,
            color: const Color.fromARGB(255, 233, 232, 232),
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: spacingSmall),
        Text(
          "Current ₹${stock.currentPrice}",
          style: TextStyle(
            fontSize: subTextFontSize,
            color: const Color.fromARGB(255, 233, 232, 232),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildPnlSection(Stock stock, bool isProfit, bool isSmallScreen) {
    final pnlFontSize = isSmallScreen ? 16.0 : 18.0;
    final iconSize = isSmallScreen ? 24.0 : 30.0;
    final spacing = isSmallScreen ? 2.0 : 4.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "${stock.pnlPercentage.toStringAsFixed(2)}%",
          style: TextStyle(
            fontSize: pnlFontSize,
            fontWeight: FontWeight.bold,
            color: isProfit ? const Color(0xFF22C55E) : const Color(0xFFEF4444),
          ),
        ),
        SizedBox(height: spacing),
        Icon(
          isProfit ? Icons.trending_up : Icons.trending_down,
          size: iconSize,
          color: isProfit ? const Color(0xFF22C55E) : const Color(0xFFEF4444),
        ),
      ],
    );
  }
}
