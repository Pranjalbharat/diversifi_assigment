import 'package:flutter/material.dart';
import 'package:diversifi_assigment/data/mock_data.dart';
import 'package:diversifi_assigment/data/model.dart';

class PortfolioProvider extends ChangeNotifier {
  final List<Stock> _stocks = mockStocks;
  Stock? _selectedStock;

  List<Stock> get stocks => _stocks;
  Stock? get selectedStock => _selectedStock;

  void selectStock(Stock stock) {
    _selectedStock = stock;
    notifyListeners();
  }

  double getPortfolioValue() {
    double total = 0;
    for (var stock in mockStocks) {
      total += stock.qty * stock.currentPrice;
    }
    return total;
  }
}
