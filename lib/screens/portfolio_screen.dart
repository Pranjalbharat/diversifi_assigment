import 'package:diversifi_assigment/shimmers/portfolio_screen_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:diversifi_assigment/screens/stock_detail.dart';
import 'package:diversifi_assigment/provider/portfolio_provider.dart';
import 'package:diversifi_assigment/widgets/stock_card.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final portfolio = context.watch<PortfolioProvider>();
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;

    if (portfolio.isLoading) {
      return const PortfolioScreenShimmer();
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Diversifi",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: isSmallScreen ? 20 : 28,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _totValueWidget(
              context,
              portfolio.getPortfolioValue(),
              isSmallScreen,
            ),
            SizedBox(height: isSmallScreen ? 14 : 20),
            Expanded(
              child: ListView.separated(
                itemCount: portfolio.stocks.length,
                separatorBuilder: (_, __) =>
                    SizedBox(height: isSmallScreen ? 8 : 12),
                itemBuilder: (context, index) {
                  final stock = portfolio.stocks[index];

                  return InkWell(
                    onTap: () async {
                      context.read<PortfolioProvider>().selectStock(stock);

                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) =>
                              const StockDetailScreen(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
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

  Widget _totValueWidget(
    BuildContext context,
    double totalValue,
    bool isSmallScreen,
  ) {
    final double titleFontSize = isSmallScreen ? 14 : 18;
    final double valueFontSize = isSmallScreen ? 22 : 28;
    final double padding = isSmallScreen ? 14 : 20;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(padding),
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
          Text(
            "Total portfolio value",
            style: TextStyle(fontSize: titleFontSize, color: Colors.white70),
          ),
          const SizedBox(height: 8),
          Text(
            "₹ ${totalValue.toStringAsFixed(2)}",
            style: TextStyle(
              fontSize: valueFontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
