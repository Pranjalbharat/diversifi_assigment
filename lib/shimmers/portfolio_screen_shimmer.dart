import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PortfolioScreenShimmer extends StatelessWidget {
  const PortfolioScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Diversifi",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4,
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _shimmerTotalValueCard(),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: 4,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (_, __) => _shimmerStockCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _shimmerTotalValueCard() {
    return Shimmer.fromColors(
      baseColor: const Color(0xFF151C2F),
      highlightColor: const Color(0xFF1F2937),
      child: Container(
        height: 90,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _shimmerStockCard() {
    return Shimmer.fromColors(
      baseColor: const Color(0xFF151C2F),
      highlightColor: const Color(0xFF1F2937),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
