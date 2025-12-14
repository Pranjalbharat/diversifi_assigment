# Diversifi – Flutter Portfolio App

A Flutter-based portfolio application that displays stock data, performance metrics, and detailed insights with a clean and modern UI.

---

## 🚀 How to Run the App

### Prerequisites
- Flutter SDK installed
- Android Studio / VS Code
- Android emulator or physical device

### Steps
- flutter pub get
- flutter run

Make sure a device or emulator is running before executing the app.

---

## ✅ What I Implemented

- Built two main screens:
  - Portfolio Screen
  - Stock Detail Screen
- Displayed portfolio-level and stock-level financial data
- Used local mock data structured like real API responses

---

## 🧠 Technical Decisions

- Used Provider + ChangeNotifier for state management
- Centralized stock data, selected stock, and loading state in PortfolioProvider
- Separated UI into small, reusable widgets
- Kept business logic outside UI widgets for clarity

---

## ✨ UX Enhancements

- Implemented shimmer loading to simulate API loading states
- Added smooth navigation without white flashes during screen transitions

---

## 📱 Responsiveness

- Implemented basic responsiveness using MediaQuery
- Adjusted:
  - Font sizes
  - Padding and spacing
  - Card sizes and chart height
- Focused only on key UI elements to avoid overengineering

---

## 📈 Charts & Visuals

- Used fl_chart for price history visualization
- Chart color adapts dynamically:
  - Green for positive trend
  - Red for negative trend
- Added gradient fill below the line for better visual clarity

---

## 🎯 Overall Outcome

- Clean and readable UI
- Smooth user experience
- Modular and scalable code structure

---

## 📝 Notes

- Data is currently loaded from local models
- Shimmer loading simulates real-world network behavior
- The project is structured to easily support API integration in the future