class Stock {
  final String symbol;
  final String companyName;
  final int qty;
  final double avgPrice;
  final double currentPrice;
  final Map<String, double> changes;
  final List<double> priceHistory;
  final String insight;

  Stock({
    required this.symbol,
    required this.companyName,
    required this.qty,
    required this.avgPrice,
    required this.currentPrice,
    required this.changes,
    required this.priceHistory,
    required this.insight,
  });

  double get pnlPercentage {
    if (avgPrice == 0) return 0.0;
    return ((currentPrice - avgPrice) / avgPrice) * 100;
  }
}
