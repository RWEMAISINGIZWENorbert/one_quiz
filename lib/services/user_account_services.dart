// user_account_service.dart
import 'package:shared_preferences/shared_preferences.dart';

class UserAccountService {
  static const String _balanceKey = 'user_balance';

  Future<double> getBalance() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_balanceKey) ?? 0.0;
  }

  Future<void> addMoney(double amount) async {
    if (amount <= 0) return;
    
    final prefs = await SharedPreferences.getInstance();
    final currentBalance = await getBalance();
    await prefs.setDouble(_balanceKey, currentBalance + amount);
  }

  Future<void> deductMoney(double amount) async {
    if (amount <= 0) return;
    
    final prefs = await SharedPreferences.getInstance();
    final currentBalance = await getBalance();
    if (currentBalance >= amount) {
      await prefs.setDouble(_balanceKey, currentBalance - amount);
    }
  }
}