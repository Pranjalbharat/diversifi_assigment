import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class StockDetailScreenShimmer extends StatelessWidget {
  const StockDetailScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          children: [
            const SizedBox(height: 8),
            _shimmerBox(height: 26),
            const SizedBox(height: 15),

            _shimmerBox(height: 42),
            const SizedBox(height: 10),
            _shimmerBox(height: 16, widthFactor: 0.6),
            const SizedBox(height: 15),

            _shimmerBox(height: 80),
            const SizedBox(height: 15),

            _shimmerBox(height: 80),
            const SizedBox(height: 15),

            _shimmerBox(height: 220, radius: 20),
            const SizedBox(height: 15),

            _shimmerBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _shimmerBox({
    required double height,
    double radius = 14,
    double widthFactor = 1,
  }) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFF151C2F),
      highlightColor: const Color(0xFF1F2937),
      child: FractionallySizedBox(
        widthFactor: widthFactor,
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}
