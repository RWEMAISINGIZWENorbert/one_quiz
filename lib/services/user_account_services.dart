// user_account_service.dart
import 'package:shared_preferences/shared_preferences.dart';

class UserAccountService {
  static const String _balanceKey = 'user_balance';
  static const String _betKey = 'my_bet';

  Future<double> getBalance() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_balanceKey) ?? 0.0;
  }

  Future<void> addMoney(double amount) async {
    if (amount <= 0) return;
    
    final prefs = await SharedPreferences.getInstance();
    final currentBalance = await getBalance();
    await prefs.setDouble(_balanceKey, currentBalance + amount);
    await getBalance();
  }

  Future<void> deductMoney(double amount) async {
    if (amount <= 0) return;
    
    final prefs = await SharedPreferences.getInstance();
    final currentBalance = await getBalance();
    if (currentBalance >= amount) {
      await prefs.setDouble(_balanceKey, currentBalance - amount);
      await getBalance();
    }
  }

  Future<void> betMoney(double amount) async {
    if (amount <= 0) return;
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_betKey, amount);
  }

  Future<double> viewBetted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_betKey) ?? 0.0;
}

}