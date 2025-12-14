import 'package:flutter/material.dart';
import 'package:diversifi_assigment/data/mock_data.dart';
import 'package:diversifi_assigment/data/model.dart';

class PortfolioProvider extends ChangeNotifier {
  final List<Stock> _stocks = mockStocks;
  Stock? _selectedStock;
  bool _isLoading = true;

  List<Stock> get stocks => _stocks;
  Stock? get selectedStock => _selectedStock;
  bool get isLoading => _isLoading;

  PortfolioProvider() {
    _loadInitialData();
  }

  //Dealy for shimmer
  Future<void> _loadInitialData() async {
    await Future.delayed(const Duration(seconds: 2));
    _isLoading = false;
    notifyListeners();
  }

  void selectStock(Stock stock) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));
    _selectedStock = stock;
    _isLoading = false;
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
