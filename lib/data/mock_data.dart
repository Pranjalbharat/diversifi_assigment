import 'package:diversifi_assigment/data/model.dart';

final List<Stock> mockStocks = [
  Stock(
    symbol: "TCS",
    companyName: "Tata Consultancy Services",
    qty: 5,
    avgPrice: 3200,
    currentPrice: 3500,
    changes: {"day": 1.25, "week": 2.8, "month": 5.3},
    priceHistory: [3200, 3225, 3300, 3350, 3400, 3450, 3500],
    insight:
        "TCS has shown consistent upward movement this month due to strong quarterly results and steady deal wins.",
  ),
  Stock(
    symbol: "INFY",
    companyName: "Infosys Limited",
    qty: 10,
    avgPrice: 1400,
    currentPrice: 1500,
    changes: {"day": 0.85, "week": 1.9, "month": 4.1},
    priceHistory: [1400, 1420, 1450, 1475, 1480, 1490, 1500],
    insight:
        "Infosys continues to benefit from digital transformation demand, with stable margins and improving deal pipelines.",
  ),
  Stock(
    symbol: "HDFCBANK",
    companyName: "HDFC Bank Limited",
    qty: 7,
    avgPrice: 1500,
    currentPrice: 1550,
    changes: {"day": -0.35, "week": 0.9, "month": 2.2},
    priceHistory: [1500, 1490, 1505, 1510, 1525, 1540, 1550],
    insight:
        "HDFC Bank has seen gradual recovery driven by strong credit growth and improving asset quality.",
  ),

  Stock(
    symbol: "SBIBANK",
    companyName: "SBI Bank Limited",
    qty: 7,
    avgPrice: 1500,
    currentPrice: 1150,
    changes: {"day": -0.35, "week": 0.9, "month": 2.2},
    priceHistory: [1500, 1490, 1505, 1510, 1525, 1540, 1550],
    insight:
        "SBI Bank has seen gradual recovery driven by strong credit growth and improving asset quality.",
  ),
];
