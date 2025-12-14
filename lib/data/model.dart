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

  double get investedValue => qty * avgPrice;

  double get currentValue => qty * currentPrice;

  double get pnlPercent =>
      ((currentValue - investedValue) / investedValue) * 100;
}
